# Center element by CSS

6 ways to center an element with CSS. My [codepen](https://codepen.io/dingjy94/pen/vwWbjq).
## Absolute Position Solution
```html
<div class="green-square"></div>
```

```css
.green-square {
  width: 200px;
  height: 200px;
  background-color: green;
  position: absolute;
  left: 50%;
  transform: translate(-50%);
}
```

1. set `left: 50%`, so the element will start at the center of the window.
2. use `transform: translate(-50%)` to modify the position. `margin-left: -100px` will also work.
3. Absolute positioning removes the element from the flow of the page. This may cause overlapping of elements.

## Float Method
```html
<div class="red-square-container">
  <div class="red-square-second-container">
    <div class="red-square"></div>
  </div>
</div>
```

```css
.red-square-container {
  position: relative;
  float: left;
  left: 50%;
}

.red-square-second-container {
  left: -50%;
  position: relative;
}

.red-square {

  background-color: red;
  width: 100px;
  height: 100px;
}
```

This is a [tricky solution](https://stackoverflow.com/a/21508512/10292761). The trick is giving float left to make the containers change the width depending on the content. Than is a matter of position:relative and left 50% and -50% on the two containers.

## Text-Align Method
```html
<div class="blue-square-container">
  <div class="blue-square"></div>
</div>
```

```css
.blue-square-container {
  text-align: center;
}

.blue-square {
  background-color: #0074D9;
  width: 100px;
  height: 100px;
  display: inline-block;
}
```

1. Set the contain `text-align` to center.
2. Set the element to `inline-block`, so elements will set in line.

## Margin Auto Method
```html
<h3>Margin Auto Method</h3>
<div class="yellow-square"></div>
```

```css
.yellow-square {
  background-color: yellow;
  width: 100px;
  height: 100px;
  margin: auto;
}
```

In shot, set `margin-left` and `margin-right` to auto.

## Flexbox Method
```html
<div class="purple-square-container">
  <div class="purple-square"></div>
</div>
```

```css
.purple-square-container {
  display: flex;
/*   align-items: center; */
  justify-content: center;
}

.purple-square {
  background-color: #B10DC9;
  width: 100px;
  height: 100px;
}
```
1. Set the container `display: flex`.
2. Set `justify-content: center`, so that horizontally center.
3. If want to set vertically center, set `align-items: center;`.

## Gird Method
```html
<div class="pink-square-container">
  <div class="pink-square"></div>
</div>
```

```css
.pink-square-container {
  display: grid;
  grid-template-columns: 100px;
  justify-itmes: center;
  justify-content: center
}

.pink-square {
  width: 100px;
  height: 100px;
  background-color: pink;
}
```

For this example, grid is just similar to flexbox.
