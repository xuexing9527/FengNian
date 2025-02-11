Option Explicit
Dim shell, count, exitFlag, startTime, elapsedTime

' 创建 Shell 对象
Set shell = CreateObject("WScript.Shell")

' 初始化退出标志
exitFlag = False

' 启动计算器
shell.Run "calc.exe", 1, False
WScript.Sleep 1000 ' 等待计算器完全打开

' 初始化计数器
count = 0

' 获取当前时间戳（自午夜以来的秒数）
startTime = Timer

' 提示用户按 "Ctrl+Q" 来停止脚本
' MsgBox "脚本正在运行，按 Ctrl + Q 可以退出。", vbInformation, "安全退出提示"
' MsgBox "Warning: You are under attack!!", vbCritical, "Virus warning"


' 循环，进行累加操作，添加最大运行时间为 10 秒
Do While Not exitFlag
    ' 发送当前的累加数字到计算器
    shell.SendKeys count
    shell.SendKeys "+"   ' 按下加号
    count = count + 1    ' 累加
    shell.SendKeys count
    shell.SendKeys "="   ' 按下等号

    ' 等待50毫秒
    WScript.Sleep 50

    ' 计算经过的时间（单位：秒）
    elapsedTime = Timer - startTime

    ' 如果经过 20 秒，自动退出脚本
    If elapsedTime >= 20 Then
        exitFlag = True
    End If
Loop

' 提示用户脚本已退出
' MsgBox "脚本已退出。", vbInformation, "退出提示"
MsgBox "The end!!", vbCritical, "Message"
