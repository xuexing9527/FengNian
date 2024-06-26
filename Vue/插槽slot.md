### Vue中的插槽slot
在React中可以直接传递lchildren，而不需要slot这种奇怪的东西
````jsx
<PComponent>
    <div>
        <span>子结构</span>
        <components />
        ...
    </div>
</PComponent>
````js
这样的结构在react中很常见，在PComponent中，可以通过props.children获取并处理其内部的div结构
然而Vue中没有提供props.children这样的结构传递，于是有了插槽。为了讲述插槽，我们需要剖开PComponent组件
````js
// PComponent内部预先留存插槽slot-1, slot-2, slot-2-1
<template>
    <div>
        <div v-slot:slot-1></div>
        <div>其它内容...</div>
        <div v-slot:slot-2>
            <div>其它内容...</div>
            <div v-slot:slot-2-1></div>
        </div>
    </div>
</template>

<PComponent>
    <slot #slot-1>
        挂到PComponent对应的slot-1位置
    </slot>
    <slot #slot-2>
        挂到PComponent对应的slot-2位置
    </slot>
    <slot #slot-2-1>
        挂到PComponent对应的slot-2-1位置
    </slot>
</PComponent>
````
通俗的说，组件把它包裹的一堆结构插到内部对应的位置。

关于slot的思考：  
- 通俗解释：把一堆零件插在一个黑箱子上，箱子内部排布好了他们的位置。
- 费解：令树结构变得怪异，破坏了树形嵌套结构。
比如在PComponent中插槽的层级或嵌套变得无意义，都会插到父组件对应位置。如：
````js
<PComponent>
    <slot #slot-2-1>
        挂到PComponent对应的slot-2-1位置
        <slot #slot-1>
            挂到PComponent对应的slot-1位置
            <slot #slot-2>
                挂到PComponent对应的slot-2位置
            </slot>
        </slot>
    </slot>
</PComponent>
````
插槽使嵌套结构，变得没有价值。
