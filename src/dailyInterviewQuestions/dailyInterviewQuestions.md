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
