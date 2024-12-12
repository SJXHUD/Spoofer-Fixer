@echo off
chcp 65001 >nul
title Spoofer Fixer by SJX

:menu
cls
echo.
echo.
echo [38;2;0;100;0m                            .▄▄ ·  ▄▄▄·            ·▄▄▄▄▄▄ .▄▄▄      ·▄▄▄▪  ▐▄• ▄ ▄▄▄ .▄▄▄  [0m
echo [38;2;0;150;0m                            ▐█ ▀. ▐█ ▄█▪     ▪     ▐▄▄·▀▄.▀·▀▄ █·    ▐▄▄·██  █▌█▌▪▀▄.▀·▀▄ █·[0m
echo [38;2;0;200;0m                            ▄▀▀▀█▄ ██▀· ▄█▀▄  ▄█▀▄ ██▪ ▐▀▀▪▄▐▀▀▄     ██▪ ▐█· ·██· ▐▀▀▪▄▐▀▀▄ [0m
echo [38;2;0;220;0m                            ▐█▄▪▐█▐█▪·•▐█▌.▐▌▐█▌.▐▌██▌.▐█▄▄▌▐█•█▌    ██▌.▐█▌▪▐█·█▌▐█▄▄▌▐█•█▌[0m
echo [38;2;0;255;0m                             ▀▀▀▀ .▀    ▀█▄▀▪ ▀█▄▀▪▀▀▀  ▀▀▀ .▀  ▀    ▀▀▀ ▀▀▀•▀▀ ▀▀ ▀▀▀ .▀  ▀[0m
echo [38;2;0;100;0m                                                                              by SJX @sjxhud [0m
echo.
:: 42
echo [38;2;0;255;0m                                      •.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.•
echo [38;2;0;255;0m                                      • 1) Check Serials                        •
echo [38;2;0;255;0m                                        2) Install Runtimes
echo [38;2;0;255;0m                                        3) Turn off Secure Boot
echo [38;2;0;255;0m                                        4) Disable TPM
echo [38;2;0;255;0m                                        5) Disable Hyper-V
echo [38;2;0;255;0m                                        6) Lower/Disable UAC Settings
echo [38;2;0;255;0m                                        7) Disable Driver Signature Enforcement
echo [38;2;0;255;0m                                        8) Force Close Easy Anti-Cheat
echo [38;2;0;255;0m                                        9) Force Close BattlEye
echo [38;2;0;255;0m                                        10) Download Windscribe
echo [38;2;0;255;0m                                        11) Download WARP
echo [38;2;0;255;0m                                        12) Join Discord
echo [38;2;0;255;0m                                        13) Install gpedit.msc
echo [38;2;0;255;0m                                        14) Activate Windows
echo [38;2;0;255;0m                                      • 15) Exit                                •
echo [38;2;0;255;0m                                      •.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.·.•
set /p choice=Select an option (1-12):

if %choice%==1 goto check_serials
if %choice%==2 goto install_runtimes
if %choice%==3 goto turn_off_secure_boot
if %choice%==4 goto disable_tpm
if %choice%==5 goto disable_hyperv
if %choice%==6 goto lower_uac
if %choice%==7 goto disable_dse
if %choice%==8 goto close_eac
if %choice%==9 goto close_battleye
if %choice%==10 goto use_windscribe
if %choice%==11 goto use_warp
if %choice%==12 goto discord
if %choice%==13 goto gpedit
if %choice%==14 goto activatewindows
if %choice%==15 goto exit

:activatewindows
powershell -Command "irm https://massgrave.dev/get | iex"
pause
goto menu

:gpedit
cls
pushd "%~dp0" 
 
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >List.txt 
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>List.txt 
 
for /f %%i in ('findstr /i . List.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i" 
pause
goto menu

:check_serials
cls
echo ==========================================
echo              Checking Disk
echo ==========================================
wmic diskdrive get SerialNumber
echo ==========================================
echo           Checking Motherboard
echo ==========================================
wmic baseboard get product,serialnumber
echo ==========================================
echo              Checking SMBIOS
echo ==========================================
wmic csproduct get UUID
echo ==========================================
echo            Checking MAC Address
echo ==========================================
getmac /v /fo list
pause
goto menu

:discord
cls
echo ==========================================
echo       Joining SJX's Discord Server
echo ==========================================
start https://discord.com/invite/U8bNj2fdpM
pause
goto menu

:install_runtimes
cls
echo ==========================================
echo      Installing VC++ Redist and DirectX
echo ==========================================
echo Downloading and installing VC++ Redist...
powershell -command "Start-Process https://aka.ms/vs/17/release/vc_redist.x64.exe -Wait"
echo Downloading and installing DirectX...
powershell -command "Start-Process https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe -Wait"
pause
goto menu

:use_windscribe
cls
echo ==========================================
echo    Redirecting to Windscribe Website...
echo ==========================================
start https://windscribe.com/
pause
goto menu

:use_warp
cls
echo ==========================================
echo Redirecting to Cloudflare WARP Download...
echo ==========================================
start https://one.one.one.one/
pause
goto menu

:turn_off_secure_boot
cls
echo ============================================
echo Please disable Secure Boot manually in BIOS.
echo ============================================
pause
goto menu

:disable_tpm
cls
echo ==========================================
echo             Disabling TPM...
echo ==========================================
reg add "HKLM\System\CurrentControlSet\Services\Tpm" /v Start /t REG_DWORD /d 4 /f
echo TPM Disabled.
pause
goto menu

:lower_uac
cls
echo ==========================================
echo        Lowering/Disabling UAC...
echo ==========================================
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f
echo UAC Disabled.
pause
goto menu

:disable_dse
cls
echo ==========================================
echo  Disabling Driver Signature Enforcement...
echo ==========================================
bcdedit /set nointegritychecks on
echo Driver Signature Enforcement Disabled.
pause
goto menu

:disable_hyperv
cls
echo ==========================================
echo           Disabling Hyper-V...
echo ==========================================
bcdedit /set hypervisorlaunchtype off
dism /Online /Disable-Feature:Microsoft-Hyper-V-All
echo Hyper-V Disabled.
pause
goto menu

:close_eac
cls
echo ==========================================
echo    Forcing Close of Easy Anti-Cheat...
echo ==========================================
taskkill /F /IM EasyAntiCheat.exe
echo Easy Anti-Cheat Closed.
pause
goto menu

:close_battleye
cls
echo ==========================================
echo        Forcing Close of BattlEye...
echo ==========================================
taskkill /F /IM BEService.exe
echo BattlEye Closed.
pause
goto menu

:exit
exit
