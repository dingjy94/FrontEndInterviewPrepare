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
