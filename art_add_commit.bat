@echo off
set d=%date:~0,1000%
set t=%time:~0,8%
set timestamp=%d% %t%
 if not exist "ver.txt" echo 0 >> ver.txt
set filePath=ver.txt
set /a lastline = 0
for /f  %%i in (%filePath%) do (
	set /a lastline=lastline+1
)

echo 类型参考：^<New:新增、Edit:修改、Dev:用户文件、Revert:回滚^>
echo 书写格式参考：New:说明内容
echo.
set /p comments= 本地提交说明: 
echo [%timestamp%] commit: %comments% (%username%) v%lastline% >> history.txt
echo %lastLine% >> ver.txt
 
attrib +s +h ver.txt
git add -u
git commit -m "[%timestamp%] commit: %comments% (%username%) v%lastline%"

git log --stat -1
echo "Finished Add!"
pause