<template>
    <div v-bind="attrs">
        <p>{{ message }}</p>
        <slot></slot>
        <button @click="emitEvent">Emit Event</button>
    </div>
</template>
<script setup>
    // 获取 props
    const props = defineProps({
        message: String
    });

    // 获取 attrs 和 slots
    import { useAttrs, useSlots } from 'vue';
    const attrs = useAttrs();
    const slots = useSlots();

    // 定义 emit 事件
    const emit = defineEmits(['customEvent']);

    // 定义一个方法供父组件调用
    const someMethod = () => {
        console.log('This method is exposed to the parent component');
    };

    // 使用 expose 明确暴露方法
    const expose = defineExpose();
    expose({ someMethod });
</script>
