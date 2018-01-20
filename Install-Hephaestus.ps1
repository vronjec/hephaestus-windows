Import-Module PSWorkflow

# Create Start Menu and Quick Launch layout file
Set-Content -Path "$env:TEMP\StartLayout.xml" -Value @"
<?xml version="1.0" encoding="utf-8"?>
<LayoutModificationTemplate
    xmlns="http://schemas.microsoft.com/Start/2014/LayoutModification"
    xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout"
    xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout"
    xmlns:taskbar="http://schemas.microsoft.com/Start/2014/TaskbarLayout"
    Version="1">
    <LayoutOptions StartTileGroupsColumnCount="2" />
    <DefaultLayoutOverride>
        <StartLayoutCollection>
            <defaultlayout:StartLayout GroupCellWidth="6" xmlns:defaultlayout="http://schemas.microsoft.com/Start/2014/FullDefaultLayout">
                <start:Group Name="Office" xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout">
                    <start:Tile                   Row="0" Column="0" Size="2x2"             AppUserModelID="Microsoft.WindowsCalculator_8wekyb3d8bbwe!App" />
                    <start:DesktopApplicationTile Row="0" Column="2" Size="2x2" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Access 2016.lnk" />
                    <start:DesktopApplicationTile Row="0" Column="4" Size="2x2" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Excel 2016.lnk" />
                    <start:DesktopApplicationTile Row="2" Column="0" Size="2x2" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\OneNote 2016.lnk" />
                    <start:DesktopApplicationTile Row="2" Column="2" Size="2x2" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Outlook 2016.lnk" />
                    <start:DesktopApplicationTile Row="2" Column="4" Size="2x2" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\PowerPoint 2016.lnk" />
                    <start:DesktopApplicationTile Row="4" Column="0" Size="2x2" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Publisher 2016.lnk" />
                    <start:DesktopApplicationTile Row="4" Column="2" Size="2x2" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Word 2016.lnk" />
                    <start:DesktopApplicationTile Row="4" Column="4" Size="2x2" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Skype\Skype.lnk" />
                </start:Group>
                <start:Group Name="Development" xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout">
                    <start:DesktopApplicationTile Row="0" Column="0" Size="2x2" DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\System Tools\Command Prompt.lnk" />
                    <start:DesktopApplicationTile Row="0" Column="2" Size="2x2" DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell.lnk" />
                    <start:Tile                   Row="0" Column="4" Size="2x2"             AppUserModelID="CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc!ubuntu" />
                    <start:DesktopApplicationTile Row="2" Column="0" Size="2x2" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Cyberduck\Cyberduck.lnk" />
                    <start:DesktopApplicationTile Row="2" Column="2" Size="2x2" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Adobe Photoshop CC 2018.lnk" />
                    <start:DesktopApplicationTile Row="2" Column="4" Size="2x2" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\Visual Studio Code.lnk" />
                    <start:DesktopApplicationTile Row="4" Column="0" Size="2x2" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Hyper-V Manager.lnk" />
                    <start:DesktopApplicationTile Row="4" Column="2" Size="2x2" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Docker for Windows.lnk" />
                    <start:DesktopApplicationTile Row="4" Column="4" Size="2x2" DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\JetBrains Toolbox\PhpStorm.lnk" />
                </start:Group>
                <start:Group Name="Entertainment" xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout">
                    <start:DesktopApplicationTile Row="0" Column="0" Size="2x2" DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\Spotify.lnk" />
                    <start:DesktopApplicationTile Row="0" Column="2" Size="2x2" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Steam\Steam.lnk" />
                </start:Group>
            </defaultlayout:StartLayout>
        </StartLayoutCollection>
    </DefaultLayoutOverride>
    <CustomTaskbarLayoutCollection PinListPlacement="Replace">
        <defaultlayout:TaskbarLayout>
            <taskbar:TaskbarPinList>
                <taskbar:DesktopApp DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Google Chrome.lnk" />
                <taskbar:DesktopApp DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Skype\Skype.lnk" />
                <taskbar:UWA                    AppUserModelID="CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc!ubuntu" />
                <taskbar:DesktopApp DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\Visual Studio Code.lnk" />
                <taskbar:DesktopApp DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\JetBrains Toolbox\PhpStorm.lnk" />
            </taskbar:TaskbarPinList>
        </defaultlayout:TaskbarLayout>
    </CustomTaskbarLayoutCollection>
