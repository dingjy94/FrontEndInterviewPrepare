# Scope, hositing and closure <!-- omit in toc -->
- [Scope](#scope)
  - [How and why it works](#how-and-why-it-works)
  - [Why we need scope](#why-we-need-scope)
  - [IIFE (Immediately Invoked Function Expression)](#iife-immediately-invoked-function-expression)
  - [Block Scope](#block-scope)
- [Hoisting](#hoisting)
- [Closure](#closure)
  - [Module Pattern](#module-pattern)
- [Interview Question](#interview-question)
  - [Hoisting Questions](#hoisting-questions)
- [Reference](#reference)

## Scope
Scope is a well-defiend set of rules for  storing variables in some location, and for finding those variables at a later time. It tell JS enginee where to store and look up variables.
### How and why it works
- JavaScript is a **compiled language**, it follows all of compiling phases: Lexing - Parsing - Code Generation
- JavaScript's scope is **lexical scope** (means scope depends on where the variable declare)
- For function declariation, compiler handles both declariation and value definition (assign function value to function name)
- Engine starts at the current scope, looks for the variable and if not found, keep going up one level, and go on until reach the global scope
- Two kind of look up: LHS (use fo assign value to variable) and RHS (get value from the variable)
  - If RHS failed, it result in `ReferenceError`, which means the variable is undeclared
  - If LHS failed, if in `strict mode`, also result in `ReferenceError`; if not `strict mode`, global scope create a new variable in **global scope**
  - If RHS successed, but implies illegal/impossible actions against the result, will get `TypeError`

### Why we need scope
Function scope hide variables and functions by enclosing them in the scope.
- Principle of least priviledge
- avoid collision between identifers with same name but different usages
- use to imply module pattern

### IIFE (Immediately Invoked Function Expression)
Althogh function can create scope to hide inner variables and functions, there are still some problems:
- function name itself pllute the eclosing scope
- have to explicity call the function name (invoke)

So, we can use IIFE
```javascript
(function foo(x) {...})(x);
```
- `(function ...)` will treat the function as **function expression**
- `foo`, function expression can be anonymous, but it's a good practice to give a name
- `(x)`, immediately invoke the function, **IIFE is just a normal function call**, so we can pass in argument
- **variable `foo` can only be found in `...`, not in outer scope**
- *Tip: If funtion is the very first thing in the statement, then it's a function declariation. Or, it's a function expression. So if you use callback like `setTimeout(function callback(){...}, 0)`, this `function...` is a function expression.*

### Block Scope
Why we need block scope:
- avoid pllute the whole scope
- developers prefer to check themselves against accidentally using variables outside of their intended purpos◊e

Before ES6, the only block scope is `try...catch...`'s `catch{...}` block.

In ES6, we have `let` and `const`.
```javascript
  {
    let tmp = {...};
  }
```
- this block has it's own scope
- This is a explicit block, the engine will not keep `tmp` after the block (garbage collection).
- for `let`, in for loop, the variable will be declared not just once for loop, but for **each iteration**, and will be initialized at each subsequent iteration with the value from the  end of previous iteration.
```javascript
  // user var
  for (var i = 0; i < 5; i++) {
    setTimeout(function timer(){
      console.log(i);
    }, 0);
  } // This will console five 5, because all 5 timer function share the same lexical scope.

  // use let
  for (let i = 0; i < 5; i++) {
    setTimeout(function timer() {
      console.log(i);
    }, 0);
  } // 0, 1, 2, 3, 4, let create per-iteration block scope

  // use IIFE
  for (var i = 0; i < 5; i++) {
    (function(i) {
      setTimeout(function timer() {
        console.log(i);
      }, 0);
    })(i);
  } // 0, 1, 2, 3, 4, for each iteration, we crate a new scope with IIFE
```

## Hoisting
All declaration (function and variable), are processed first by compiler, before code execution. For example, in `var i = 2`, `var i` is processd during the compilation phase, and `i = 2` is left in place. We can think that the declaration are 'moved' to top of their scope, which is called 'hoisting'.
- hoist to top of the scope
- function declaration hoisted, expression not.
  ```javascript
    foo(); // TypeErro => undefined()
    var foo = function foo(){...};
  ```
- function hoisted first, then variable; duplicate var **declarations** are **ignored**
  ```javascript
    foo(); // 1
    var foo; // ignored
    function foo() {
      console.log(1);
    }

    foo = function() {
      console.log(2);
    }

   // =>
    function foo() {
      console.log(1);
    }

    foo(); // 1

    foo = function() {
      console.log(2);
    }
  ```
- subsequence **function declaration** will **override** previous ones. (Don't do that)

## Closure
Closure is when a function can remember and access its lexical scope even excuting outside the scope.
```javascript
function foo() {
  var a = 2;
  function bar() {
    console.log(a);
  }
  return bar;
}

var baz = foo();
baz(); // 2, bar() still has reference to its lexical scope, this reference is called closure
```
- Any ways that functions can be passed around as value, and invoked in other locations, are examples of observing closure

### Module Pattern
- Outer wrapping function being invoked
- enclosing function return back at **least one inner function**, so this function has closure over private scope => can access/modify private variables
- So we can use IIFE to create functional module
- ES6 module is **static module**, which means APIs **don't change at run-time**, so that compiler can check that a reference to a member of an imported module's API exists, and throw error at **compile time**
## Interview Question

- Lexical scope and closures.
  - Lexical scope means that scope is defined by author-time (lexing time) decisions of where functions are declared. The lexing phase of compilation is essentially able to know where and how all identifiers are declared, and thus predict how they will be looked-up during execution.
  - Closure is when a function can remember and access its lexical scope even excuting outside the scope.

- how/why would you use closure
  - A closure is the combination of a function and the lexical environment within which that function was declared. Closures are functions that have access to the outer (enclosing) function's variables—scope chain even after the outer function has returned.
  - Data privacy / emulating private methods with closures.
  - [Partial applications or currying](https://medium.com/javascript-scene/curry-or-partial-application-8150044c78b8)

- function & block scoping
  - Variables and functions that are declared inside another function are essentially "hidden" from any of the enclosing "scopes"
  -  Block-scope refers to the idea that variables and functions can belong to an arbitrary block (generally, any `{ .. }` pair) of code
     -  `try/catch`
     -  `let` and `const`
- function expressions & declarations.
  - **function declarations are hoisted, but function expressions not**
  - function expression can be anonymous， but can also use named function expression (name keep in the function's own scope)
  - benifits of function expressions
    - It's more clear because you must declare (assign to variable) it before invoke it, function declarations may sometime cause confusion
    - function expression clearly shows that you are "creating a object", and this is how JS function works (an object)
    - function expression can be put under block scope (eg `if(){...}`) (*function declarations in blocks is technically invalid before ES6, and in ES6 should work under strict mode [function](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions#Block-level_functions)*), assign a to a prototype or as a property of some other object, and IIFE
    - function expression is invoked at runtime
    - Read more (Named function expressions demystified)[http://kangax.github.io/nfe/#expr-vs-decl], (Function Declarations vs. Function Expressions)[https://javascriptweblog.wordpress.com/2010/07/06/function-declarations-vs-function-expressions/]

- anonymous function
  - Use it when you don't reuse the function, and can make the code clean. But it shouldn't be too complicated (for debug reason). Personally, I prefer to use `named function expression`. (Don't support before IE9)

- `let`, `var` `const`
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
## Reference
- [Function Hoisting & Hoisting Interview Questions](https://medium.freecodecamp.org/function-hoisting-hoisting-interview-questions-b6f91dbc2be8)
