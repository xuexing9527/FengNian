' 获取当前脚本所在的目录路径
Dim fileSystem, file, scriptPath, filePath
Set fileSystem = CreateObject("Scripting.FileSystemObject")

' 获取当前脚本所在目录的路径
scriptPath = fileSystem.GetParentFolderName(WScript.ScriptFullName)

' 定义相对路径文件
filePath = scriptPath & "\virus_demo.txt"

' 创建或打开文件并写入内容
Set file = fileSystem.OpenTextFile(filePath, 8, True)
file.WriteLine("This is a simple virus demo using relative path.")
file.Close
