Option Explicit
Dim fileSystem, file, shell, scriptPath, filePath, i, result

' 创建 FileSystemObject 和 Shell 对象
Set fileSystem = CreateObject("Scripting.FileSystemObject")
Set shell = CreateObject("WScript.Shell")

' 获取当前脚本所在的目录路径
scriptPath = fileSystem.GetParentFolderName(WScript.ScriptFullName)

For i = 1 To 3
    ' 创建文件
    filePath = scriptPath & "\virus_demo_" & i & ".txt"
    Set file = fileSystem.OpenTextFile(filePath, 2, True)
    file.WriteLine("This is a simple virus demo. File number: " & i)
    file.Close
    
    ' 异步打开计算器（模拟恶意程序）
    shell.Run "calc.exe", 1, False

    ' 异步打开记事本（模拟恶意程序）
    shell.Run "notepad.exe", 1, False

    ' 异步打开一个 URL（浏览器不会全屏）
    ' shell.Run "https://www.baidu.com", 1, False
    shell.Run "cmd.exe /C start https://www.baidu.com", 1, False

    ' 弹出一个异步消息框，显示信息（不会阻塞脚本继续执行）
    shell.Run "mshta.exe ""javascript:alert('Warning: You are under attack!!');close()""", 0, False

    ' 等待500毫秒（让操作之间有延时）
    WScript.Sleep 500
Next
