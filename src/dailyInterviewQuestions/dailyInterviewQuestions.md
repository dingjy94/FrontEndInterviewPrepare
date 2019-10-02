# Daily Interview Questions

Questions from [Daily-Interview-Question](https://github.com/Advanced-Frontend/Daily-Interview-Question/blob/master/datum/summary.md).

### Why we need 'key' in React (or Vue) component
React use diff to compute the differents between old vdom tree and new vdom tree. 'key' can help React to find the corresponding node faster and more correctely.

### ['1', '2', '3'].map(parseInt), what & why
`[1, Nan, Nan]`. `map` will give `parseInt` two parameters, first is the array element and the second is the index. For `parseInt(string, radix)`, if radix is 0 and string doesn't begin with '0' or '0x', the radix is just 10. For `parseInt('2', 1)` and `parseInt('3', 2)`, retrun Nan because there is no `2` when radix is 1 and no `3` when radix is `2`.

### debounce vs throttle
- Throttling will delay executing a function. It will reduce the notifications of an event that fires multiple times. The function will only be called onece in a specified period of time.
```javascript
function throttle(callback) {
    let canRun = true;
    return function() {
        if (!canRun) {
            return; // don' trun now
        }

        setTimeout(() => {
            callback.apply(this, arguments);
            canRun = true;
        }, 500);
    }
}
```
- Debouncing will bunch a series of sequential calls to a function into a single call to that function. It ensures that one notification is made for an event that fires multiple times. The original function be called after the caller stops calling the decorated function after a specified period.
```javascript
function debounce(callback) {
    let timeout = null;
    return function() {
        clearTimeout(timeout);
        setTimeout(() => {
            callback.apply(this, arguments);
        }, 500)
    }
}
```

### Set vs Map vs WeakSet vs WeakMap
`Set` is a HashSet store unique value,
`Map` is a HashMap store key-value pair, key is unique
`WeakSet`, `WeakMap` is collection of `object`, not enumerable, the key is held weakly (If an object that is being used as the key of a WeakMap key/value pair is only reachable by following a chain of references that start within that WeakMap, then that key/value pair is inaccessible and is automatically removed from the WeakMap.). Use these when you don't want a set/map prevent the key from garbage collection, so that you can realease the memory.

## BFS vs DFS

```javascript
// BFS
const bfs = (root) => {
  const queue = [];
  queue.push(root);

  while (!queue.length) {
    const curLen = queue.length;
    for (let i = 0; i < curLen; i++) {
      const cur = queue.shift();
      // do something on cur node
      queue.push(...cur.children);
    }
  }

  // ...
}
```

```javascript
// dfs
const dfs = (node) => {
  if (!node) {
    return;
  }
  // do something on the node
  for (let child of node.children) {
    dfs(node);
  }
}
```

### javascript inheritance ES5 VS ES6
1. The prototype of ES6 class is its parent function, in ES5 is `Function.prototype`
```javascript
class Super {}
class Sub extends Super {}

const sub = new Sub();

Sub.__proto__ === Super;
```

```javascript
function Super() {}
function Sub() {}

Sub.prototype = new Super();
Sub.prototype.constructor = Sub;

var sub = new Sub();

Sub.__proto__ === Function.prototype;
```
2. In ES5, generate child instance first; In ES6, generate parent instace first.

### setTimeout vs Promise vs async/await
setTimeout will schedule the callback into macrotask queue; Promise will schedule the task to microtask queue. The microtask queue is processed after callbacks as long as no other JavaScript is mid-execution, and at the end of each task. Any additional microtasks queued during microtasks are added to the end of the queue and also processed.

### setTimeout vs Promise vs async/await order
What is the result of following code?
```javascript
async function async1() {
    console.log('async1 start');
    await async2();
    console.log('async1 end');
}
async function async2() {
	console.log('async2');
}

console.log('script start');

setTimeout(function() {
    console.log('setTimeout');
}, 0)

async1();

new Promise(function(resolve) {
    console.log('promise1');
    resolve();
}).then(function() {
    console.log('promise2');
});
console.log('script end');
```

```javascript
// script start
// async1 start
// async2
// promise1
// script end
// async1 end
// promise2
// setTimeout
```
An `async` function can contain an `await` expression that pauses the execution of the `async` function and waits for the passed Promise's resolution, and then resumes the `async` function's execution and evaluates as the resolved value. This means the expression after `await` will be wrapped into Promise:
```javascript
// async1 equal to:
async function async1() {
    console.log('async1 start');
    Promise.resolve(async2()).then(() => onsole.log('async1 end'));
}
```
[more detail](https://github.com/Advanced-Frontend/Daily-Interview-Question/issues/7)

### flatten array and remove duplicate
```javascript
// Flatten following array, remove duplicate and sort in ascend order
// const arr = [[1, 2, 2], [3, 4, 5, 5], [6, 7, 8, 9, [11, 12, [12, 13, [14]]]], 10];

// use arr flat
[...new Set(arr.flat(Infinity))].sort((a, b) => a - b);

// conver to string
[...new Set(arr.toString().split(','))].map(Number).sort((a, b) => a - b);
```
[More about array](http://es6.ruanyifeng.com/#docs/array#数组实例的-flat，flatMap)

### Is Promise constructor function sync or async? How about `then`?
Constructor is sync, then is async.

### Inplement `new(fn, ...arg)`
```javascript
function _new(fn, ...arg) {
  const obj = Object.create(fn.prototype); // create a empty object whose _proto_ point to fn.prototype
  const result = fn.apply(obj, ...arg); // bind this to the new obj
  return result istanceof Object ? result : obj;
}
```

1. Creates a blank, plain JavaScript object;
2. Links (sets the constructor of) this object to another object;
3. Passes the newly created object from Step 1 as the this context;
4. Returns this if the function doesn't return its own object.

### HTTP/2 Request & Response Multiplexing
- In HTTP/1.x, need multiple TCP connection for multiple parallel requests => cause head-of-line blocking and inefficient use of TCP
- In HTTP/2, allow client/server to break down HTTP meassage to independ frames => interleave => reassemble
- Benefits
  - Interleave multiple request/response in parallel without blocking
  - Single TCP connection
  - Eliminate unnecessary latency, improbe utilization of available network capacity
- [More about HTTP/2](https://developers.google.com/web/fundamentals/performance/http2/#request_and_response_multiplexing)

### When is React `setState` asynchronous?
Currently, setState is asynchronous inside event handlers. In React, both `this.state` and `this.props` update only after the reconciliation and flushing. This is because `setState` re-rendering synchronouly would be inefficient in many cases.

[Read more](https://github.com/facebook/react/issues/11527#issuecomment-360199710).

### About React setState: what is the output of following code?
```javascript
class Example extends React.Component {
  constructor() {
    super();
    this.state = {
      val: 0
    };
  }

  componentDidMount() {
    this.setState({val: this.state.val + 1});
    console.log(this.state.val);    // 第 1 次 log

    this.setState({val: this.state.val + 1});
    console.log(this.state.val);    // 第 2 次 log

    setTimeout(() => {
      this.setState({val: this.state.val + 1});
      console.log(this.state.val);  // 第 3 次 log

      this.setState({val: this.state.val + 1});
      console.log(this.state.val);  // 第 4 次 log
    }, 0);
  }

  render() {
    return null;
  }
};
```
`0 0 2 3`: React batches state updates that occur in event handlers and lifecycle methods. React will set `isBatchingUpdates` to true **React-controlled synthetic event handlers and lifecycle methods**, which means it will not update the state value at once (so this.state.val = 0). In `setTimeout`, the setState is just synchronous.

### How `npm install` works?
For npm 5.5.1
1. run the project preinstall (if exist)
2. Confirm the first level dependencies
3. Extract modules
   - confirm version
   - download module
   - if this module has devpendecies, repeat 1
4. dedupe: remove the same dependencies (same version)
5. Install modules, run modules' lifecycle (preinstall, install, postinstall)
6. Run current pachage's lifecycle

[Read More](https://www.zhihu.com/question/66629910)
[Also about algorithm details](https://docs.npmjs.com/cli/install#algorithm)

### Difference between `Object.prototype.toString.call()`, `instanceof` and `Array.isArray()`
In a word, `instanceof` chech the prototype chain and cannot work througth iframe, `Object.prototype.toString.call()` and `Array.isArray()` are similar but `isArray` is an ES5 method.

Read More:
- [Difference between using Array.isArray and instanceof Array](https://stackoverflow.com/questions/22289727/difference-between-using-array-isarray-and-instanceof-array)
- [Why use toString() to typecheck args that you can check with typeof?](https://stackoverflow.com/questions/9512661/why-use-tostring-to-typecheck-args-that-you-can-check-with-typeof)
- [what's different between Object.prototype.toString.call and typeof](https://stackoverflow.com/questions/31459821/whats-different-between-object-prototype-tostring-call-and-typeof)
- [MDN isArray](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/toString#Using_toString()_to_detect_object_class)
- [Determining with absolute accuracy whether or not a JavaScript object is an array](http://web.mit.edu/jwalden/www/isArray.html)

### Repaint & Reflow
 - A repaint occurs when changes are made to an elements skin that changes visibility, but do not affect its layout. Examples of this include outline, visibility, or background color. According to Opera, repaint is expensive because the browser must verify the visibility of all other nodes in the DOM tree.
 - A reflow is even more critical to performance because it involves changes that affect the layout of a portion of the page (or the whole page). Reflow of an element causes the subsequent reflow of all child and ancestor elements as well as any elements following it in the DOM.
 - Improvement
   - Reduce DOM manipulation times
   - Reduce DOM depth
   - Avoid complex CSS selector (which spend more CPU time)
   - Change classes on the element you wish to style (as low in the dom tree as possible)
   - Avoid setting multiple inline styles
   - Apply animations to elements that are position fixed or absolute
   - Trade smoothness for speed
   - Avoid tables for layout (even minor changes will cause reflows of all other nodes in the table)
 - Read More
   - [REFLOWS & REPAINTS: CSS PERFORMANCE MAKING YOUR JAVASCRIPT SLOW?](http://www.stubbornella.org/content/2009/03/27/reflows-repaints-css-performance-making-your-javascript-slow/#tables)
   - [Minimizing browser reflow](https://developers.google.com/speed/docs/insights/browser-reflow)
   - [你真的了解回流和重绘吗](https://github.com/chenjigeng/blog/issues/4)

### Observer Pattern vs Publish/Subscribe
- Observer/Observable pattern is mostly implemented in a synchronous way, i.e. the observable calls the appropriate method of all its observers when some event occurs. The Publisher/Subscriber pattern is mostly implemented in an asynchronous way (using message queue).

- In the Observer/Observable pattern, the observers are aware of the observable. Whereas, in Publisher/Subscriber, publishers and subscribers don't need to know each other. They simply communicate with the help of message queues.

### Idea of Redux
Pub/sub pattern to manage state.
[Read Redux doc](https://redux.js.org/introduction/motivation)

### Event loop in browser vs Node
In Node11, they work in same way (microtask queue after every macrotask);
In Node10 and previous version, depends on the timer of the microtask
[浏览器与Node的事件循环(Event Loop)有何区别?](https://juejin.im/post/5c337ae06fb9a049bc4cd218)

### In global scope, variable decleared with `const` and `let` are not in the global obect (eg. `window` in browser). Where it store? How to get it?
```javascript
var a = 12;
let b = 1;
const c = 2;

console.log(window.a); // 12
console.log(window.b); // undefined
console.log(window.c); // undefined
console.log(b); // 1
console.log(c); // 2
```
- The variables are in a script scope.
- Just don't use global object.

### Both token and cookie are stored in header. So why there is no token hijacking?

- Both don't work if attacked by XSS
- For CSRF, the advantage of token is that developer should tell the browser to include the token in the request. In other word, browser will not automitically include token in the request like cookie.

### Change following code so that it can output 0 - 9.
```javascript
for (var i = 0; i< 10; i++){
	setTimeout(() => {
		console.log(i);
    }, 1000)
}
```

Solution
```javascript
// solution1: setTimeout(func, ms, params...)

for (var i = 0; i< 10; i++){
	setTimeout((i) => {
		console.log(i);
    }, 1000, i)
}

// solution2: IIFE
for (var i = 0; i< 10; i++){
	setTimeout(((i) => {
		console.log(i);
    })(i), 1000)
}

// solution3: let
for (let i = 0; i< 10; i++){
	setTimeout(((i) => {
		console.log(i);
    })(i), 1000)
}

```

### Is VDOM faster than DOM?
[chinese material](https://www.zhihu.com/question/31809713/answer/53544875)

### What is the output of the following code?
```javascript
var b = 10;
(function b(){
    b = 20;
    console.log(b);
})();

// output
ƒ b(){
    b = 20;
    console.log(b);
}
```

1. In IIFE, the funtion is a **function expression**.
2. In function expression, the name of the function is **not** bound in its enclosing environment. Instead, the name is is bound **inside** the body of the function. And this binding is a **constant binding**.
3. In strict mode, there will be a warning.

### Modify the code so that it output 10 or 20.
```javascript
var b = 10;
(function b(){
    b = 20;
    console.log(b);
})();

// output 10
var b = 10;
(function (b){
    console.log(b);
    b = 20;
})(b);

// output 20
var b = 10;
(function b(){
    var b = 20;
    console.log(b);
})();
```
