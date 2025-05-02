// 哈夫曼编码

const str = `人生若只如初见，何事秋风悲画扇。
曾经沧海难为水，除却巫山不是云。
一花一世界，一叶一菩提。
你若安好，便是晴天。
我爱你，与你无关。
我遇见你，如银河奔落九天。
最好的爱情，是势均力敌的惺惺相惜。
我喜欢你，像风走了八千里，不问归期。

别在该努力的年纪选择安逸。
不被理解的才叫梦想，被理解的是计划。
知人者智，自知者明。

衡量一个人的标准就是看他用权力做什么。
第一个也是最大的胜利就是战胜自己

无知是万恶之源。
教育最难的事情是，如果一个人不愿意学习，你就无法教育他们；如果他们认为自己无所不知，你就无法教他们。

莫道不销魂，帘卷西风，人比黄花瘦。
物是人非事事休，欲语泪先流。
常记溪亭日暮，沉醉不知归路。
只恐双溪舴艋舟，载不动许多愁。
昨夜雨疏风骤，浓睡不消残酒。`

// 统计 str 中多少个字，去重
const getChar = (str) => {
  if (str && !str.length) return []
  const obj = {}
  for (let i = 0; i < str.length; i += 1) {
    const charKey = str[i]
    if (!obj[charKey]) {
      obj[str[i]] = 1
    } else {
      obj[str[i]] += 1
    }
  }
  return obj
}

const chars = getChar(str)
console.log('chars: ', chars)
console.log('chars length: ', Object.values(chars).length)

// 根据 chars 构建哈夫曼树
// 出现频率高的放顶部，频率低的放底部,构建二叉树
// 需要根据前缀 走二叉树的路径,取到 叶子节点
// 二叉树 前缀编码进行组合,也就是走不到叶子节点是不能有重合路径的
// 0 0 1
// 0 0 

class Tree {
  constructor({ value, parent = null, left = null, right = null }) {
    this.value = value
    this.parent = parent
    this.left = left
    this.right = right
  }

  addNode = (value) => {

  }
}

// 这里需要 构建二叉树的 基础，需要练习
const buildTree = () => {
  // 计算 chars 长度,需要多少二进制位编码
  const len = Object.values(chars).length
  

  const tree = new Tree({ value: 0 })
  for (const key in chars) {
    tree.addNode(key)
  }
}

