# background

## background-clip

````HTML
<html>
  <head>
    <style>
      .text-clip {
        font-size: 50px;
        font-weight: bold;
        background: linear-gradient(to right, red, blue);
        -webkit-background-clip: text; /* 让背景只应用到文本 */
        color: transparent; /* 让文本透明，显示背景 */
      }
    </style>
  </head>
  <body>
    <div class="text-clip">大王叫我来巡山</div>
  </body>
</html>
````