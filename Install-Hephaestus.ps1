Import-Module PSWorkflow

function Install-WebRequest ($Installer, $ArgumentList, $Uri) {
    $FilePath = "$env:TEMP\$Installer"

    # Enable TLS 1.2
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    Invoke-WebRequest "$Uri" -OutFile "$FilePath"

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

function Remove-DesktopShortcut ($ShortcutLabel) {
    $FilePath = "${env:USERPROFILE}\Desktop\${ShortcutLabel}.lnk"

    Remove-Item "$FilePath"
}

function Set-RegistryKeyValue ($RegistryPath, $Key, $Value) {
    if (!(Test-Path $RegistryPath)) {
        New-Item -Path $RegistryPath -Force | Out-Null
        New-ItemProperty -Path $RegistryPath -Name $Key -Value $Value -PropertyType DWORD -Force | Out-Null
    } else {
        New-ItemProperty -Path $RegistryPath -Name $Key -Value $Value -PropertyType DWORD -Force | Out-Null
    }
}

Workflow Install-Hephaestus
{
    # Disable System Restore
    Disable-ComputerRestore -Drive "C:\"

    Parallel {

        Sequence {
            # Set computer name
            Switch -CaseSensitive ((Get-WmiObject -Class Win32_BIOS).SerialNumber) {
                "MP0ARBG" { Rename-Computer -NewName "hephaestus" -Force -WarningAction SilentlyContinue -ErrorAction SilentlyContinue }
            }

            # Enable Hyper-V
            Enable-WindowsOptionalFeature -FeatureName Microsoft-Hyper-V -Online -All -NoRestart

            # Enabling Containers
            Enable-WindowsOptionalFeature -FeatureName Containers -Online -All -NoRestart

            # Enable Windows Subsystem for Linux
            Enable-WindowsOptionalFeature -FeatureName Microsoft-Windows-Subsystem-Linux -Online -All -NoRestart

            # TODO: Configure WSL after reboot
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

            # Show taskbar on main display only
            Set-RegistryKeyValue -RegistryPath HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Key MMTaskbarEnabled -Value 0

            # Show small taskbar buttons
            Set-RegistryKeyValue -RegistryPath HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Key TaskbarSmallIcons -Value 1

            # Remove Search icon from taskbar
            Set-RegistryKeyValue -RegistryPath HKCU:\Software\Microsoft\Windows\CurrentVersion\Search -Key SearchboxTaskbarMode -Value 0

            # Remove Get Office app
            Get-AppxPackage *officehub* | Remove-AppxPackage

            # Remove OneNote app
            Get-AppxPackage *onenote* | Remove-AppxPackage

            # Remove Skype app
            Get-AppxPackage *skypeapp* | Remove-AppxPackage

            # Remove Movies and TV app
            Get-AppxPackage *zunevideo* | Remove-AppxPackage

            # Remove Photos app
            Get-AppxPackage *photos* | Remove-AppxPackage

            # Remove News app
            Get-AppxPackage *bingnews* | Remove-AppxPackage

            # Remove Weather app
            Get-AppxPackage *bingweather* | Remove-AppxPackage

            # Remove Xbox app
            Get-AppxPackage *xboxapp* | Remove-AppxPackage
        } # Sequence

        Sequence {
            # Install latest Chrome
            Install-WebRequest -Installer "ChromeSetup.msi" -ArgumentList "/quiet" -Uri "https://dl.google.com/chrome/install/googlechromestandaloneenterprise64.msi"
            Remove-DesktopShortcut -ShortcutLabel "Google Chrome"
 
            # Install latest Firefox
            # TODO: Remove desktop icon
            Install-WebRequest -Installer "FirefoxSetup.exe" -ArgumentList "-ms" -Uri "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US"
            Remove-DesktopShortcut -ShortcutLabel "Mozilla Firefox"
 
            # Install latest Opera
            # TODO: Remove desktop icon
            Install-WebRequest -Installer "OperaSetup.exe" -ArgumentList "/silent /launchopera 0" -Uri "https://net.geo.opera.com/opera/stable/windows"
            Remove-DesktopShortcut -ShortcutLabel "Opera Browser"
 
            # Install latest LastPass browser extensions
            Install-WebRequest -Installer "LastPassSetup.exe" -ArgumentList "--silinstall --userinstallchrome --userinstallff --userinstallie --noaddremove --nostartmenu --nohistory" -Uri "https://lastpass.com/download/cdn/lastpass_x64.exe"

            # Install latest Skype Classic
            Install-WebRequest -Installer "SkypeSetup.exe" -ArgumentList "/VERYSILENT /SP- /NOCANCEL /NORESTART /SUPPRESSMSGBOXES /NOLAUNCH" -Uri "https://go.skype.com/classic.skype"
            Remove-DesktopShortcut -ShortcutLabel "Skype"
 
            # Install latest Spotify
            Install-WebRequest -Installer "SpotifySetup.exe" -ArgumentList "/Silent" -Uri "http://download.spotify.com/SpotifyFullSetup.exe"
            Remove-DesktopShortcut -ShortcutLabel "Spotify"
 
            # Install latest Steam
            Install-WebRequest -Installer "SteamSetup.exe" -ArgumentList "/S" -Uri "https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe"
            Remove-DesktopShortcut -ShortcutLabel "Steam"
 
            # Install latest Nomacs
            Install-WebRequest -Installer "NomacsSetup.msi" -ArgumentList "/passive" -Uri "http://download.nomacs.org/nomacs-setup-x64.msi"

            # Install MPC-HC
            # TODO: Add version-agnostic download link to latest release
            Install-WebRequest -Installer "MPCHCSetup.exe" -ArgumentList "/SP- /VERYSILENT /NORESTART" -Uri "https://binaries.mpc-hc.org/MPC%20HomeCinema%20-%20x64/MPC-HC_v1.7.13_x64/MPC-HC.1.7.13.x64.exe"
            Remove-DesktopShortcut -ShortcutLabel "MPC-HC x64"

            # Install PeaZip
            # TODO: Add version-agnostic download link to latest release
            Install-WebRequest -Installer "PeaZipSetup.exe" -ArgumentList "/VERYSILENT" -Uri "http://www.peazip.org/downloads/peazip-6.5.0.WIN64.exe"
            Remove-DesktopShortcut -ShortcutLabel "PeaZip"

            # TODO: Microsoft Office 365 Personal
            #Invoke-WebRequest "https://officecdn.microsoft.com/db/492350f6-3a01-4f97-b9c0-c7c6ddf67d60/media/en-US/O365HomePremRetail.img" -OutFile "$env:TEMP\OfficeSetup.img"
            #$Image = Mount-DiskImage -ImagePath "$env:TEMP\OfficeSetup.img" -NoDriveLetter -PassThru
            #$Drive = Get-WmiObject win32_volume -Filter "Label = '$((Get-Volume -DiskImage $Image).FileSystemLabel)'" -ErrorAction Stop
            #$Drive.AddMountPoint("$env:TEMP\OfficeSetup")
            #TODO install
            #Dismount-DiskImage -ImagePath "$env:TEMP\OfficeSetup.img"

            # Install Adobe Creative Cloud
            Install-WebRequest -Installer "CreativeCloudSetup.exe" -ArgumentList "--mode=silent --action=install" -Uri "http://ccmdls.adobe.com/AdobeProducts/KCCC/1/win32/CreativeCloudSet-Up.exe"

            # TODO: File Optimizer
            # TODO: FileZilla Client

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

    } # Parallel

    # Enable System Restore
    Enable-ComputerRestore -Drive "C:\"

    # Create system restore point
    Checkpoint-Computer -Description "Initial system"
}

# Execute workflow as job
Install-Hephaestus -AsJob
