# React and Redux interview questions
- [React and Redux interview questions](#react-and-redux-interview-questions)
  - [React](#react)
    - [How does React work?](#how-does-react-work)
    - [What are the advantages of using React?](#what-are-the-advantages-of-using-react)
    - [What is the difference between a Presentational component and a Container component?](#what-is-the-difference-between-a-presentational-component-and-a-container-component)
    - [What are the differences between a class component and functional component?](#what-are-the-differences-between-a-class-component-and-functional-component)
    - [What is the difference between state and props?](#what-is-the-difference-between-state-and-props)
    - [Name the different lifecycle methods?](#name-the-different-lifecycle-methods)
    - [Where in a React component should you make an AJAX request?](#where-in-a-react-component-should-you-make-an-ajax-request)
    - [What are controlled components?](#what-are-controlled-components)
    - [What are refs used for in React?](#what-are-refs-used-for-in-react)
    - [How to create refs?](#how-to-create-refs)
    - [What are forward refs?](#what-are-forward-refs)
    - [What is a higher order component?](#what-is-a-higher-order-component)
    - [What advantages are there in using arrow functions?](#what-advantages-are-there-in-using-arrow-functions)
    - [Why is it advised to pass a callback function to setState as opposed to an object?](#why-is-it-advised-to-pass-a-callback-function-to-setstate-as-opposed-to-an-object)
    - [What is the alternative of binding this in the constructor?](#what-is-the-alternative-of-binding-this-in-the-constructor)
    - [How would you prevent a component from rendering?](#how-would-you-prevent-a-component-from-rendering)
    - [When rendering a list what is a key and what is its purpose?](#when-rendering-a-list-what-is-a-key-and-what-is-its-purpose)
    - [What is the purpose of super(props)?](#what-is-the-purpose-of-superprops)
    - [What is JSX?](#what-is-jsx)
    - [What is equivalent of the following using React.createElement?](#what-is-equivalent-of-the-following-using-reactcreateelement)
    - [What is Children?](#what-is-children)
    - [Why would you eject from create-react-app?](#why-would-you-eject-from-create-react-app)
    - [What is the difference between Element and Component?](#what-is-the-difference-between-element-and-component)
    - [How to create components in React?](#how-to-create-components-in-react)
    - [What are Pure Components?](#what-are-pure-components)
    - [Why should we not update the state directly?](#why-should-we-not-update-the-state-directly)
    - [What is the difference between HTML and React event handling?](#what-is-the-difference-between-html-and-react-event-handling)
    - [What are synthetic events in React?](#what-are-synthetic-events-in-react)
    - [What is inline conditional expressions?](#what-is-inline-conditional-expressions)
  - [Redux](#redux)
    - [What is redux?](#what-is-redux)
    - [What is a store in redux?](#what-is-a-store-in-redux)
    - [What is an action?](#what-is-an-action)
    - [What is a reducer?](#what-is-a-reducer)
    - [What is redux thunk used for?](#what-is-redux-thunk-used-for)
    - [What is a pure function?](#what-is-a-pure-function)
    - [What do you like about React?](#what-do-you-like-about-react)
    - [What don't you like about React?](#what-dont-you-like-about-react)

## React
### How does React work?
The Basic thought of React is `UI = func(data)`, which means UIs are simply a projection of data into a different form of data. And in React, the `func` is a (reusable) component. So the basic of React is that developer tell React what the UI should look like based on current state (data). In order to do this render process efficiently, React implement virtual DOM. When a state in the component changes, React use a diff function to check compare the
old VDOM tree and current tree to determine which part needs to be change (reconciliation), and then render the DOM based on this 'patch'.

### What are the advantages of using React?
- Testable, easy to do unit test
- Readable, JSX is easy to read and understand the layout
- Can used with pure js and other framework/library
- Reusable component
- SSR
- backup by larege company (dogfooding) and large community

### What is the difference between a Presentational component and a Container component?
- Presentational component basicly only receive a props and reture a layout (React Element). They are often stateless, only care about the layout
- Container component: They care more on the logic and data caculation and provide data (props) to presentational component. Also, they are often stateful.

### What are the differences between a class component and functional component?
- In class component, you can use state and life cycle hooks.
- In functional component, the component only receive a prop and reture a layout

### What is the difference between state and props?
- Commpon:
  - plain JS objects
  - trigger render update
  - deterministic, which means the same props and state combination for the same component generate the same output
- Difference: In a word, if the component need to change the data at some point, the data should be a state of this component; otherwise props
  - props are the configuration of components, it's immutable
  - state is serializable representation of one point in time—a snapshot. It's mutable, and also it's private to the component
  - state increases complexity and reduces predictability

### Name the different lifecycle methods?
[life cycle diagram](http://projects.wojtekmaj.pl/react-lifecycle-methods-diagram/)
- mounting
  - `constructor()`
  - `static getDerivedStateFromProps()` (rare use)
  - `render()`
  - `componentDidMount()`
- updating
  - `static getDerivedStateFromProps()` (rare use)
  - `shouldComponentUpdate()`
  - `render()`
  - `getSnapshotBeforeUpdate()`
  - `componentDidUpdate()` (for side effect)
- unmounting
  - `componentWillUnmount()`
### Where in a React component should you make an AJAX request?
In `componentDidMount()`. For current component API, this is the only place fit for side effect. In old API, there are also many reason don't put AJAX (and any other side effect) in `componentWillMount()`, but the main reason seems to because the implementation of asynchronous rendering (see this [issue](https://github.com/reactjs/reactjs.org/issues/302#issuecomment-345445888)).

### What are controlled components?
An input form element whose value is controlled by React (instead of DOM) in this way is called a “controlled component”. Value kept in state, and `onChange` fire a function to `setState()`.

### What are refs used for in React?
Refs provide a way to access DOM nodes or React elements created in the render method. Use cases:
- Managing focus, text selection, or media playback.
- Triggering imperative animations.
- Integrating with third-party DOM libraries.
Avoid use `refs` if possible.

### How to create refs?
- `React.createRef()`
- ref callback

### What are forward refs?
Ref forwarding is an opt-in feature that lets some components take a ref they receive, and pass it further down (in other words, “forward” it) to a child.

### What is a higher order component?
A higher-order component is a function that takes a component and returns a new component.

### What advantages are there in using arrow functions?
`this` binding. Arrow funtions will bind this to lexical scope, so when you translate function in props, it will work correctelly.

### Why is it advised to pass a callback function to setState as opposed to an object?
Because this.props and this.state may be updated asynchronously, you should not rely on their values for calculating the next state.

### What is the alternative of binding this in the constructor?
ES7 property initializers. Or use arrow function as callback (will create new callback each time the component render).

### How would you prevent a component from rendering?
- in `render`, return `null`
- to avoid unnecessary rerender: `shouldComponentUpdate()` or `React.PureComponent`

### When rendering a list what is a key and what is its purpose?
You should give unque key attribute to each component rendered from list. It help React to decide which element should be changed during reconcilation.

### What is the purpose of super(props)?
- In ES6, subclass has to call super() if they have constructor
- If you want to access 'props' by `this.props`, you need to send arguments in it

### What is JSX?
It's a JavaScript extension. It's describe what the layout should looks like in a markup language format. It will be transformed to a normal JS object (React Element).

### What is equivalent of the following using React.createElement?
Q:
```javascript
const element = (
  <h1 className="greeting">
    Hello, world!
  </h1>
);
```
A:
```javascript
React.createElement('h1', {className: 'greeting'}, 'Hello, world!'); // React.createElement(type, [props], [children])
```

### What is Children?
The content between the opening and ending tags of JSX.

### Why would you eject from create-react-app?
To configure Babel and webpack.

### What is the difference between Element and Component?
- An element is a plain object describing a component instance or DOM node and its desired properties.
- So, component is the function (or class)
- (See this [blog](https://reactjs.org/blog/2015/12/18/react-components-elements-and-instances.html))

### How to create components in React?
- functional component
- `React.Component`

### What are Pure Components?
`React.PureComponent`, it's a component handle `shouldComponentUpdate()`. (only shallow check)

### Why should we not update the state directly?
`setState()` will not only change state but also trigger rerender.

### What is the difference between HTML and React event handling?
- javascript vs html (and this why inline event listener in HTML is not good practice, you should separate HTML and JS file)
- React event is a cross-brower wrapper around the native event
- HTML event name is lowercase vs React camelCase
- HTML can `return false` to prevent vs React must call `event.preventDefault()`

### What are synthetic events in React?
SyntheticEvent is a cross-browser wrapper around the browser's native event. It's API is same as the browser's native event, including stopPropagation() and preventDefault(), except the events work identically across all browsers.

### What is inline conditional expressions?
`condition && <Element />`

## Redux
### What is redux?
It's a library to help web application to manage state.
- Single source of truth (one store)
- State is immutable
- Change must made with pure function

### What is a store in redux?
Store is the object bring action together. It store the state and subscribers.

### What is an action?
Actions are payloads of information that send data from your application to your store.

### What is a reducer?
Reducers specify how the application's state changes in response to actions sent to the store. It's must be a pure function.

### What is redux thunk used for?
Redux Thunk is a commonly used middleware for asynchronous orchestration. A thunk is a function that returns another function that takes parameters `dispatch` and `getState`.

### What is a pure function?
A function don't make any side effect and don't mutate input arguments.

### What do you like about React?
### What don't you like about React?
