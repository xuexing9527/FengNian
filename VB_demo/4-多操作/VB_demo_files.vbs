Dim fileSystem, file, shell, scriptPath, filePath, i
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
    
    ' 打开计算器（模拟恶意程序）
    shell.Run "calc.exe", 1, False

    ' 打开一个 URL
    ' shell.Run "https://www.baidu.com"

    ' 弹出一个消息框，显示信息
    MsgBox "Warning: You are under attack!!", vbCritical, "Virus warning"

    ' 等待500毫秒
    WScript.Sleep 500
Next
