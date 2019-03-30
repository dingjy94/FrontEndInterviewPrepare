# HTML

- [HTML](#html)
  - [HTML5](#html5)
  - [Semantic markup: Knowing which HTML tags that best represent the content you are displaying](#semantic-markup-knowing-which-html-tags-that-best-represent-the-content-you-are-displaying)
  - [Some important Tag attributes](#some-important-tag-attributes)
  - [Knowing how to declare your doctype and head](#knowing-how-to-declare-your-doctype-and-head)
  - [Accessibility concerns, for example, making sure an input checkbox has a larger responding area (use label “for”). Also, role=”button”, role=”presentation”, etc](#accessibility-concerns-for-example-making-sure-an-input-checkbox-has-a-larger-responding-area-use-label-for-also-rolebutton-rolepresentation-etc)

## HTML5
HTML (HyperText Markup Language) is a **markup language** used to tell browser how to structure the web page. HMTL5 is the newest version of HTML standard. Based on functions, HTML technologies can be classified into serval groups:
- semantics: allow you to describe content precisely
- connectivity: use new technology to communicate with server (Web socket...)
- offline and storage: store data in client side (`localStorage`, `sessionStorage`...)
- mulitmedia: `<video>` and `<audio>` are now first-class citizen
- 2D/3D graphics: more ways to present graphics (canvas, SVG..)
- performance: greater speed optimization and better use of hardware
- multiple devices access: various input and output devices (camera, touch screen ...)
- styling: More pretty and complicate style (support for CSS3)

## Semantic markup: Knowing which HTML tags that best represent the content you are displaying
- basic structure for common HTML doc
  ```html
  <html>
      <head></head>
      <body>
          <header></header>
          <nav></nav>
          <main>
              # ariticle can also in section
              <article>
                  <section></section>
              </article>
              <aside></aside> #side bar
          </main>
      </body>
  </html>
  ```
- title: `<h1><h2>....`
- link: `<a>`
- Use `<em>`, `<strong>` for important text, don't use them only for style
- list
  - `<ul>` for unorder list
  - `<ol>` for ordered list
  - `<dl>` for description list, `dt` for title, `dd` for description content
- multimedia: `<vedio>` and `<audio>`
- quotation
  - `<blockquote>` for block quotation
  - `<q>` for inline quotation
  - `<cite>` for contain the title of the content, not the link
- abbreviatation: `<abbr title="Full spell">Abb</abbr>`
- contact details of HTML doc: `<address>`
- substring/supstring: `<sub>` `<sup>`
- code block
  - `<pre>` to retain whitespace (Normally parser will parse whitespaces to one whitespace)
  - `<code>`
  - `<var>`: variable name
  - `<kbd>`: keyboard or other input
  - `<samp>`: output
- `<time datatime="2019-03-29">` for time
- table
  - `<th>` header
  - `<caption>` to describe
  - `<colgroup>` to style columns
  - `<thead><tbody><tfoot>`
- image
  - use `<figcaption>` in `<figure>` to annotate the image
  - add `alt`
- form
  - `<fieldset>` to seprate form to fields, `<legend>` to describe each fields
  - `<label for="">` to label each form wigets
  - `<datalist>` to provide autocomplete box
  - use `<button>` instead of `<input type="button">`

## Some important Tag attributes
- `disabled`
  - not respond to user actions, cannot be focused, `command` not fire
  - if form elements, not be submitted
  - Don't do `disabled="true"`, just `disabled`
  - no effect for `<a>`
- `async` and `defer`
  - `async` will fetch the script in parallel, and if availiable, execute the script. The order of scirpts is not promised.
  - `defer` will fetch the script in parallel, but wait for the HTML parsing to finish. The order of scripts is promised
- `data-*`: custom data attributes
  - allow proprietary information to be exchanged between HTML and its DOM representation by scripts
  - `HTMLElement.dataset` to access
  - name is lower case
  - Do not store content that should be visible and accessible in data attributes
  - search crawler may not index data attributes
  - if possible, use modern JS framework and store data in JS

## Knowing how to declare your doctype and head
- `<!DOCTYPE html>`: HTML5, `DOCTYPE` is used to tell the browser which language and version you're using
- `<html lang="en-US">: declare language
- `<head>`
  - `<title>`: title of overall HTML doc
  - `<meta>` attributes
    - `<meta charset="utf-8">`: document character encoding
    - `<meta name="author" content="Mike">`: name/content key-value pair, name specifies the type of metadata
    - `<meta property="" content="">`: property/content key-value pair, provide sites such as social media information about current site
  - `<link>`
    - `<link rel="stylesheet" href="">`: css
    - `<link rel="shortcut icon" href="">`: add icon
  - `<script src=""></script>`
    - JavaScript script
    - don't need to be in head


## Accessibility concerns, for example, making sure an input checkbox has a larger responding area (use label “for”). Also, role=”button”, role=”presentation”, etc


