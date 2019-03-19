# DOM <!-- omit in toc -->

- [Dom](#dom)
- [Basic objects of DOM](#basic-objects-of-dom)
- [Selecting or finding nodes](#selecting-or-finding-nodes)
- [Traversal `Node` up and down](#traversal-node-up-and-down)
- [Add, remove, copy, and create nodes in the DOM tree.](#add-remove-copy-and-create-nodes-in-the-dom-tree)
- [Change the text content and HTML markup of a node](#change-the-text-content-and-html-markup-of-a-node)
- [Toggle, remove or add a CSS classname](#toggle-remove-or-add-a-css-classname)
- [Performance – touching the DOM can be expensive when you have many nodes, you should at least know about document fragments and node caching](#performance--touching-the-dom-can-be-expensive-when-you-have-many-nodes-you-should-at-least-know-about-document-fragments-and-node-caching)
- [TODO: Different document, `document.importNode()`...](#todo-different-document-documentimportnode)

## Dom
The Document Object Model (DOM) is a programming interface for HTML and XML documents. It represents the page so that programs can change the document structure, style, and content. The DOM represents the document as nodes and objects. That way, programming languages can connect to the page.

API (HTML or XML page) = DOM + JS (scripting language)

The DOM was designed to be independent of any particular programming language, making the structural representation of the document available from a single, consistent API.

## Basic objects of DOM
- `window`: The Window interface represents a window containing a DOM document
- `document`: The root of the document itself
- `element`: Element inherits from the generic Node interface, and together these two interfaces provide many of the methods and properties you use on individual elements.
- `Node`: Node is an interface from which a number of DOM API object types inherit. It allows those types to be treated similarly; for example, inheriting the same set of methods, or being tested in the same way.

## Selecting or finding nodes

`document.getElementsByTagName()`:
- Returns a **live** HTMLCollection of elements with the given tag name. All descendants of the specified element are searched, but not the element itself. The returned list is live, which means it updates itself with the DOM tree automatically.
- When called on an HTML element in an HTML document, getElementsByTagName lower-cases the argument before searching for it.

`document.getElementById()`:
- Returns an Element object representing the element whose id property matches the specified string.
- only available as a method of the global document object, and not available as a method on all element objects in the DOM. Because `id` must be unique througout the DOM, no 'local' version needed.

`document.querySelector(selectors)`:
- Returns the first Element within the document that matches the specified selector, or group of selectors
- `selectors`: A DOMString containing one or more selectors to match. This string must be a valid CSS selector string.
- Work on new browser: IE 8+, Firefox 3.5+, Safari 3.2+
- eg.
  ```javascript
  var el = document.querySelector("div.user-panel.main input[name='login']");
  ```

`document.querySelectorAll()`:
-  returns a **static (not live)** NodeList representing a list of the document's elements that match the specified group of selectors.

## Traversal `Node` up and down
Node is an interface from which a number of DOM API object types inherit. It allows those types to be treated similarly; for example, inheriting the same set of methods, or being tested in the same way.

The following interfaces all inherit from Node’s methods and properties: `Document`, `Element`, `Attr`, `CharacterData` (which `Text`, `Comment`, and `CDATASection` inherit), `ProcessingInstruction`, `DocumentFragment`, `DocumentType`, `Notation`, `Entity`, `EntityReference`.

`Node.parentNode`:
- **Read-only** property returns the parent of the specified node in the DOM tree

`Node.firstChild`:
- **Read-only** property returns the node's first child in the tree, or null if the node has no children.
- will also return `#text` and `#comment` node. Any **whitespace** (single, multiple spaces, tabs, returns ...) will create a `#text` node. To avoid the issue, use `ParentNdoe.firstElementChild`

`ParentNode.firstElementChild`:
- **Read-only** property returns the object's first child Element, or null if there are no child elements.
- IE 10+

`Node.lastChild`
- **Read-only** property returns the last child of the node. If its parent is an element, then the child is generally an element node, a text node, or a comment node.

`Node.childNodes`
- **Read-only** property returns a live NodeList of child nodes of the given element where the first child node is assigned index 0.
- The items in the collection of nodes are objects and not strings.
- Use `ParentNode.children` to get elements only.

See more on [Document Object Model (DOM)](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model).

## Add, remove, copy, and create nodes in the DOM tree.
`document.createElement(tagName[, option])`
- Creates the HTML element specified by tagName, or an HTMLUnknownElement if tagName isn't recognized.
- @tagName: A string that specifies the type of element to be created
- @option: single property named `is`, value is tag name for a custom element previously defined using `customElements.define()`

`document.createTextNode(data)`
- create a new Text node

`node.appendChild(aChild)`
- adds a node to the end of the list of children of a specified parent node
- If the node already has a parent, the node is first removed, then appended at the new position.
- **A node can't be in two points of the document simultaneously.**
- return appended child

`parentNode.insertBefore(newNode, referenceNode)`
-  inserts a node before the reference node as a child of a specified parent node
- So if the new node already has a parent, the node is first removed
- return `newNode`
- if `referenceNode` is `null`, new node is inserted at the end of the list of child nodes. (**`referenceNode` is not an optional parameter, need to pass Node or null**)

`targetElement.insertAdjacentElement(position, element);`
- inserts a given element node at a given position relative to the element it is invoked upon

`node.cloneNode([deep])`
- Returns a duplicate of the node on which this method was called.
- @deep - optional: `true` if deep clone (clone children), although optional, we should always provide the argument because before Firefox 29 , default is `true`, but now is `false`
- It does not copy event listeners added using `addEventListener()` or those assigned to element properties
- The duplicate node returned  is not part of the document until it is added to another node that is part of the document
- If deep is set to `false`, child nodes are not cloned. Any text that the node contains is not cloned either, as it is contained in one or more child Text nodes.
- **If the original node has an ID and the clone is to be placed in the same document, the ID of the clone should be modified to be unique**. (Name may also need to change depend on requirement)

`node.removeChild(child)`
- return removed child node
- The removed child node still exists in memory, but is no longer part of the DOM. Use varaible to keep object reference so it can be reused.
- If not keep reference, it will immediately become unusable and irretrievable, and will usually be automatically deleted from memory after a short time.
- 2 different errors:
  - `Uncaught NotFoundError: Failed to execute 'removeChild' on 'Node': The node to be removed is not a child of this node.`: child existing on the DOM
  - `Uncaught TypeError: Failed to execute 'removeChild' on 'Node': parameter 1 is not of type 'Node'.`: child doesn't exist on the DOM

`node.replaceChild(newChild, oldChild)`
- if `newChild` already exists in DOM, removed first
- return replaced node, same as `oldChild`

`node.hasChildNodes()`
- returns a Boolean value indicating whether the given Node has child nodes or not.

## Change the text content and HTML markup of a node

`element.innerHTML`
- gets or sets the HTML or XML markup contained within the element.
- A `DOMString` containing the HTML serialization of the element's descendants. (DOMString is a UTF-16 String. As JavaScript already uses such strings, DOMString is mapped directly to a String.)
- Setting value removes all of the element's descendants and replaces them with nodes constructed by parsing the HTML given in the string given string
  - The given value is parsed as HTML or XML, resulting in a `DocumentFragment` object representing the new set of DOM nodes.
  - If the element whose contents are being replaced is a `<template>` element, then this `<template>`'s `content attribute` is replaced with the new `DocumentFragment`. (so the element is still `<template>`)
  - For all other elements, the element's contents are replaced with the nodes in the new `DocumentFragment`

`element.insertAdjacentHTML(position, text)`
- @position: A DOMString:
  - `'beforebegain'`: insert before element
  - `'afterbegain'`: append before first child
  - `'beforeend'`: append after last child
  - `'afterend'`: insert after element

  ```html
  <!-- beforebegin -->
  <p>
    <!-- afterbegin -->
    foo
    <!-- beforeend -->
  </p>
  <!-- afterend -->
  ```
- does not reparse the element, so does not corrupt the existing elements inside that element. This avoids serialization, so much faster than direct `innerHTML` manipulation.
- It is not recommended use `insertAdjacentHTML()` when inserting plain text; instead, use the `Node.textContent` property or the `Element.insertAdjacentText()` method. This doesn't interpret the passed content as HTML, but instead inserts it as raw text.

`HTMLelement.innerText`
- represents the **"rendered"** text content of a node and its descendants.
- A `DOMString` representing the **rendered** text content of an element.
- If element itself is not rendered, return value same as `Node.textContent`
- **innerText is aware of things like `<br>`, `<style>` tags, and ignores hidden elements.**

`Node.textContent`
- represents the text content of a node and its descendants
- if node is `document, DOCTYPE, notation`, return `null`
- if `CDATA section, comment, processing instructon, text node` return the text inside
- For other, return concatenation of `textContent` of every child node

`innerText` vs `textContent`
- `textContent` gets the content of all elements, including `<script>` and `<style>` elements
- `textContent` returns every element in the node. In contrast, `innerText` is aware of styling and won’t return the text of “hidden” elements.
- `innerText` takes CSS styles into account, so it triggers a reflow to ensure up-todate computed style (**Which means slow and computationally expensive!! Should be avoided if possible**)

`innerHTML` vs `textContent`
- Sometimes people use `innerHTML` to retrieve or write text inside an element, but `textContent` has better performance because its value is not parsed as HTML
- Using `textContent` can prevent XSS attacks

`element.insertAdjacentText(position, DOMString);`
-  inserts a given text node at a given position relative to the element
-
## Toggle, remove or add a CSS classname
## Performance – touching the DOM can be expensive when you have many nodes, you should at least know about document fragments and node caching

## TODO: Different document, `document.importNode()`...
