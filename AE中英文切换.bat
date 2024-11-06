@echo off
setlocal

:: 设置文件名
set chinese_file=application中文.xml
set english_file=application英文.xml
set default_file=application.xml

:: 检查是否存在 "application中文.xml"
if exist "%chinese_file%" (
    echo 切换为中文版
    :: 如果找到 "application中文.xml"，重命名 "application.xml" 为 "application英文.xml"
    if exist "%default_file%" (
        rename "%default_file%" "%english_file%"
    )
    :: 然后将 "application中文.xml" 重命名为 "application.xml"
    rename "%chinese_file%" "%default_file%"
) else (
    echo 切换为英文版
    :: 如果没找到 "application中文.xml"，重命名 "application.xml" 为 "application中文.xml"
    if exist "%default_file%" (
        rename "%default_file%" "%chinese_file%"
    )
    :: 并将 "application英文.xml" 重命名为 "application.xml"
    if exist "%english_file%" (
        rename "%english_file%" "%default_file%"
    )
)


:: 提示用户按空格键继续
echo 文件操作完成，请按空格键继续启动 AfterFX.exe...
pause >nul

:: 切换到上一级目录并尝试启动 AfterFX.exe
cd ..
if exist "AfterFX.exe" (
    start "" "AfterFX.exe"
) else (
    echo AfterFX.exe 未找到
)

:: 结束批处理脚本并关闭 CMD 窗口
exit