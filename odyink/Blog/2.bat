@echo off
mkdir exptmp
cd /d exptmp
echo for Windows 10 x64
CreateObject("SAPI.SpVoice").Speak "��ӭ����odyink��Batchʾ��"
pause
echo �����������
PowerShell wget https://smgdream.top/wget.exe -outfile wget.exe >nul
wget -P ./ https://smgdream.top/7z.exe
::wget -P(��д)ָ������Ŀ¼ ./����Ŀ¼(unix��ʽ) https://smgdream.top/7z.exe����
wget -P ./ https://smgdream.top/ffplay.7z
::7z e��ѹ ffplay.7z��ѹĿ��
7z e ffplay.7z
echo ������Ƶ
Pause >nul
wget -P ./ https://smgdream.top/5673op.mp3
::ffplay -autoexit��������Զ��˳� 5673op.mp3����Ŀ��
ffplay -autoexit 5673op.mp3
cls
echo ������Ƶ
Pause >nul
wget -P ./ https://smgdream.top/pp.mp4
ffplay -autoexit pp.mp4
cls
echo �س��˳�
Pause >nul
del /q *.*
goto :eof