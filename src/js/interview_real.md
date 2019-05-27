## What is the value of `eventPrice`?
```JavaScript
let event = {
  name: 'Hot Dog',
  financials: {
    baseCost: '$19.99'
  }
};

let eventPrice;

const assignEvent = ({ financials: { baseCost: price } }) => eventPrice = price;

assignEvent(event);
```

Answer: '$19.99'

## Implement `setInterval()`
```javascript
const intervalMap = new Map();

const mySetInterval = (callback, interval) => {
  if (typeof callback !== 'function') {
    throw new Error('Except a function as first argument');
  }

  const id = Math.floor(Math.random() * 10000);

  intervalMap.set(id, setTimeout(function next() {
    callback();
    intervalMap.set(id, setTimeout(next, interval));
    // the real setInterval is more like set next timeout first
    // intervalMap.set(id, setTimeout(next, interval));
    // callback();
  }

  , interval));

  return id;
};

const myClearInterval = (id) => {
  clearTimeout(intervalMap.get(id));
};

const test = () => { console.log('hello'); }

const fake = mySetInterval(test, 100);

setTimeout(() => myClearInterval(fake), 1000);
```

The basic idea to recursive call `setTimeout`. In order to implement `clearInterval`, we should let our `setInterval` return an id which trace the current `setTimeout`. Thus, we store it in a map, and in each recursive function, update the corresponding value.

For more detail about `setTimeout` and `setInterval` read [Scheduling: setTimeout and setInterval](https://javascript.info/settimeout-setinterval).

## Observer Pattern
Code on [codepen](https://codepen.io/dingjy94/pen/LorVPV?editors=1111).

```html
<body>
  <div class=square>1</div>
  <hr>
  <button class="increment">increment</button>
</body>
```

```css
.square {
  display: inline-block;
  height: 50px;
  width: 50px;
  background-color: red;
  text-align: center;
  line-height: 50px;
  color: white;
  font-size: 150%;
}

.increment {
  cursor: pointer;
}
```
These html and css just create a number in a color square and a button. Use observer pattern, when click the button, the number increase and color changes, and console log the current color.

```javascript
class Subject {
  constructor() {
    this.color = 'red';
    this.number = 1;
    this.observers = [];
  }

  increment() {
    this.number += 1;
    const color = ['red', 'orange', 'blue', 'green', 'yellow'];

    this.color = color[Math.floor(Math.random() * color.length)];
    this.notifyObservers();
  }

  addObserver(observer) {
    this.observers.push(observer);
    return () => {
      this.observers = this.observers.filter((o) => o !== observer);
    };

    // return an unsubscribe function
  }

  notifyObservers() {
    for (let o of this.observers) {
      o.update(this);
    }
  }
}

class SquareObserver {
  constructor(className) {
    this.className = className;
  }

  update(state) {
    const square = document.getElementsByClassName(this.className)[0];

    square.style.backgroundColor = state.color;
    square.innerText = state.number;
  }
}

class ConsoleObserver {
  constructor() {}

  update(state) {
    console.log(`Color is ${state.color}`);
  }
}

const subject = new Subject();
const square = new SquareObserver('square');
const consoleObs = new ConsoleObserver();

subject.addObserver(square);
subject.addObserver(consoleObs)

document.querySelector('button').addEventListener('click', () => subject.increment()); // be careful the this of event listener will be set to the target element.
```

Basically, create a `Subject` which keeps an array of all observers. When the state changes, the subject notify all observers by call the registered observers' callback functions (in this case `update`), to tell observers current state.
