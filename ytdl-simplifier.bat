@echo off

:: Check if youtube-dl.exe exists
if exist youtube-dl.exe (
GOTO :decide
) else (
echo Error: youtube-dl.exe not found
echo Please download and place youtube-dl.exe in the same directory as the ytdl-simplifier.bat
pause
exit
)

:: Decision if video or sound download is wanted
:decide
title ytdl simplifier
cls
echo. 
SET /P choice= "Video(1) or Sound(2): "
IF "%choice%"=="1" GOTO :video
IF "%choice%"=="2" GOTO :sound
GOTO :decidefail

:: If user types anything but 1 or 2 it will fail and give a message
:decidefail
title ytdl simplifier
cls
echo Error: Invalid choice
SET /P choice= "Video(1) or Sound(2): "
IF "%choice%"=="1" GOTO :video
IF "%choice%"=="2" GOTO :sound
GOTO :decidefail

:: Passing arguments for video downloading in mp4 using best quality
:video
title ytdl simplifier - Video downloader
cls
echo.
SET /P videourl= "Video | YouTube Link: "
youtube-dl.exe --format "bestvideo+bestaudio[ext=m4a]/bestvideo+bestaudio/best" --merge-output-format mp4 %videourl%
echo Done!
timeout /t 2 /nobreak > nul
GOTO :video

:: Passing arguments for sound downloading in mp3 using best quality
:sound
title ytdl simplifier - mp3 downloader
cls
echo.
SET /P soundurl= "Sound | YouTube Link: "
youtube-dl.exe -f "bestaudio/best" -ciw -o "%%(title)s.%%(ext)s" -v --extract-audio --audio-quality 0 --audio-format mp3 %soundurl%
echo Done!
timeout /t 2 /nobreak > nul
GOTO :sound