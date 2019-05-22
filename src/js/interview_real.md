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
