# HTML interview questions
- [HTML interview questions](#html-interview-questions)
  - [Describe the difference between `<script>`, `<script async>` and `<script defer>`.](#describe-the-difference-between-script-script-async-and-script-defer)
  - [What are `data-*` attributes good for?](#what-are-data--attributes-good-for)
  - [Why you would use a srcset attribute in an image tag? Explain the process the browser uses when evaluating the content of this attribute.](#why-you-would-use-a-srcset-attribute-in-an-image-tag-explain-the-process-the-browser-uses-when-evaluating-the-content-of-this-attribute)
  - [What does a doctype do?](#what-does-a-doctype-do)
  - [Why is it generally a good idea to position CSS `<link>`s between `<head></head>` and JS `<script>`s just before `</body>`? Do you know any exceptions?](#why-is-it-generally-a-good-idea-to-position-css-links-between-headhead-and-js-scripts-just-before-body-do-you-know-any-exceptions)
  - [What kind of things must you be wary of when design or developing for multilingual sites?](#what-kind-of-things-must-you-be-wary-of-when-design-or-developing-for-multilingual-sites)
  - [Consider HTML5 as an open web platform. What are the building blocks of HTML5?](#consider-html5-as-an-open-web-platform-what-are-the-building-blocks-of-html5)
  - [Describe the difference between a cookie, sessionStorage and localStorage.](#describe-the-difference-between-a-cookie-sessionstorage-and-localstorage)
  - [What is progressive rendering?](#what-is-progressive-rendering)
  - [Have you used different HTML templating languages before?](#have-you-used-different-html-templating-languages-before)
  - [What HTML features promote accessibility?](#what-html-features-promote-accessibility)
-
## Describe the difference between `<script>`, `<script async>` and `<script defer>`.
- `<script>` will block the HTML parsing, fetch the script and execute it immediately;
- `<script async>` will fetch the script in parallel, and execute it immediately if available (block HTML parsing); the order of script execution is not promiesed, so only use on script don't depend on other scripts
- `<script defer>` will fetch the scirpt in parallel, and execute it after the HTML parsing; the order of script execution is promised
## What are `data-*` attributes good for?
`data-*` attribute can be used to store data in DOM iteself.

However, it's not safe because user can easily change it, and nowdays, it is better to store data in JS directly using modern framework.

## Why you would use a srcset attribute in an image tag? Explain the process the browser uses when evaluating the content of this attribute.
For responsive image: with `srcset`, we can provide different size or resolution images to different screens.

For size, the first value is the image name and the second is the width of the image in pixels.
```html
<img srcset="...jpg 320w,
          ...jpg 480w",
    sizes="(max-width:320px) 280px,
          (max-width:480px) 440px"
    src="", alt="">
```

For resolution:
```html
<img srcset="...jpg,
          ...jpg 1.5x,
          ...jpg 2x"
    src="", alt="">
```

Also, we can use `<picture>` and `<source>` to provide cropped images (different images) for different screen sizes.

```html
<picture>
  <source media="()max-width:799px" srcset="....jpg">
  <source media="(min-width: 800px)" srcset="...jpg">
  <img src="" alt="">
</picture>
```
## What does a doctype do?
It tell the browser which type and version of the document rules the document used.

## Why is it generally a good idea to position CSS `<link>`s between `<head></head>` and JS `<script>`s just before `</body>`? Do you know any exceptions?

- fetch CSS stylesheet before HTML body parsing help progressive rendering. If not, it may block the rendering process or show user unstyled webpage
- put `<script>` on bottom avoid block HTML parsing and make sure all DOM elements are ready before fetch and execute script

## What kind of things must you be wary of when design or developing for multilingual sites?
- use `<html>` `lang` attribute
- directing the user to their language and allow user to switch to different language
- don't put text in image
- Be careful on words and sentences length because same words and sentence in different language have different length
- Be careful on colors
- change date format
## Consider HTML5 as an open web platform. What are the building blocks of HTML5?
- semantics: new semantic elements
- connectivity: web socket, server-set event (allow server to push event to client), WebRTC
- storage: `sessionStorage` and `localStorage`
- multimedia: `<audio>` and `<video>`
- 2D/3D graphics: `<canvas>`, WebGL, SVG
- performance
- different devices access: camera, touch screen, geolocation..
- styling: CSS3

## Describe the difference between a cookie, sessionStorage and localStorage.
All these three are used to store data in client side.

|     | `cookie` | `localStorage` | `sessionStorage` |
| --- | -------- | -------------- | ---------------- |
| Initiator | Client or server | Client | Client     |
| Expiry | Manually set | Forever | Tab Close        |
| sent to server with every HTTP request| Send in Cookie header | NO | No|
|Capacity (per domain)| 4kb | 5MB | 5MB |
|Accessibility| Any window | Any window | Same tab |

## What is progressive rendering?
Techniques to render content as quickly as possible
- images lazy loading: not load all images, load the images only when user scroll to the part display the images
- prioritizing visible content: render part of the page first, use deferred javascirpt to load other

## Have you used different HTML templating languages before?
Jinjia (Flask), pug, ejs (express.js)...

## What HTML features promote accessibility?
- semantic elements
- `alt` for images
- `label` for form elements
- `accesskey`
