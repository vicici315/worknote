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

echo ���Ͳο���^<New:������Edit:�޸ġ�Dev:�û��ļ���Revert:�ع�^>
echo ��д��ʽ�ο���New:˵������
echo.
set /p comments= �����ύ˵��: 
echo [%timestamp%] commit: %comments% (%username%) v%lastline% >> history.txt
echo %lastLine% >> ver.txt
 
attrib +s +h ver.txt
git add -u
git commit -m "[%timestamp%] commit: %comments% (%username%) v%lastline%"

git log --stat -1
echo "Finished Add!"
pause