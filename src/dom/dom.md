# DOM <!-- omit in toc -->

- [Dom](#dom)
- [Basic objects of DOM](#basic-objects-of-dom)
- [Selecting or finding nodes](#selecting-or-finding-nodes)
- [Traversal `Node` up and down](#traversal-node-up-and-down)
- [Manipulation – add, remove, copy, and create nodes in the DOM tree. You should know operations such as how to change the text content of a node and toggle, remove or add a CSS classname](#manipulation-%E2%80%93-add-remove-copy-and-create-nodes-in-the-dom-tree-you-should-know-operations-such-as-how-to-change-the-text-content-of-a-node-and-toggle-remove-or-add-a-css-classname)
- [Performance – touching the DOM can be expensive when you have many nodes, you should at least know about document fragments and node caching](#performance-%E2%80%93-touching-the-dom-can-be-expensive-when-you-have-many-nodes-you-should-at-least-know-about-document-fragments-and-node-caching)

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

`document.getElementsByTagName`:
- Returns a **live** HTMLCollection of elements with the given tag name. All descendants of the specified element are searched, but not the element itself. The returned list is live, which means it updates itself with the DOM tree automatically.
- When called on an HTML element in an HTML document, getElementsByTagName lower-cases the argument before searching for it.

`document.getElementById`:
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

## Manipulation – add, remove, copy, and create nodes in the DOM tree. You should know operations such as how to change the text content of a node and toggle, remove or add a CSS classname
## Performance – touching the DOM can be expensive when you have many nodes, you should at least know about document fragments and node caching
