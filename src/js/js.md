## Interview Question

### Hoisting Questions

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
