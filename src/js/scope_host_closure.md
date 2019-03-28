# Scope, hositing and closure <!-- omit in toc -->
- [Scope](#scope)
  - [How and why it works](#how-and-why-it-works)
  - [Why we need scope](#why-we-need-scope)
  - [IIFE (Immediately Invoked Function Expression)](#iife-immediately-invoked-function-expression)
  - [Block Scope](#block-scope)

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
- developers prefer to check themselves against accidentally using variables outside of their intended purpose

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

Answer: `Original value was: undefined`, `New value is bar`

