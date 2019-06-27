# FrontEnd Interview Prepare <!-- omit in toc -->
Front end knowledge note, mainly for preparing the interview.

## Contents <!-- omit in toc -->
### Table of Contents <!-- omit in toc -->
- [JavaScript](#javascript)
- [DOM (without jQuery)](#dom-without-jquery)
- [CSS](#css)
- [HTML](#html)
- [System Design (For Front End)](#system-design-for-front-end)
- [Web Performance](#web-performance)
- [Network](#network)
- [General Web Knowledge](#general-web-knowledge)
- [Data Structure and Algorithm](#data-structure-and-algorithm)
- [React](#react)
- [Component Practice](#component-practice)

### JavaScript


- host objects vs native object
  - `function Person(){}` vs `var person = Person` vs `var person = new Person()`
- pros and cons of extending built-in JavaScript objects
- Composition and high order functions.
  - What is the definition of a higher-order function?
- Event delegation and bubbling, capturing.
- Type Coercion using typeof, instanceof and Object.prototype.toString.
- What's the difference between feature detection, feature inference, and using the UA string?
- Handling asynchronous calls with callbacks, promises, await and async.
- Explain the difference between synchronous and asynchronous functions.

- Event loop
  - What is the difference between call stack and task queue?
- `null` vs `undefined` vs undeclared
  - How to check
- What language constructions do you use for iterating over object properties and array items?
- `Array.forEach` vs `Array.map()`
  - why pick one versus other
- `attribute` vs `property`
- `==` vs `===`

- Can you give an example for destructuring an object or an array?
- Can you give an example of generating a string with ES6 Template Literals?
- Can you give an example of a curry function and why this syntax offers an advantage?
- What are the benefits of using `spread syntax` and how is it different from `rest syntax`?
- How can you share code between files?

- Why is it called a Ternary operator, what does the word "Ternary" indicate?
- What is strict mode? What are some of the advantages/disadvantages of using it?
- What are some of the advantages/disadvantages of writing JavaScript code in a language that compiles to JavaScript?
- What tools and techniques do you use debugging JavaScript code?
-

### DOM (without jQuery)
- [DOM Basic](/src/dom/dom.md)

### CSS
-  Layout: sitting elements next to each other and how to place elements in two columns vs three columns
-  how to target elements using child or direct descendant selectors
-  when to use classes vs IDs
-  Responsive design – changing an element’s dimensions based on the browser width size
-  Adaptive design – changing an element’s dimensions based on specific break points
-  Specificity – how to calculate a selector’s specificity and how the cascade affects attributes
-  Appropriate namespacing and naming of classnames

[Interview Questions](src/css/interview.md)

### HTML
- Semantic markup: Knowing which HTML tags that best represent the content you are displaying
- Tag attributes, such as disabled, async, defer and when to use data-*.
- Knowing how to declare your doctype (most people are not writing new pages every day and forget this) and what meta tags are available to use
- Accessibility concerns, for example, making sure an input checkbox has a larger responding area (use label “for”). Also, role=”button”, role=”presentation”, etc

### System Design (For Front End)
Design the front end architecture of common applications. These questions are usually vague, along the lines of “design a site like Pinterest” or “tell me how you would build a shopping checkout service?”.

- Rendering – client-side (CSR), server-side (SSR) and universal rendering.
- Layout – if you’re designing a system used by multiple development teams, you need to think about building components and if you require teams to follow a consist markup to use said components.
- State management such as choosing between unidirectional data flow or two-way data binding. You should also think about if your design will follow a passive or reactive programming model, and how components related to each other for example Foo–> Bar or Foo –>Bar.
- Async flow – your components may need to communicate in real-time with the server. The design you propose should consider XHR vs bidirectional calls. If your interviewer asks you to support older browsers, your design will need to choose between hidden iFrames, script tags or XHR for messaging. If not, you could propose using websockets or you might decide server-sent events (SSE) are better
- Separation of concerns – Model-View-Controller (MVC), Model-View-ViewModel (MVVM) and Model-View-Presenter (MVP) patterns
- Multi-device support – Will your design use the same implementation for the web, mobile web, and hybrid apps or will they be separate implementations? If you were building a site like Pinterest, you might consider three columns on the web but only one column on mobile devices. How would your design handle this?
- Asset delivery – In large applications, it’s not uncommon to have independent teams owning their own codebases. These different codebases probably have dependencies on each other and each usually has their own pipeline to release changes to production. Your design should consider how assets are built with dependencies (code splitting), tested (unit and integration tests) and deployed(CI?). You should also think about how you will vend assets through a CDN or inline them to reduce network latency.

### Web Performance
- Critical rendering path.
- Service workers
- Image optimizations
- Lazy loading and bundle splitting.
- General implications of HTTP/2 and server-push.
- When to prefetch and preload resources.
- Reduce browser reflows and when to promote an element to the GPU.
- Differences between the browser layout, compositing and painting
- virtual DOM?

### Network
- HTTP requests – GET and POST along with associated headers such as Cache-Control, ETag, Status Codes, and Transfer-Encoding.

### General Web Knowledge
- REST vs RPC
- Security – when to use JSONP, CORs, and iFrame policies
- SEO for website.
- Test

### Data Structure and Algorithm

### React
- [React Interview Questions](src/react/interview.md)

### Component Practice
Component practice with vanilla JavaScript
- [Offcanvas](https://codepen.io/dingjy94/pen/zVEQPY?editors=1111)
## TODO LIST <!-- omit in toc -->
- [ ] Add FCC questions

## Reference <!-- omit in toc -->
- [Preparing for a Front-End Web Development Interview at Top Tech Companies](http://davidshariff.com/blog/preparing-for-a-front-end-web-development-interview-in-2017/)
- [Front-end Job Interview Questions](https://github.com/h5bp/Front-end-Developer-Interview-Questions)
- [Front End Interview Handbook (Answer for Front-end Job Interview Questions)](https://github.com/yangshun/front-end-interview-handbook)
- [Front End Interview Questions and Answers](https://github.com/wwwebman/front-end-interview-questions#javascript-coding-questions)
- [Testdome (Interview questions website)](https://www.testdome.com/d/javascript-interview-questions/2)
- [You Don't know JS](https://github.com/getify/You-Dont-Know-JS)
- [FE-Cookbook](https://github.com/hijiangtao/FE-Cookbook)
- [Easy Application Company List](https://github.com/j-delaney/easy-application)
