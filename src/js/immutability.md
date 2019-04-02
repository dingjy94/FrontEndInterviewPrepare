# Immutability
## What is it
Copy instead of Mutate: When change state in program, creat and track a new value instead of mutate existing one. This is a baisc consept from functonal programming.

## Why
- keep the program predictable: In gernal, when we pass a no-primitive value, we pass the reference, and this can make the value non-local. This means that the entire system should consider whether where and when a value is changed.

- Treat objects as value: easy to check change.
    - React `shouldComponentUpdate` check state change and determin render or not
    - easily use object as a key in map
- different from `const`: constant means varaible **cannot be reassigned**, not about value change, so for constant array or object, you can still modify the values, which means still mutable.

## How
- `Object.freeze()`: set object properties read-only, shallow freenze (only top-level)
- structural sharing: the basic idea is store the original values, and track and record changes (similar to Git)
    - new state point at new version of the data structure
    - can be implemented by trie, reuse existing nodes as much as possible (immutable.js)
- which to choose: if only need shallow level and change happens in low frequency, `Object.freeze()` maybe enough; if change happens frequently, use structural sharing data structure from library like [immutable.js](https://github.com/immutable-js/immutable-js)

## Treatment
- It is a good idea to treat all arguments as immutable in a function; and in the inner function, you can still use the normal mutable variables.
- For array, `concat`, `slice`, `map`, and `filter` are immutable methods.

## Downside of Structural data structure
THe larget downside is that it is hard to make sure an object is a normal javascript object or immutable object:
- Use Type System: TypeScript, Flow...
- Or Hide the details of objects, **don't allow** the direct access of immutable ojects: add a new layer or force read to perform a query (like Redux)

## Reference
- [Immutable Data Structures and JavaScript
](https://jlongster.com/Using-Immutable-Data-Structures-in-JavaScript#Immutable.js)
- [Functional-Light JavaScript Chapter 6: Value Immutability](https://github.com/getify/Functional-Light-JS/blob/master/manuscript/ch6.md/#chapter-6-value-immutability)
- [Immutable.js, persistent data structures and structural sharing](https://medium.com/@dtinth/immutable-js-persistent-data-structures-and-structural-sharing-6d163fbd73d2)
