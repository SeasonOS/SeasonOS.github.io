@echo off
title Batch Exp
color 02
if exist .\Blog\exptmp\ rd /s /q .\Blog\exptmp
mkdir .\Blog\exptmp >nul
    cd /d .\Blog\exptmp
echo for Windows 10 x64
echo ��ӭ����odyink��Batchʾ��
rem echo CScript�ű������� ָ������˵�� "˵������(Ů��)" �� peak0.vbs
    echo CreateObject("SAPI.SpVoice").Speak "��ӭ����odyink��Batchʾ��">speak0.vbs
    .\speak0.vbs
pause
cls
echo �����������
    PowerShell Invoke-WebRequest https://smgdata-1302226504.cos.accelerate.myqcloud.com/wget.exe -outfile wget.exe >nul
    wget --no-check-certificate -P ./ https://smgdata-1302226504.cos.accelerate.myqcloud.com/7z.exe
    rem wget -P(��д)ָ��Ŀ¼ ./����Ŀ¼ https://smgdata-1302226504.cos.accelerate.myqcloud.com/7z.exe����
    wget --no-check-certificate -P ./ https://smgdata-1302226504.cos.accelerate.myqcloud.com/7z.dll
    wget --no-check-certificate -P ./ https://smgdata-1302226504.cos.accelerate.myqcloud.com/ffplay.7z
cls
echo ��ѹ�ļ���
rem 7z e��ѹ ffplay.7z��ѹĿ��
7z e ffplay.7z
cls
echo �س�������Ƶ
Pause >nul
rem ffplay -autoexit��������Զ��˳� music.mp3����Ŀ��
ffplay -autoexit https://smgdata-1302226504.cos.accelerate.myqcloud.com/music.mp3
cls
echo �س�������Ƶ
Pause >nul
wget --no-check-certificate -P ./ https://smgdata-1302226504.cos.accelerate.myqcloud.com/mv.mp4
ffplay -fs -autoexit mv.mp4
cls
echo �س��˳�
Pause >nul
cd ..\
rd /s /q .\exptmp
cd ..\
goto :eof