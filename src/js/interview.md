# JavaScript Interview Question

## Scope and closure

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
