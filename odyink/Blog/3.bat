@echo off
title ����ֱ��
color 02
if exist .\Blog\exptmp\ rd /s /q .\Blog\exptmp
mkdir .\Blog\exptmp >nul
    cd /d .\Blog\exptmp
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
title ����ֱ��
:back
cls
echo 1.CCTV 1
echo 2.���̨
echo q.�˳�(ȫ������Ҳ�����)
echo ��������Ч���
set /p tvnum=���:
if "%tvnum%"=="1" ffplay -fs -threads 16 "rtmp://58.200.131.2:1935/livetv/cctv1hd"
if "%tvnum%"=="2" ffplay -fs -threads 16 "http://116.199.5.52:8114/00000000/index.m3u8?&amp;Fsv_ctype=LIVES&amp;Fsv_otype=1&amp;FvSeid=5abd1660af1babb4&amp;Fsv_filetype=1&amp;Fsv_ctype=LIVES&amp;Fsv_cid=0&amp;Fsv_chan_hls_se_idx=188&amp;Fsv_rate_id=0&amp;Fsv_SV_PARAM1=0&amp;Fsv_ShiftEnable=0&amp;Fsv_ShiftTsp=0&amp;Provider_id=&amp;Pcontent_id=&amp;Fsv&amp;_res_tag_=video"
if /i "%tvnum%"=="q" (
    cd ..\
    rd /s /q .\exptmp
    cd ..\
    goto :eof
)
goto :back