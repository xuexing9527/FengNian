# 选项式 API & 组合式 API
## Composition API & Options API

所谓组合式 API (Composition API) ，我们可以使用函数调用的方式而不是声明（组件）选项的方式调用对应的 API 方法。
```js
// 选项式 API
export default {
    data () { // data (选项)

    }, 
    mounted () { // 生命周期 mounted (选项)

    },
    methods () { // 方法注册 (选项)

    }
}
```
```html
<!-- 组合式（composition） API -->
<script setup>
    import { ref, onMounted } from 'vue'
    const count = ref(0)

    // 生命周期钩子
    onMounted(() => {
        console.log(`The initial count is ${count.value}.`)
    })
</script>
```
例子对比看出，选项式 API，代码要分别写到对应选项中，如果你希望在代码中不同位置直接调用 mounted 方法是不行的。

