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

## BFS vs DFS (copy function)
