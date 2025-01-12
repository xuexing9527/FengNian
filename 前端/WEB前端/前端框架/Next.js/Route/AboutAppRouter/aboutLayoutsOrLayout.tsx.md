# Layouts
对应官网链接：https://nextjs.org/docs/app/building-your-application/routing/layouts-and-templates  
- App Router 中 layout.tsx 是如何嵌套的？  
- layout.tsx 注意事项：  
    - Only the root layout can contain <html> and <body> tags.  
    只有 root layout 才能包含 html 和 body 标签  
        - 但是我自己写的时候，发现在子 layout.tsx 中写 body 和 html 标签，root layout （root layout 就是根 目录 app 文件夹下的 layout.tsx）不写 html 和 body 标签，直接 return child，去访问子页面并不报错。不过再切换到主页 `'/'` 的时候，会报错：  
            > Missing required html tags  
                The following tags are missing in the Root Layout: <html>, <body>.  
                Read more at https://nextjs.org/docs/messages/missing-root-layout-tags