@echo off
title Batch Exp
mkdir .\Blog\exptmp >nul
    cd /d .\Blog\exptmp
echo for Windows 7 10 x64
echo ��ӭ����odyink��Batchʾ��
rem echo CScript�ű������� ָ������˵�� "˵������(Ů��)" �� peak0.vbs
    echo CreateObject("SAPI.SpVoice").Speak "��ӭ����odyink��Batchʾ��">speak0.vbs
    .\speak0.vbs
pause
cls
echo �����������
    PowerShell wget https://smgdream.top/wget.exe -outfile wget.exe >nul
    wget --no-check-certificate -P ./ https://smgdream.top/7z.exe
rem wget -P(��д)ָ������Ŀ¼ ./����Ŀ¼(unix��ʽ) https://smgdream.top/7z.exe����
wget --no-check-certificate -P ./ https://smgdream.top/ffplay.7z
cls
echo ��ѹ�ļ���
rem 7z e��ѹ ffplay.7z��ѹĿ��
7z e ffplay.7z
cls
echo �س�������Ƶ
Pause >nul
wget --no-check-certificate -P ./ https://smgdream.top/5673op.mp3
rem ffplay -autoexit��������Զ��˳� 5673op.mp3����Ŀ��
ffplay -autoexit 5673op.mp3
cls
echo �س�������Ƶ
Pause >nul
ffplay -autoexit https://smgdream.top/pp.mp4
cls
echo �س��˳�
Pause >nul
cd ..\
rd /s /q .\exptmp
cd ..\
goto :eof