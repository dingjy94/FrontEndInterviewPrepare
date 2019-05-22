# JavaScript Interview Question
- [JavaScript Interview Question](#javascript-interview-question)
  - [Gernal Interview Questions](#gernal-interview-questions)
    - [Lexical scope and closures.](#lexical-scope-and-closures)
    - [how/why would you use closure](#howwhy-would-you-use-closure)
    - [function & block scoping](#function--block-scoping)
    - [function expressions & declarations.](#function-expressions--declarations)
    - [anonymous function](#anonymous-function)
    - [`let`, `var` `const`](#let-var-const)
    - [Hoisting Questions](#hoisting-questions)
    - [What's the notable difference `call` vs `apply`](#whats-the-notable-difference-call-vs-apply)
    - [Explain `Function.prototype.bind`](#explain-functionprototypebind)
    - [How `this` works](#how-this-works)
    - [Can you give an example of one of the ways that working with this has changed in ES6](#can-you-give-an-example-of-one-of-the-ways-that-working-with-this-has-changed-in-es6)
    - [Object prototypes, constructors and mixins.](#object-prototypes-constructors-and-mixins)
    - [What advantage is there for using the arrow syntax for a method in a constructor?](#what-advantage-is-there-for-using-the-arrow-syntax-for-a-method-in-a-constructor)
    - [Can you offer a use case for the new arrow `=>` function syntax? How does this new syntax differ from other functions?](#can-you-offer-a-use-case-for-the-new-arrow--function-syntax-how-does-this-new-syntax-differ-from-other-functions)
    - [ES6 class vs ES5 function constructors](#es6-class-vs-es5-function-constructors)
    - [Why you might want to create static class members?](#why-you-might-want-to-create-static-class-members)
    - [Explain the difference between mutable and immutable objects.](#explain-the-difference-between-mutable-and-immutable-objects)
    - [What is an example of an immutable object in JavaScript?](#what-is-an-example-of-an-immutable-object-in-javascript)
  - [What are the pros and cons of immutability?](#what-are-the-pros-and-cons-of-immutability)
  - [How can you achieve immutability in your own code?](#how-can-you-achieve-immutability-in-your-own-code)
  - [Reference](#reference)

## Gernal Interview Questions
### Lexical scope and closures.
  - Lexical scope means that scope is defined by author-time (lexing time) decisions of where functions are declared. The lexing phase of compilation is essentially able to know where and how all identifiers are declared, and thus predict how they will be looked-up during execution.
  - Closure is when a function can remember and access its lexical scope even excuting outside the scope.

### how/why would you use closure
  - A closure is the combination of a function and the lexical environment within which that function was declared. Closures are functions that have access to the outer (enclosing) function's variables—scope chain even after the outer function has returned.
  - Data privacy / emulating private methods with closures.
  - [Partial applications or currying](https://medium.com/javascript-scene/curry-or-partial-application-8150044c78b8)

### function & block scoping
  - Variables and functions that are declared inside another function are essentially "hidden" from any of the enclosing "scopes"
  -  Block-scope refers to the idea that variables and functions can belong to an arbitrary block (generally, any `{ .. }` pair) of code
     -  `try/catch`
     -  `let` and `const`
### function expressions & declarations.
  - **function declarations are hoisted, but function expressions not**
  - function expression can be anonymous， but can also use named function expression (name keep in the function's own scope)
  - benifits of function expressions
    - It's more clear because you must declare (assign to variable) it before invoke it, function declarations may sometime cause confusion
    - function expression clearly shows that you are "creating a object", and this is how JS function works (an object)
    - function expression can be put under block scope (eg `if(){...}`) (*function declarations in blocks is technically invalid*), assign a to a prototype or as a property of some other object, and IIFE
    - function expression is invoked at runtime
    - Read more (Named function expressions demystified)[http://kangax.github.io/nfe/#expr-vs-decl], (Function Declarations vs. Function Expressions)[https://javascriptweblog.wordpress.com/2010/07/06/function-declarations-vs-function-expressions/]

### anonymous function
  - Use it when you don't reuse the function, and can make the code clean. But it shouldn't be too complicated (for debug reason). Personally, I prefer to use `named function expression`. (Don't support before IE9)

### `let`, `var` `const`
  - Variables declared using the `var` keyword are scoped to the function in which they are created, or if created outside of any function, to the global object. `let` and `const` are block scoped, meaning they are only accessible within the nearest set of curly braces (`function, if-else block, or for-loop`).
  - `var` variables are hoisted, `let` and `const` not
  - redeclare `let` and `const` throw `SyntaxError`



### Hoisting Questions
- explain `hoisting`

Answer: The compiler will process all declarations before code excutations, and left the value assign in place (for code excutations phase). So we can think this as declarations are moved to the top of the scope,
which is called 'hoisting'.

```javascript
  var a = 1;
  function b() {
    a = 10;
    return;
    function a() {}
  }
  b();
  console.log(a);
```

Answer: 1

```javascript
  function foo(){
      function bar() {
          return 3;
      }
      return bar();
      function bar() {
          return 8;
      }
  }
  console.log(foo());
```

Answer: 8

```javascript
  function parent() {
      var hoisted = "I'm a variable";
      function hoisted() {
          return "I'm a function";
      }
      return hoisted();
  }
  console.log(parent());
```

Answer: **TypeError: hoisted is not function**

```javascript
  console.log(foo());
  function foo() {
    var bar = function() {
      return 3;
    };
    return bar();
    var bar = function() {
      return 8;
    };
  }
```

Answer: 3

```javascript
  var myVar = 'foo';
  (function() {
    console.log('Original value was: ' + myVar);
    var myVar = 'bar';
    console.log('New value is: ' + myVar);
  })();
```

Answer: `Original value was: undefined`, `New value is bar`


### What's the notable difference `call` vs `apply`
`func.call(this, args)` accept separate arguments for the `func`, `func.apply(this, [args])` accept an array of arguments.

### Explain `Function.prototype.bind`
Return a new function object bind `this` to the specific object.

### How `this` works
`this` depend on how the function is invoked (call-site).
- In arrow function, `this` refer to the lexical scope
- If function call by `new`, `this` will bind to the newly create object
- If use `call`, `apply`, `bind`, `this` will bind to the specific object
- `obj.func()`, `func`'s `this` bind to `obj`
- In other case, `global`, in strict mode, undefeind

### Can you give an example of one of the ways that working with this has changed in ES6
In arrow function, `this` is depend on the lexical scope, not the call-site.

### Object prototypes, constructors and mixins.
`prototype` is an inner property of object, keep a reference to another object. When the get or set the object perperty, JS enginee will first check the object and than look up the prototype chain.

### What advantage is there for using the arrow syntax for a method in a constructor?
`this` of arrow syntax is bind to the lexical scope, which means where it create and this bind cannot be changed later. This means if we use the constructor to create a new Object, `this` will alwyas refer to that object.

This is helpful in case such as React class components, because you may always pass the class methods into child component. In this case, we must bind `this` to parent component.

### Can you offer a use case for the new arrow `=>` function syntax? How does this new syntax differ from other functions?
You can use arrow functon in wherever you use traditional function **expression**. The difference is `this` of arrow function is bind to its lexical scope. So the method in a class construcor is one of the most typical use case of arrow function, becuase, you don't have to use `bind` to bind it to current object if you pass the method to other objects.

### ES6 class vs ES5 function constructors
- ES6 class is easier to use, espicially when do inheritance. We have to do much more work in ES5 such as: `call` parent constructor, bind prototype, set function to prototype... . In ES6, with the help of `class`, `super`, `constructor` keywords, we can do this easier.
- In ES5, we cannot inheritance static function
- ES6 class cannot be function called
- ES6 class constructor's prototype cannot be reassigned and class methods don't have prototype
- In ES5, we cannot subclass some built-in constructors

### Why you might want to create static class members?
When you need a method (or property) this is bind to the class, not each instance (the function or variable don't determined on each object). The common use case is like a `compareTo(obj1, obj2)` method. This method will not change base on instance (object), but it is nature to put it in the class.

### Explain the difference between mutable and immutable objects.
Immutable object means you cannot change the value (properties) of the objects. That means if you want to track a states of the program, you must make a copy instead of mutate the object directely.

### What is an example of an immutable object in JavaScript?
You can use `Object.freeze()` to make an object immutable. However, this will only immutate the top-level properties of the object, so may need to loop through the object to freeze deeper properteis.

## What are the pros and cons of immutability?
pros:
- make the program more predictable, less side effect. Mutable object may cause hidden side effect espicially when it is send to a functon as argument (The other part of program don't know whether the object is changed or not)
- treat object as value, which means you can easily track and check state change (just use `===` to compare new and old status object); also, you can set object as a map key, and use the same value object (don't need to be same reference) to fetch the value
cons:
- Performance: each time you want to mutate the object, you have to make a copy and mutate the copy
## How can you achieve immutability in your own code?
- `Object.freeze()`: shallow immutable, when you want to mutate, you should copy the whole object
- structural sharing: track and record the change, reuse unchanged value as much as possible (can implemented with tries), in production, you may want to use library such as immutable.js


## Reference
- [Function Hoisting & Hoisting Interview Questions](https://medium.freecodecamp.org/function-hoisting-hoisting-interview-questions-b6f91dbc2be8)