</LayoutModificationTemplate>
"@

function Install-WebRequest ($Installer, $ArgumentList, $Uri) {
    $FilePath = "$env:TEMP\$Installer"

    # Enable TLS 1.2
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    Invoke-WebRequest -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::FireFox -Uri "$Uri" -OutFile "$FilePath"

    Switch ([IO.Path]::GetExtension("$FilePath")) {
        ".msi" {
            Start-Process -FilePath msiexec -ArgumentList "/i $FilePath $ArgumentList" -Wait
        }

        default {
            Start-Process -FilePath "$FilePath" -ArgumentList "$ArgumentList" -Wait
        }
    }

    Remove-Item "$FilePath"
}

function Remove-DesktopItem ($Item) {
    $OneDrivePath = "${env:USERPROFILE}\OneDrive\Desktop\${Item}"
    $PublicPath = "${env:PUBLIC}\Desktop\${Item}"

    if (Test-Path -Path $OneDrivePath) {
        $FilePath = $OneDrivePath
    } elseif (Test-Path -Path $PublicPath) {
        $FilePath = $PublicPath
    } else {
        return
    }

    Remove-Item "$FilePath" -Force
}

function Remove-StartupItem ($Item) {
    $FilePath = "${env:APPDATA}\Microsoft\Windows\Start Menu\Programs\Startup\${Item}"

    Remove-Item "$FilePath"
}

function Set-RegistryKey ($Path, $Key, $Value) {
    if (-Not (Test-Path -Path $Path)) {
        New-Item -Path $Path -Force | Out-Null
        New-ItemProperty -Path $Path -Name $Key -Value $Value -PropertyType DWORD -Force | Out-Null
    } else {
        New-ItemProperty -Path $Path -Name $Key -Value $Value -PropertyType DWORD -Force | Out-Null
    }
}

function Remove-RegistryKey ($Path, $Key) {
    if (Test-Path -Path $Path) {
        Remove-ItemProperty -Path $Path -Name "$Key" -ErrorAction SilentlyContinue
    }
}

