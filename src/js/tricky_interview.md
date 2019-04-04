# JavaScript Tricky Interview Questions

1.
```Javascript
function y() {
  console.log(this.length);
}

var x = {
  length: 5,
  method: function(y) {
    arguments[0]();
  }
};

x.method(y, 1);
// what is the result of this program?
```

hint: what is `this`?

Answer: 2

Explain: The key is what `this` is when it called. We all know `arguments` is an array-like object, so `arguments[0]` is just `y`, and we call y, but since `arguments` itslef is an object, it's more like you're doing `arguments.y()`, so `this` refer to `arguments`, whose length is 2.

2.
```javascript
const x = 'constructor';
console.log(x[x](01)); // what this console?
```

hint: maybe you can guess the result, but why?

Answer: '1'

Explain: `x[x]`, JS will automatically convert `x` to String Object, and so `x['construcor']` is `x.constructor`, which is `String`, so it will call `String(01)` and this is '1'.

3.
```JavaScript
var A = {
  x: function() {
    console.log('x');
  },
  y: function() {
    console.log('y');
  },
  z: function() {
    console.log('z');
  }
}

A.x().y().z();

// what you can do to let this program output 'XYZ'?
```

Answer: add `return this` in each function
