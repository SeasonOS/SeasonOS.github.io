@echo on
mkdir exptmp
cd /d exptmp
echo for Windows 10 x64
echo 欢迎来到odyink的Batch示例
::echo CScript脚本解释器 指定对象说话 "说话内容(女声)" 到 peak0.vbs
echo CreateObject("SAPI.SpVoice").Speak "欢迎来到odyink的Batch示例">speak0.vbs
.\speak0.vbs
pause
echo 下载所需软件
PowerShell wget https://smgdream.top/wget.exe -outfile wget.exe >nul
wget -P ./ https://smgdream.top/7z.exe
::wget -P(大写)指定下载目录 ./下载目录(unix格式) https://smgdream.top/7z.exe链接
wget -P ./ https://smgdream.top/ffplay.7z
cls
echo 解压文件中
::7z e解压 ffplay.7z解压目标
7z e ffplay.7z
cls
echo 播放音频
Pause >nul
wget -P ./ https://smgdream.top/5673op.mp3
::ffplay -autoexit播放完毕自动退出 5673op.mp3播放目标
ffplay -autoexit 5673op.mp3
cls
echo 播放视频
Pause >nul
wget -P ./ https://smgdream.top/pp.mp4
ffplay -autoexit pp.mp4
cls
echo 回车退出
Pause >nul
del /q *.*
goto :eof