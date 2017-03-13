# metalsmith boilerplate

This is a boilerplate for building static websites with [metalsmith.io/](http://www.metalsmith.io).

## Setup:
Just clone the repo and `npm install`.

## Run:

### Build: for a single build just use this command
```
$ npm start
```

### Serve: a live-reload webserver will start (use this for dev)
```
$ npm run serve
```

### Build & Deploy: builds the website and deploys it to your server (needs configuration)
```
./jenkins.sh -ur
```

## Features
Important Hint: The order of the metalsmith-plugins in the `index.js` is on purpose and important.
Some plugins have to run before others, because they change the folder structure or move files

### Styling
- [sass](https://www.npmjs.com/package/metalsmith-sass) Just the famous css preprocessor
- [sass asset functions](https://www.npmjs.com/package/node-sass-asset-functions) Use the asset functions for e.g. inlining images in scss
- [autoprefixer](https://www.npmjs.com/package/metalsmith-autoprefixer) Never write vender prefixes or alternate synatx again

### Layout/Links
- [metalsmith-layouts](https://www.npmjs.com/package/metalsmith-layouts) The Plugin for metalsmith layouting (supports multiple template languages)
- [handlebars](https://www.npmjs.com/package/handlebars) One of the most popular Template languages for js
- [rootPath](https://www.npmjs.com/package/metalsmith-rootpath) With this plugin relative urls are easy to use
- [permalinks](https://www.npmjs.com/package/metalsmith-permalinks) Don't like the `*.html` in the url, get red of it, with this plugin

### i18n
- [i18n](https://www.npmjs.com/package/metalsmith-i18n) Use jsons with simple key - value for translations
- [multi language](https://www.npmjs.com/package/metalsmith-multi-language) This plugin will render multiple versions of your website

### Other
- [browser-sync (livereload)](https://www.npmjs.com/package/metalsmith-browser-sync) Hassle-free live reload for development
- [html minify](https://www.npmjs.com/package/metalsmith-html-minifier) Minifies the html output
- [metalsmith-static](https://www.npmjs.com/package/metalsmith-static) copy assets (images, fonts, etc.)
- [inline-source](https://www.npmjs.com/package/metalsmith-inline-source) Simple inlining of scripts, images, svgs, etc.
