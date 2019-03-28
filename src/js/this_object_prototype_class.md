- [this](#this)
  - [precedence (high to low)](#precedence-high-to-low)
    - [exception](#exception)
    - [call, apply, bind](#call-apply-bind)
    - [new](#new)
- [Object](#object)
  - [Property](#property)
  - [[[Prototype]]](#prototype)
  - [[[Get]]](#get)
  - [[[Put]]](#put)
  - [instanceof](#instanceof)
- [Class](#class)
  - [ES5](#es5)
  - [ES6](#es6)
  - [More than syntax sugar](#more-than-syntax-sugar)

## this
`this`
- binding made for each function invocation
- only depends on call-site (how the function is called)

### precedence (high to low)
- `new`, bind to the newly created object
- `apply`, `call`, `bind`
- `obj.fun()`
- Default, the function call scope; if in global, in `strict mode`, `this` is `undefined`

#### exception
- `func.call(null, ...args)`, `function.apply(null, [args])`, `function.bind(null, args)`
- Indirectoin reference of function
```javascript

  function foo() {
    ...
  }

  var o = { foo: foo }
  (p.foo = o.foo)(); // (p.foo = o.foo) return foo(), not o.foo
```

#### call, apply, bind
- A (apply) for array and C (call) for comma (arguments seperately)
- `call` and `apply` execute function immediately, `bind` return a new function

#### new
- create a new object in air
- new object's prototype lined to constructor function's prototype
- new object is set as `this` for the function call and execute the function
- if function has no return value, this new object returned

## Object
- function is a sub-type of object
- JS convert primitive type to object if necessary and possible (string, number, boolean)

### Property
Content of objects consist of value stored at named locations
- value can be any type, but we avoid use `number`, to avoid confused with array (object use number as property (index))
- `Object.defineProperty(obj, prop, descriptor)`
  - data descriptor: value, configurable, writable, enumerable
  - accessor descriptor: set, get
  - `configurable` is one-way action, cannot be undone
  - if accessor descriptor exists, no value and writable
- `in` check property in current object or it's higher level of prototype chain
- `hasOwnProperty` only check the object

### [[Prototype]]
- internal property reference to another object
- `Object.prototype`: top-end of normal object's prototype chain

### [[Get]]
- inspect the object for property with requested name
- if not found, look up the prototype chain
- **shadowing**: same property name both on object itself and at higher level of prototype chain, the look up always find the value on current object

### [[Put]]
`myObj.foo = 'bar'`
- if `myObj` has `foo`, change value or call setter
- if `foo` not in `myObj` and higher level of prototype chain, add directly to `myObj`
- if `foo` in chain, and is read-only (`writable = false`), both setting of existing property and creation of shadowed property are disallowed; in `strict mode`, throw error
- if `foo` in chain define with setter, this setter is called, no shadowed property
- else, add `foo` to `myObje`, this is a shadowed property

### instanceof
- `a instanceof Foo`: is `Foo.prototype` in a's higher order prototype chain
- `b.isPrototypeof(a)`: is `b` in a's higher order prototype chain
- `a.__proto__`: retrieve internal [[Prototype]]

## Class

**No actual instanse of class, only many object link to common object**

### ES5
```javascript

  function Vehicle(name){
    this.name = name;
    //...
  }

  Vehicle.prototype.drive = function(){/*...*/}

  Vehicle.compare = function(){...} // static function
  Vehicle.enigne = 1; // static variable

  // subclass
  function Car(name) {
    Vehicle.call(this, name);
    ...
  }

  Car.prototype = Object.create(Vehicle.prototype); // bind Car.prototype 's [[prototype]] to Vehicle.prototype
  Car.prototype.constructor = Car; // reassign constructor

  //...
```


### ES6
```javascript
  class Vehicle {
    static engine = 1; // static variable, ES7
    constructor(name) {
      this.name = name;
      ...
    }

    drive() {...}

    static compare() {..}
  }

  class Car extends Vehicle {
    constructor(name) {
      super(name);
    }

    drive() {...}

    ....
  }
```

### More than syntax sugar
- static properties are inherited
- built-in constructors can be subclassed (eg. array)
- class constructor cannot be functionally-called
- class constructor's prototype cannot be reassigned
- class methods don't have prototype
