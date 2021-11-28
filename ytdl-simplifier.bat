@echo off

:decide
title ytdl simplifier
cls
echo. 
SET /P choice= "Video(1) or Sound(2): "
IF "%choice%"=="1" GOTO :video
IF "%choice%"=="2" GOTO :sound
GOTO :decide

:video
title ytdl simplifier - Video downloader
cls
echo.
SET /P videourl= "Video | YouTube Link: "
youtube-dl.exe --format "bestvideo+bestaudio[ext=m4a]/bestvideo+bestaudio/best" --merge-output-format mp4 %videourl%
echo Done!
timeout /t 2 /nobreak > nul
GOTO :video

:sound
title ytdl simplifier - mp3 downloader
cls
echo.
SET /P soundurl= "Sound | YouTube Link: "
youtube-dl.exe -f "bestaudio/best" -ciw -o "%%(title)s.%%(ext)s" -v --extract-audio --audio-quality 0 --audio-format mp3 %soundurl%
echo Done!
timeout /t 2 /nobreak > nul
GOTO :sound
