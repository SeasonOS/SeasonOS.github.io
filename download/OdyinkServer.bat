@echo off
::3.0
chcp 936 >nul
title Odyink [for WindowsServer]
color 0b
cd /d %~dp0
if exist ServerOK del ServerOK
::::::::::::::::::::::::::::::::::::::::::::::::::���Ƿֽ���::::::::::::::::::::::::::::::::::::::::::::::::::
:Check
if not exist Odyink\Odyink.txt goto install
cd Odyink\
echo ����Ƿ����PowerShell
set ps=
if not exist %SystemRoot%\System32\WindowsPowerShell\v1.0\PowerShell.exe ( 
    set ps=notps
    goto PutCheck
)
echo ���������
set net=
if exist index.html del index.html
PowerShell wget https://www.kernel.org/index.html -outfile index.html >nul
if exist index.html (
    if exist index.html del index.html
    set net=ok
    echo ServerOK >ServerOK
)
::::::::::::::::::::::::::::::::::::::::::::::::::���Ƿֽ���::::::::::::::::::::::::::::::::::::::::::::::::::
:PutCheck
cls
echo.
if "%ps%"=="notps" echo ���Ҳ���PowerShell�޷��������
if "%net%"=="ok" echo �������ɹ�����
if "%net%"=="" echo �������
timeout /t 2 /nobreak >nul
::::::::::::::::::::::::::::::::::::::::::::::::::���Ƿֽ���::::::::::::::::::::::::::::::::::::::::::::::::::
:menu
cls
echo ******************************
echo **          �����          **
echo ******************************
echo **                          **
echo **  1.У������              **
echo **  2.��������              **
echo **  3.ɾ������              **
echo **  4.�˳���¼              **
echo **                          **
echo ******************************
echo.
echo.
set Munum=
set /p Munum=��ţ�
cls
if "%Munum%"=="1" goto VB
if "%Munum%"=="2" goto cpBlog
if "%Munum%"=="3" goto DBlog
if "%Munum%"=="4" goto exit
echo ������Ч
timeout /t 2 /nobreak >nul
goto menu
::::::::::::::::::::::::::::::::::::::::::::::::::���Ƿֽ���::::::::::::::::::::::::::::::::::::::::::::::::::
:VB
cls
echo     OdyInk
echo.
echo.
echo.
echo.
call Bloglist.bat
echo.
echo.
call Blognum.bat
if "%Blognum:~-1%"==" " set Blognum=%Blognum:~0,-1%
echo   Ŀǰ��%Blognum%ƪ����
echo.
echo.
echo         q.������ҳ
set EBlognum=
set /p EBlognum=������ţ�
cls
if "%EBlognum%"=="q" goto menu
if "%EBlognum%"=="" (
    echo �����²����ڻ��ѱ�����Աɾ��
    echo ���������б�
    timeout /t 2 /nobreak >nul
    goto VB
)
if "%EBlognum%"==" " (
    echo �����²����ڻ��ѱ�����Աɾ��
    echo ���������б�
    timeout /t 2 /nobreak >nul
    goto VB
)
::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~����С�ֽ���~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:NBBlog
if not exist Blog\"%EBlognum%.txt" (
    echo �����²����ڻ��ѱ�����Աɾ��
    echo ���������б�
    timeout /t 2 /nobreak >nul
    goto VB
)
::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~����С�ֽ���~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
type Blog\%EBlognum%.txt
echo.
echo.
echo.
echo b.��һƪ q.�����б� n.��һƪ
echo.
echo          c.�޸�����
echo.
:BlogconNE
set Blogcon=
set /p Blogcon=������ţ�
if "%Blogcon%"=="b" goto backBlog
if "%Blogcon%"=="n" goto nextBlog
if "%Blogcon%"=="q" goto VB
if "%Blogcon%"=="c" (
    notepad.exe .\Blog\%EBlognum%.txt
    cls
    goto NBBlog
)
echo ������Ч����������
echo.
goto BlogconNE
::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~����С�ֽ���~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:backBlog
set StartEBlognum=%EBlognum%
cls
:Back
set /a EBlognum=%EBlognum%-1
set /a AV=%StartEBlognum%-%EBlognum%
if %AV%==101 goto NBBlog
if %EBlognum%==-1 goto NBBlog
if exist Blog\%EBlognum%.txt goto NBBlog
goto Back
::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~����С�ֽ���~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:nextBlog
set StartEBlognum=%EBlognum%
cls
:Next
set /a EBlognum=%EBlognum%+1
set /a AV=%EBlognum%-%StartEBlognum%
if %AV%==101 goto NBBlog
if exist Blog\%EBlognum%.txt goto NBBlog
goto Next
::::::::::::::::::::::::::::::::::::::::::::::::::���Ƿֽ���::::::::::::::::::::::::::::::::::::::::::::::::::
:cpBlog
cls
set Docname=
set Blognum=
set NewBlognum=
set Blogtitle=
::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~����С�ֽ���~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
echo.
echo ֧�ֱ���ANSI GBK (UTF-8��Ӣ�ģ�����)
echo ֧���ļ���ʽtxt
echo ֧���Ϸ��ļ�(�ǵûس�)
echo.
echo.
echo.
echo q.����
set /p Docname=�����ļ���(�޺�׺)��
if "%Docname%"=="q" goto menu
if exist "%Docname%" goto iptitle
if not exist ..\"%Docname%.txt" goto CantcpBlog
:iptitle
call Blognum.bat
if "%Blognum:~-1%"==" " set Blognum=%Blognum:~0,-1%
set /a NewBlognum=%Blognum%+1
call BlogAnum.bat
if "%BlogAnum:~-1%"==" " set BlogAnum=%BlogAnum:~0,-1%
set /a NewBlogAnum=%BlogAnum%+1
set /p Blogtitle=���±��⣺
if "%Blogtitle%"=="q" goto cpBlog
::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~����С�ֽ���~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cls
echo set Blognum=%NewBlognum% >Blognum.bat
echo set BlogAnum=%NewBlogAnum% >BlogAnum.bat
echo set NEB%NewBlogAnum%=E>>Blogexist.bat
echo if not %%NEB%NewBlogAnum%%%==Del echo %NewBlogAnum%.%Blogtitle% >>Bloglist.bat
echo %date:~0,-2%%time% copy "%Docname%" to .\Odyink\Blog\ (num:%NewBlogAnum%) >>Bloglog.log
if exist ..\"%Docname%.txt" copy  ..\"%Docname%.txt" Blog\%NewBlogAnum%.txt >nul
if exist "%Docname%" copy "%Docname%" Blog\%NewBlogAnum%.txt >nul
echo �������
timeout /t 2 /nobreak >nul
goto cpBlog
::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~����С�ֽ���~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:CantcpBlog
cls
echo �����ļ��������Ϲ淶�������ļ�������
echo ��������Ч�����ļ���
timeout /t 3 /nobreak >nul
goto cpBlog
::::::::::::::::::::::::::::::::::::::::::::::::::���Ƿֽ���::::::::::::::::::::::::::::::::::::::::::::::::::
:DBlog
cls
set willDelBlog=
set DelBlogyn=
call Bloglist.bat
call Blognum.bat
::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~����С�ֽ���~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:DelBlog
echo ����q�˳�ɾ��
set /p willDelBlog=Ҫɾ��������ţ�
if "%willDelBlog%"=="" goto DelBlogE
if "%willDelBlog%"=="q" goto menu
if not exist Blog\"%willDelBlog%.txt" goto DelBlogE
:BackDelyn
set /p DelBlogyn=�Ƿ�ɾ��yn:
if "%DelBlogyn%"=="y" goto DelBlognow
if "%DelBlogyn%"=="n" goto DelBlog
echo ������Ч
goto BackDelyn
::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~����С�ֽ���~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:DelBlognow
echo set NEB%willDelBlog%=Del >>Blogdel.bat
set /a NewBlognum=%Blognum%-1
echo set Blognum=%NewBlognum% >Blognum.bat
echo %date:~0,-2%%time% del %willDelBlog%.txt from .\Odyink\Blog\ (num:%willDelBlog%) >>Bloglog.log
del Blog\%willDelBlog%.txt
echo ɾ�����
timeout /t 2 /nobreak >nul
cls
goto DBlog
::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~����С�ֽ���~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
:DelBlogE
echo �����²����ڻ��ѱ�����Աɾ��
goto DelBlog
::::::::::::::::::::::::::::::::::::::::::::::::::���Ƿֽ���::::::::::::::::::::::::::::::::::::::::::::::::::
:install
echo �س���װOdyink
echo ����Ѱ�װ�����ʾ���ļ��𻵣����ֶ��˳�����ļ�������
pause >nul
echo ���ڰ�װOdyink
mkdir Odyink >nul
mkdir Odyink\Blog >nul
cd Odyink
if exist Blog\*.txt del /f /s /q Blog\*.txt >nul
::~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~����С�ֽ���~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo Odyink for WindowsServer(By SMG)>Odyink.txt
echo set Blognum=1 >Blognum.bat
echo set BlogAnum=0 >BlogAnum.bat
echo set NEB0=E>>Blogexist.bat
echo call Blogexist.bat >>Bloglist.bat
echo if exist Blogdel.bat call Blogdel.bat>>Bloglist.bat
echo if not %%NEB0%%==Del echo 0.��ӭʹ��Odyink>>Bloglist.bat
echo ::Blogdel>Blogdel.bat
echo [Bloglog]>Bloglog.log
echo ��ӭʹ��Odyink for Windows Server(By SMG)>>Blog\0.txt
echo.>>Blog\0.txt
echo.>>Blog\0.txt
echo.>>Blog\0.txt
echo Odyink����Andy(python)��SMG(Batch)�����������и��˲������� >>Blog\0.txt
echo.>>Blog\0.txt
cd ..\
cls
echo ��װ���
timeout /t 2 /nobreak >nul
cls
goto Check
::::::::::::::::::::::::::::::::::::::::::::::::::���Ƿֽ���::::::::::::::::::::::::::::::::::::::::::::::::::
:exit
cls
echo �����˳�Odyink...
if exist ServerOK del ServerOK
timeout /t 2 /nobreak >nul
exit