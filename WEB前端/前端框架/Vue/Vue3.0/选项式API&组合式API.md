# 选项式 API & 组合式 API
## Composition API & Options API

所谓组合式 API (Composition API) ，我们可以使用函数调用的方式而不是声明（组件）选项的方式调用对应的 API 方法。
```js
// 旧版选项式 API
export default {
    data () { // data 选项

    }, 
    mounted () { // 生命周期 mounted 选项

    },
    methods () { // 方法注册 选项

    }
}
```
```html
<script setup>
    import { ref, onMounted } from 'vue'
    const count = ref(0)

    // 生命周期钩子
    onMounted(() => {
        console.log(`The initial count is ${count.value}.`)
    })
</script>
```

