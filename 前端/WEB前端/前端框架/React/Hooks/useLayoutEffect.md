# useLayoutEffect
已经更新了 DOM，浏览器并未渲染之前执行。
## 何为更新了真实 DOM，浏览器未渲染呢？
useLayoutEffect 会阻塞浏览器绘制

下面这个例子可以放到控制台执行下，方便理解 useLayoutEffect 巧妙的在 DOM 更新后浏览器绘制之前执行
```js
function main () {
    const time = new Date().getTime()
    function patch () {
        document.body.innerText = '测试 同步方法'
        console.log('已经更新了DOM，但是浏览器还没绘制...')
    }
    function useLayoutEffect(params) {
        console.log('看这里的 body text 已经改变了: ', document.body.innerText)
        console.log('layoutEffect... 我来阻塞 浏览器 3s')
        while (new Date().getTime() - time < 3000) { }
        console.log('layoutEffect... 继续，这里可以看出 useLayoutEffect 同步阻塞了浏览器运行，在浏览器渲染（绘制）画面之前运行')
    }
    patch();
    useLayoutEffect();
}
```


参考：
渲染性能： 
https://web.developers.google.cn/articles/rendering-performance?hl=zh-cn

梳理useEffect和useLayoutEffect的原理与区别
: https://juejin.cn/post/6921688408737710087