Workflow Install-Hephaestus
{
    # Disable System Restore to improve installation speed
    Disable-ComputerRestore -Drive "$env:SystemDrive"

    # Set power saving options
    powercfg -change monitor-timeout-ac 15
    powercfg -change monitor-timeout-dc 15
    powercfg -change disk-timeout-ac 0
    powercfg -change disk-timeout-dc 0
    powercfg -change standby-timeout-ac 0
    powercfg -change standby-timeout-dc 0

    # Set lid close action to do nothing
    powercfg -setacvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0
    powercfg -setdcvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0

    # Disable fast startup to ease BIOS access
    powercfg /hibernate off

    # Phase 1: Installation
    Parallel {

        # Install applications
        Sequence {
            # Install latest Chrome
            Install-WebRequest -Installer "ChromeSetup.msi" -ArgumentList "/quiet" -Uri "https://dl.google.com/chrome/install/googlechromestandaloneenterprise64.msi"

            # Install latest Firefox
            Install-WebRequest -Installer "FirefoxSetup.exe" -ArgumentList "-ms" -Uri "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US"

            # Install latest Opera
            Install-WebRequest -Installer "OperaSetup.exe" -ArgumentList "/silent /allusers=yes /launchopera=no /desktopshortcut=no /setdefaultbrowser=no /pintotaskbar=no /startmenushortcut=yes" -Uri "https://net.geo.opera.com/opera/stable/windows"

            # Install latest LastPass browser extensions
            Install-WebRequest -Installer "LastPassSetup.exe" -ArgumentList "--silinstall --userinstallchrome --userinstallff --userinstallie --noaddremove --nostartmenu --nohistory" -Uri "https://lastpass.com/download/cdn/lastpass_x64.exe"

            # Install latest Skype Classic
            Install-WebRequest -Installer "SkypeSetup.exe" -ArgumentList "/VERYSILENT /SP- /NOCANCEL /NORESTART /SUPPRESSMSGBOXES /NOLAUNCH" -Uri "https://go.skype.com/classic.skype"

            # Install latest Nomacs
            Install-WebRequest -Installer "NomacsSetup.msi" -ArgumentList "/passive" -Uri "http://download.nomacs.org/nomacs-setup-x64.msi"

            # Install MPC-HC
            # TODO: Add version-agnostic download link to latest release
            Install-WebRequest -Installer "MPCHCSetup.exe" -ArgumentList "/SP- /VERYSILENT /NORESTART" -Uri "https://binaries.mpc-hc.org/MPC%20HomeCinema%20-%20x64/MPC-HC_v1.7.13_x64/MPC-HC.1.7.13.x64.exe"

            # Install Adobe Creative Cloud
            Install-WebRequest -Installer "CreativeCloudSetup.exe" -ArgumentList "--mode=silent --action=install" -Uri "http://ccmdls.adobe.com/AdobeProducts/KCCC/1/win32/CreativeCloudSet-Up.exe"

            # Install FileOptimizer
            Install-WebRequest -Installer "FileOptimizerSetup.exe" -ArgumentList "/S" -Uri "https://sourceforge.net/projects/nikkhokkho/files/latest/download?source=files"

            # Install PeaZip
            # TODO: Add version-agnostic download link to latest release
            Install-WebRequest -Installer "PeaZipSetup.exe" -ArgumentList "/VERYSILENT" -Uri "http://www.peazip.org/downloads/peazip-6.5.0.WIN64.exe"

            # Install Cyberduck
            # TODO: Add version-agnostic download link to latest release
            Install-WebRequest -Installer "CyberduckSetup.exe" -ArgumentList "/quiet" -Uri "https://update.cyberduck.io/windows/Cyberduck-Installer-6.3.5.27408.exe"

            # Install Git
            # TODO: Refine installation: https://github.com/msysgit/msysgit/wiki/Silent-or-Unattended-Installation
            # TODO: Add version-agnostic download link to latest release
            Install-WebRequest -Installer "GitSetup.exe" -ArgumentList "/SILENT /COMPONENTS='icons,ext\reg\shellhere,assoc,assoc_sh'" -Uri "https://github.com/git-for-windows/git/releases/download/v2.15.0.windows.1/Git-2.15.0-64-bit.exe"

            # Install latest Visual Studio Code
            Install-WebRequest -Installer "VSCodeSetup.exe" -ArgumentList "/verysilent /suppressmsgboxes /mergetasks=!runcode,!desktopicon,quicklaunchicon,addcontextmenufiles,addcontextmenufolders,associatewithfiles,addtopath" -Uri "https://go.microsoft.com/fwlink/?Linkid=852157"

            # Install JetBrains Toolbox
            # TODO: Add version-agnostic download link to latest release
            Install-WebRequest -Installer "JetBrainsSetup.exe" -ArgumentList "/S /NoDesktopIcon" -Uri "https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.6.2914.exe"

            # TODO: Java Development Kit
            # TODO: Add version-agnostic download link to latest release
            #Invoke-WebRequest "http://download.oracle.com/otn-pub/java/jdk/9.0.1+11/jdk-9.0.1_windows-x64_bin.exe" -OutFile "$env:TEMP\JDKSetup.exe"
            #Start-Process -FilePath "$env:TEMP\JDKSetup.exe" -ArgumentList "/s STATIC=1 ADDLOCAL=ToolsFeature" -Wait

            # TODO: Android Studio
            # TODO: Visual Studio Emulator for Android (https://aka.ms/vscomemudownload)

            # Install latest Docker CE for Windows
            Install-WebRequest -Installer "DockerSetup.exe" -ArgumentList "install --quiet" -Uri "https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe"

            # Install latest Spotify
            Invoke-WebRequest "http://download.spotify.com/SpotifyFullSetup.exe" -OutFile "$env:TEMP\SpotifySetup.exe"
            $TaskName = "SpotifySetup"
            $Action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "$env:Temp\SpotifySetup.exe /Silent"
            Register-ScheduledTask -TaskName $TaskName -Action $Action -Trigger (New-ScheduledTaskTrigger -Once -At (Get-Date))
            Start-ScheduledTask -TaskName $TaskName
            Start-Sleep -s 1
            Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false

            # Install latest Steam
            Install-WebRequest -Installer "SteamSetup.exe" -ArgumentList "/S" -Uri "https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe"

            # TODO: C++ Redistributable Visual Studio 2017
            # https://aka.ms/vs/15/release/VC_redist.x64.exe
            # https://aka.ms/vs/15/release/VC_redist.x86.exe

            # TODO: Apache 2.4 (32bit)
            # TODO: Apache 2.4 (64bit)

            # TODO: PHP 5.6 (32bit)
            # TODO: PHP 5.6 (64bit)
            # TODO: Microsoft ODBC Driver for SQL Server 11
            # Install MsSQL-ODBC-11.msi
            # TODO: Microsoft PHP Driver for SQL Server 3.2
            # Install PHP extension MsSQL-PHP-3.2.exe to PHP 5.6 ext/ directory
            # Enable PHP extension in PHP 5.6

            # TODO: PHP 7.0 (32bit)
            # TODO: PHP 7.0 (64bit)
            # TODO: Microsoft ODBC Driver for SQL Server 13.1
            # Install MsSQL-ODBC-13.1.msi
            # TODO: Microsoft PHP Driver for SQL Server 4.0
            # Install PHP extension MsSQL-PHP-4.0.exe to PHP 7.0 ext/ directory
            # Enable PHP extension in PHP 7.0
        } # Sequence

        # Install Microsoft Office 365 Personal
        InlineScript {
            Invoke-WebRequest "https://officecdn.microsoft.com/db/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/en-US/O365HomePremRetail.img" -OutFile "$env:TEMP\OfficeSetup.img"
            New-Item -ItemType Directory -Force "$env:TEMP\OfficeSetup"
            $Image = Mount-DiskImage -ImagePath "$env:TEMP\OfficeSetup.img" -NoDriveLetter -PassThru
            $Drive = Get-WmiObject win32_volume -Filter "Label = '$((Get-Volume -DiskImage $Image).FileSystemLabel)'" -ErrorAction Stop
            $Drive.AddMountPoint("$env:TEMP\OfficeSetup")
            Start-Process -FilePath "$env:TEMP\OfficeSetup\Office\Setup64.exe" -Wait
            Dismount-DiskImage -ImagePath "$env:TEMP\OfficeSetup.img"
            Remove-Item -Force "$env:TEMP\OfficeSetup"
        } # InlineScript

        # Enable optional Windows features
        Sequence {
            # Enable Hyper-V
            Enable-WindowsOptionalFeature -FeatureName Microsoft-Hyper-V -Online -All -NoRestart -WarningAction SilentlyContinue

            # Enabling Containers
            Enable-WindowsOptionalFeature -FeatureName Containers -Online -All -NoRestart -WarningAction SilentlyContinue

            # Enable Windows Subsystem for Linux
            Enable-WindowsOptionalFeature -FeatureName Microsoft-Windows-Subsystem-Linux -Online -All -NoRestart -WarningAction SilentlyContinue
        } # Sequence

    } # Parallel

    # Restart computer
    Restart-Computer -Wait

    # Phase 2: Customization
    Parallel {

        # Set computer name
        Rename-Computer -NewName "hephaestus" -Force -WarningAction SilentlyContinue -ErrorAction SilentlyContinue

        # Configure hardware-specific settings
        Sequence {
            Switch -CaseSensitive ((Get-WmiObject -Class Win32_BIOS).SerialNumber) {
                "MP0ARBG" {
                    # Set service startup type to fix Bluetooth issues
                    #Set-Service –Name "bthhfsrv" –StartupType "Automatic"
                    #Set-Service –Name "bthserv" –StartupType "Automatic"

                    # Disable Intel HD Graphics tray icon
                    Remove-RegistryKey -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Key IgfxTray
                    Remove-RegistryKey -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Key HotKeysCmds
                    Remove-RegistryKey -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Key Persistence
                }
            }
        } # Sequence

        # Remove desktop icons and unused startup applications
        Sequence {
            Remove-DesktopItem -Item "Google Chrome.lnk"
            Remove-DesktopItem -Item "Mozilla Firefox.lnk"
            Remove-DesktopItem -Item "Skype.lnk"
            Remove-DesktopItem -Item "MPC-HC x64.lnk"
            Remove-DesktopItem -Item "PeaZip.lnk"
            Remove-DesktopItem -Item "Adobe Creative Cloud.lnk"
            Remove-DesktopItem -Item "FileOptimizer.lnk"
            Remove-DesktopItem -Item "Docker for Windows.lnk"
            Remove-DesktopItem -Item "Spotify.lnk"
            Remove-DesktopItem -Item "Steam.lnk"
            Remove-DesktopItem -Item "desktop.ini"

            Remove-StartupItem -Item "Send to OneNote.lnk"
            Remove-RegistryKey -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Key "Skype"
            Remove-RegistryKey -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Key "Spotify Web Helper"
        } # Sequence

        # Remove bloatware apps
        Sequence {
            Get-AppxPackage "89006A2E.AutodeskSketchBook" | Remove-AppxPackage
            Get-AppxPackage *bingnews* | Remove-AppxPackage
            Get-AppxPackage "Microsoft.BingWeather" | Remove-AppxPackage
            Get-AppxPackage *disneymagic* | Remove-AppxPackage
            Get-AppxPackage *empires* | Remove-AppxPackage
            Get-AppxPackage *king.com.* | Remove-AppxPackage
            Get-AppxPackage "Microsoft.GetHelp" | Remove-AppxPackage
            Get-AppxPackage "Microsoft.Getstarted" | Remove-AppxPackage
            Get-AppxPackage "Microsoft.Messaging" | Remove-AppxPackage
            Get-AppxPackage "Microsoft.MicrosoftOfficeHub" | Remove-AppxPackage
            Get-AppxPackage "Microsoft.Office.OneNote" | Remove-AppxPackage
            Get-AppxPackage "Microsoft.Windows.Photos" | Remove-AppxPackage
            Get-AppxPackage "Microsoft.SkypeApp" | Remove-AppxPackage
            Get-AppxPackage "Microsoft.MicrosoftSolitaireCollection" | Remove-AppxPackage
            Get-AppxPackage *winzip*| Remove-AppxPackage
            Get-AppxPackage *xboxapp* | Remove-AppxPackage
            Get-AppxPackage "Microsoft.ZuneMusic" | Remove-AppxPackage
            Get-AppxPackage "Microsoft.ZuneVideo" | Remove-AppxPackage
        } # Sequence

        # Configure Windows
        Sequence {
            # Apply Start Menu and Quick Launch layout
            New-Item -Path HKCU:\Software\Policies\Microsoft\Windows -Name Explorer
            Set-ItemProperty -Path HKCU:\Software\Policies\Microsoft\Windows\Explorer -Name StartLayoutFile -Value "$env:TEMP\StartLayout.xml"
            Set-ItemProperty -Path HKCU:\Software\Policies\Microsoft\Windows\Explorer -Name LockedStartLayout -Value 1

            # Prevent bloatware apps from returning
            Set-RegistryKey -Path HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent -Key DisableWindowsConsumerFeatures -Value 1

            # Disable UAC
            Set-RegistryKey -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System -Key EnableLUA -Value 0

            # Disable startup delay for Startup applications
            Set-RegistryKey -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize -Key StartupDelayInMSec -Value 0

            # Show taskbar on main display only
            Set-RegistryKey -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Key MMTaskbarEnabled -Value 0

            # Show small taskbar buttons
            Set-RegistryKey -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Key TaskbarSmallIcons -Value 1

            # Remove Search icon from taskbar
            Set-RegistryKey -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Search -Key SearchboxTaskbarMode -Value 0

            # Remove People icon from taskbar
            Set-RegistryKey -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People -Key PeopleBand -Value 0

            # Prevent suggestions in Start Menu
            Set-RegistryKey -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager -Key SystemPaneSuggestionsEnabled -Value 0

            # Disable recently added apps and docs in Start Menu
            #Set-RegistryKey -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Key Start_TrackDocs -Value 0
            #Set-RegistryKey -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Key Start_TrackProgs -Value 0

            # Disable recent files and frequent folders in Quick Access in Windows Explorer
            #Set-RegistryKey -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer -Key ShowRecent -Value 0
            #Set-RegistryKey -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer -Key ShowFrequent -Value 0

            # Display hidden files, folders, drives, protected OS files and file extensions in Windows Explorer
            #Set-RegistryKey -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Key Hidden -Value 1
            #Set-RegistryKey -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Key ShowSuperHidden -Value 1
            #Set-RegistryKey -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Key HideFileExt -Value 0

            # Start on This PC instead of Quick Access in Windows Explorer
            #Set-RegistryKey -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Key LaunchTo -Value 1

            # Display full path in the title bar of Windows Explorer
            #Set-RegistryKey -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState -Key FullPath -Value 1
        } # Sequence

        # Configure WSL
        Sequence {
            # WSL> adduser wicwega
            # WSL> adduser wicwega sudo
            # WSL> apt-get install screenfetch tree lftp mc...
            # CMD> ubuntu config --default-user wicwega

            # Install dotfiles
            Invoke-WebRequest "https://github.com/vronjec/dotfiles/archive/master.zip" -OutFile "$env:TEMP\dotfiles-master.zip"
            Expand-Archive -LiteralPath "$env:TEMP\dotfiles-master.zip" -DestinationPath "$env:TEMP\dotfiles-master"
            Move-Item -Path "$env:TEMP\dotfiles-master\dotfiles-master\.config" -Destination "$env:USERPROFILE"
            Remove-Item -Recurse "$env:TEMP\dotfiles-master"
            Remove-Item "$env:TEMP\dotfiles-master.zip"

            # Install keyfiles
            #Invoke-WebRequest "https://github.com/vronjec/keyfiles/archive/master.zip" -OutFile "$env:TEMP\keyfiles-master.zip"
            #Expand-Archive -LiteralPath "$env:TEMP\keyfiles-master.zip" -DestinationPath "$env:TEMP\keyfiles-master"
            #Move-Item -Path "$env:TEMP\keyfiles-master\keyfiles-master\.ssh" -Destination "$env:USERPROFILE"
            #Remove-Item -Recurse "$env:TEMP\keyfiles-master"
            #Remove-Item "$env:TEMP\keyfiles-master.zip"
        } # Sequence

    } # Parallel

    # Restart computer
    Restart-Computer -Wait

    # Phase 3: Clean up

    # Unlock Start Menu and Quick Launch layout
    Set-ItemProperty -Path 'registry::HKEY_CURRENT_USER\Software\Policies\Microsoft\Windows\Explorer' -Name LockedStartLayout -Value 0

    # Empty Recycle Bin
    Clear-RecycleBin -Force

    # Enable System Restore
    Enable-ComputerRestore -Drive "$env:SystemDrive"

    # Create system restore point
    Checkpoint-Computer -Description "Setup after automation script" -RestorePointType APPLICATION_INSTALL

    # Unregister workflow resume job
    Unregister-ScheduledJob -Name HephaestusSetupResume
}

#$credential = $Host.UI.PromptForCredential("Task username and password",$msg,"$env:userdomain\$env:username",$env:userdomain)

# Create trigger to resume script after restart
Register-ScheduledJob -Name HephaestusSetupResume `
                      -ScheduledJobOption (New-ScheduledJobOption -StartIfOnBattery -ContinueIfGoingOnBattery -RunElevated) `
                      -Trigger (New-JobTrigger -AtLogOn -User "$env:username") `
                      -ScriptBlock { Import-Module PSWorkflow; Get-Job -Name HephaestusSetup | Resume-Job }

# Execute workflow as job
Install-Hephaestus -JobName HephaestusSetup
