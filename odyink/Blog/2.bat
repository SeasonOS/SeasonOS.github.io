@echo off
title Batch Exp
mkdir .\Blog\exptmp >nul
    cd /d .\Blog\exptmp
echo for Windows 7 10 x64
echo 欢迎来到odyink的Batch示例
rem echo CScript脚本解释器 指定对象说话 "说话内容(女声)" 到 peak0.vbs
    echo CreateObject("SAPI.SpVoice").Speak "欢迎来到odyink的Batch示例">speak0.vbs
    .\speak0.vbs
pause
cls
echo 下载所需软件
    PowerShell wget https://smgdream.top/wget.exe -outfile wget.exe >nul
    wget --no-check-certificate -P ./ https://smgdream.top/7z.exe
rem wget -P(大写)指定下载目录 ./下载目录(unix格式) https://smgdream.top/7z.exe链接
wget --no-check-certificate -P ./ https://smgdream.top/ffplay.7z
cls
echo 解压文件中
rem 7z e解压 ffplay.7z解压目标
7z e ffplay.7z
cls
echo 回车播放音频
Pause >nul
wget --no-check-certificate -P ./ https://smgdream.top/5673op.mp3
rem ffplay -autoexit播放完毕自动退出 5673op.mp3播放目标
ffplay -autoexit 5673op.mp3
cls
echo 回车播放视频
Pause >nul
ffplay -autoexit https://smgdream.top/pp.mp4
cls
echo 回车退出
Pause >nul
cd ..\
rd /s /q .\exptmp
cd ..\
goto :eof