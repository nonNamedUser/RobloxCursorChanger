@echo off

call kill.bat

setlocal enabledelayedexpansion

set "users_path=C:\Users"
set "target_file=RobloxPlayerInstaller.exe"
set "cursor_file1=MouseLockedCursor.png"
set "cursor_file2=ArrowCursor.png"
set "cursor_file3=ArrowFarCursor.png"
set "cursor_file4=IBeamCursor.png"
set "content_folder=content\textures"
set "cursors=content\textures\Cursors\KeyboardMouse"

for /d %%u in ("%users_path%\*") do (
    set "roblox_path=%%u\AppData\Local\Roblox"

    if exist "!roblox_path!" (
        echo Checking Roblox directory for user %%u

        for /d %%v in ("!roblox_path!\Versions\version-*") do (
            if exist "%%v\%target_file%" (
                echo Found version folder: %%v

                if exist "%%v\%content_folder%\%cursor_file1%" (
                    echo MouseLockedCursor.png found in %%v\%content_folder%
                    del /f /q "%%v\%content_folder%\%cursor_file1%"
                    echo Removed MouseLockedCursor.png
                ) else (
                    echo MouseLockedCursor.png not found in %%v\%content_folder%
                )

                copy "%~dp0\Mouse\%cursor_file1%" "%%v\%content_folder%\" /Y
                echo Copied MouseLockedCursor.png to %%v\%content_folder%

                if exist "%%v\%cursors%" (
                    echo Cursors folder found: %%v\%cursors%

                    if exist "%%v\%cursors%\%cursor_file2%" (
                        echo ArrowCursor.png found
                        del /f /q "%%v\%cursors%\%cursor_file2%"
                        echo Removed ArrowCursor.png
                    ) else (
                        echo ArrowCursor.png not found
                    )
                    copy "%~dp0\Mouse\%cursor_file2%" "%%v\%cursors%\" /Y
                    echo Copied ArrowCursor.png to %%v\%cursors%

                    if exist "%%v\%cursors%\%cursor_file3%" (
                        echo ArrowFarCursor.png found
                        del /f /q "%%v\%cursors%\%cursor_file3%"
                        echo Removed ArrowFarCursor.png
                    ) else (
                        echo ArrowFarCursor.png not found
                    )

                    copy "%~dp0\Mouse\%cursor_file3%" "%%v\%cursors%\" /Y
                    echo Copied ArrowFarCursor.png to %%v\%cursors%

                    if exist "%%v\%cursors%\%cursor_file4%" (
                        echo IBeamCursor.png found
                        del /f /q "%%v\%cursors%\%cursor_file4%"
                        echo Removed IBeamCursor.png
                    ) else (
                        echo IBeamCursor.png not found
                    )
                    copy "%~dp0\Mouse\%cursor_file4%" "%%v\%cursors%\" /Y
                    echo Copied IBeamCursor.png to %%v\%cursors%

                ) else (
                    echo Cursors folder not found in %%v
                )
            ) else (
                echo RobloxPlayerInstaller.exe not found in %%v
            )
        )
    ) else (
        echo No Roblox directory found for user %%u
    )
)

echo Done.
pause

