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

Answer: add `return this;` or `return A;` in each function

4.
What is the result of `true == 'true'`?

Answer: False. Read [this ES5 rule](http://www.ecma-international.org/ecma-262/5.1/#sec-11.9.3). Since `true` is boolean, the result is `ToNumber(true) === ToNumber('true')`, which turn to `1 === Nan`. By the way, compare anything (includes itself) to `Nan` is false.

In short the rule is: If the two operands are not of the same type, JavaScript converts the operands then applies strict comparison. If either operand is a number or a boolean, the operands are converted to numbers if possible; else if either operand is a string, the other operand is converted to a string if possible.

5.
Result of `['1', '2', '3'].map(parseInt)`?

Answer: `[1, Nan, Nan]`. `Array.map()` will transfer three parameters to the callback function (currentValue, index, array), and `parseInt` accept two parameters. So `parseInt('1', 0)` is 1, `parseInt('2', 1)` is Nan (If the radix is non-zero and less than 2 the function returns NaN without even looking at the string) and `parseInt('3', 2)` is Nan (3 is not valid for number base on 2).
