# npm 常用命令

``` bash
# 获取源
npm get registry 
# 清除缓存
npm cache clean --force
# 加上调试标志
npm install --verbose

# 临时切源
npm install <package> --registry=https://registry.npmjs.org/
# 配置切源
npm config set registry https://registry.npmjs.org/


```