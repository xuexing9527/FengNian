Option Explicit

Dim shell, desktopPath, shortcut, url, shortcutPath

Set shell = CreateObject("WScript.Shell")
' 获取当前脚本所在的目录路径
Dim fileSystem, file, scriptPath, filePath
Set fileSystem = CreateObject("Scripting.FileSystemObject")

' 获取当前脚本所在目录的路径
scriptPath = fileSystem.GetParentFolderName(WScript.ScriptFullName)

' 定义要创建快捷方式的网址和快捷方式的保存路径
url = "https://www.baidu.com"  ' 可以替换为你想要的 URL
shortcutPath = scriptPath & "\ExampleWebsite.lnk"  ' 快捷方式保存位置

' 创建快捷方式对象
Set shortcut = shell.CreateShortcut(shortcutPath)

' 设置快捷方式的属性
shortcut.TargetPath = url  ' 设置目标路径为 URL
shortcut.WindowStyle = 1   ' 设置快捷方式的窗口样式，1 表示普通窗口
shortcut.Description = "Click here to visit Example Website"  ' 设置描述

' 保存快捷方式
shortcut.Save

' MsgBox "快捷方式已成功创建到桌面！",vbCritical, "成功"
' MsgBox "The end!!", vbCritical, "Message"


