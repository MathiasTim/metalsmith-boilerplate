#!/bin/bash -ve


# for measuring the runtime of the script
start=$(date +%s)

# replace 'your server' with your actual server to use this script

################################################################################
# Global Parameters
################################################################################
# target on 'your' server
publishWWWVersionTo="" # insert upload location here


################################################################################
# help function
################################################################################
showHelp() {
  echo "Build script for" # insert project name here
  echo ""
  echo "Usage: $0"
  echo ""
  echo "  -h         show help"
  echo "  -u         upload build folder to 'your server'"
  echo "  -r         reinstall npm modules"
  echo ""
  exit 0
}


################################################################################
# collect parameters
################################################################################
# Reset in case getopts has been used previously in the shell.
OPTIND=1

echo ""
echo "Building with options: "

# default all options to false
upload=0
reinstall=0
getProvisioningProfile=0

while getopts "h?ur" opt; do
  case "$opt" in
    h | \?)
      showHelp
    ;;
    u) upload=1
    echo "- upload website to 'your server'"
    ;;
    r) reinstall=1
    echo "- reinstall npm"
    ;;
  esac
done

shift $((OPTIND - 1))

[ "$1" = "--" ] && shift

echo ""


################################################################################
# run npm and bower install
################################################################################
function installNpm() {
  rm -rf build
  if [[ $reinstall == 1 || ! -e node_modules ]]; then
    rm -rf node_modules
    yarn;
  fi
}


################################################################################
# convert seconds to human readable duration. used to display duration
################################################################################
function convertsecs() {
 ((h=${1}/3600));
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "%02d:%02d:%02d\n" $h $m $s
}


################################################################################
# upload website to 'your server'
################################################################################
function uploadWebsite() {
  if [[ $upload == 1 ]]; then

    # make folder readable to the www user on 'your server'
    chmod -R 775 build

    # create folder if it does not yet exists
    ssh 'your-server' mkdir -p ${publishWWWVersionTo}

    # transfer to 'your server'. delete files that are not in the source directory
    rsync -ah --stats --progress --delete-after build/ 'your-server':/${publishWWWVersionTo}
  fi
}


################################################################################
# build website
################################################################################
function build() {
  # build
  npm run build:prod
}


################################################################################
# run build
################################################################################
# run npm and bower install
installNpm

# build Website
build

# Upload www version to 'your' website
uploadWebsite

end=$(date +%s)
printf "Runtime: %s mm:ss" "$(convertsecs $((end - start)))"
