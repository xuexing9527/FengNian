# Layouts
对应官网链接：https://nextjs.org/docs/app/building-your-application/routing/layouts-and-templates  
- App Router 中 layout.tsx 是如何嵌套的？  
- layout.tsx 注意事项：  
    - Only the root layout can contain <html> and <body> tags.  
    只有 root layout 才能包含 html 和 body 标签  
        - 但是我自己写的时候，发现可以在子 layout.tsx 中写 body 和 html 标签，但前提是 root layout （root layout 就是根 目录 app 文件夹下的 layout.tsx）不写 html 和 body 标签，直接 return child，如：

        ````tsx
        // app/layout.tsx
        // root layout
        export default function RootLayout({
            children,
        }: Readonly<{
            children: React.ReactNode;
        }>) {
            return children
        }

        // app/sub/layout.tsx
        // sub layout

        export default function SubLayout({
            children,
        }: Readonly<{
            children: React.ReactNode;
        }>) {
            return <html><body className="s">{children}</body></html>;
        }
        ````


