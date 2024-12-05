' 获取当前脚本所在的目录路径
Dim fileSystem, file, scriptPath, filePath, i
Set fileSystem = CreateObject("Scripting.FileSystemObject")

' 获取当前脚本所在目录的路径
scriptPath = fileSystem.GetParentFolderName(WScript.ScriptFullName)

' 循环生成30个文件，每500毫秒生成一个文件
For i = 1 To 30
    ' 定义文件路径，使用递增数字来命名文件
    filePath = scriptPath & "\virus_demo_" & i & ".txt"
    
    ' 创建或打开文件并写入内容
    Set file = fileSystem.OpenTextFile(filePath, 8, True)
    file.WriteLine("This is a simple virus demo using relative path. File number: " & i)
    file.Close
    
    ' 等待500毫秒（0.5秒）再创建下一个文件
    WScript.Sleep 500
Next
