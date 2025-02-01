# useLayoutEffect
已经更新了 DOM，浏览器并未渲染之前执行。
## 何为更新了真实 DOM，浏览器未渲染呢？
useLayoutEffect 会阻塞浏览器绘制

下面这个例子可以放到控制台执行下，方便理解 useLayoutEffect 巧妙的在 DOM 更新后浏览器绘制之前执行
```js
function main () {

    /**
     * 阻塞函数
     */
    function sleep (s, showLog) {
        if (showLog) console.log(`等待${s}秒...`)
        const time = new Date().getTime()
        while (new Date().getTime() - time < s * 1000) { }
    }

    /**
     * patch 来更新 DOM
     */
    function patch () {
        document.body.innerText = '测试 同步方法'
        console.log('执行 patch ...，此时更新了DOM，但是浏览器还没绘制...')
    }

    function useLayoutEffect(params) {

        console.log('执行 useLayoutEffect...') 
        sleep(2)
        console.log('注意看此时的 document.body.innerText 已经改变成了: ', document.body.innerText)
        sleep(2)
        console.log('但是页面并没有更新（绘制）!!!')
        sleep(2)
        const s = 5
        console.log(`接下来阻塞浏览器 ${s}s，来个缓冲理解下整个过程...`)
        sleep(s, true)
        console.log(`${s}s 后 layoutEffect... 继续`)
        sleep(2)
        console.log(`uselayoutEffect 执行完成！`)
    }

    /**
     * 这里 patch 更新 DOM 之后，接着调用 useLayoutEffect
     * 浏览器执行了 DOM 更新，由于 main 方法未执行完成，浏览器被阻塞渲染。
     * 注意：这里浏览器更新完了 DOM，只差渲染的最后一步。待细察
     * 
     */
    patch()
    sleep(3)
    useLayoutEffect()

    {
        setTimeout(() => console.log('此时浏览器完成了渲染（绘制）。页面 body text 变成了 "测试 同步方法"'), 1000)
        setTimeout(() => console.log(`这里可以看出 useLayoutEffect 同步阻塞了浏览器运行，在浏览器渲染（绘制）画面之前运行`), 3000)
    }
}

main()
```
其他：这个执行时机相当于在浏览器未绘制前，可以做一些预操作，来修正 DOM 位置等。其实这个过程相当于劫持 paint， 再来一次 reflow 的机会。


参考：
渲染性能： 
https://web.developers.google.cn/articles/rendering-performance?hl=zh-cn

梳理useEffect和useLayoutEffect的原理与区别
: https://juejin.cn/post/6921688408737710087