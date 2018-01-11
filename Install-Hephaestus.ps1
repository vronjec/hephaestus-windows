Import-Module PSWorkflow

Add-Type -AssemblyName System.Windows.Forms

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

Workflow Install-Hephaestus
{
    $Global:balloon = New-Object System.Windows.Forms.NotifyIcon
    #Get-Member -InputObject  $Global:balloon

    $path = (Get-Process -id $pid).Path
    $balloon.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
    $balloon.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Info
    $balloon.BalloonTipTitle = "Hephaestus"
    # [System.Windows.Forms.ToolTipIcon] | Get-Member -Static -Type Property
    $balloon.BalloonTipText = 'What do you think of this balloon tip?'
    $balloon.Visible = $true
    $balloon.ShowBalloonTip(5000)

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
        } # Sequence

        Sequence {
            # Install latest Chrome
            Install-WebRequest -Installer "ChromeSetup.msi" -ArgumentList "/quiet" -Uri "https://dl.google.com/chrome/install/googlechromestandaloneenterprise64.msi"
            Remove-DesktopShortcut -ShortcutLabel "Google Chrome"
            $balloon.BalloonTipText = "Google Chrome installation complete"
            $balloon.ShowBalloonTip(5000)

            # Install latest Firefox
            # TODO: Remove desktop icon
            Install-WebRequest -Installer "FirefoxSetup.exe" -ArgumentList "-ms" -Uri "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US"
            $balloon.BalloonTipText = "Mozilla Firefox installation complete"
            $balloon.ShowBalloonTip(5000)

            # Install latest Opera
            # TODO: Remove desktop icon
            Install-WebRequest -Installer "OperaSetup.exe" -ArgumentList "/silent /launchopera 0" -Uri "https://net.geo.opera.com/opera/stable/windows"
            $balloon.BalloonTipText = "Opera installation complete"
            $balloon.ShowBalloonTip(5000)

            # Install latest LastPass browser extensions
            Install-WebRequest -Installer "LastPassSetup.exe" -ArgumentList "--silinstall --userinstallff --userinstallie --noaddremove --nostartmenu --nohistory" -Uri "https://lastpass.com/download/cdn/lastpass_x64.exe"

            # Install latest Skype Classic
            Install-WebRequest -Installer "SkypeSetup.exe" -ArgumentList "/VERYSILENT /SP- /NOCANCEL /NORESTART /SUPPRESSMSGBOXES /NOLAUNCH" -Uri "https://go.skype.com/classic.skype"
            Remove-DesktopShortcut -ShortcutLabel "Skype"
            $balloon.BalloonTipText = "Skype Classic installation complete"
            $balloon.ShowBalloonTip(5000)

            # Install latest Spotify
            Install-WebRequest -Installer "SpotifySetup.exe" -ArgumentList "/Silent" -Uri "https://download.scdn.co/SpotifySetup.exe"
            Remove-DesktopShortcut -ShortcutLabel "Spotify"
            $balloon.BalloonTipText = "Spotify installation complete"
            $balloon.ShowBalloonTip(5000)

            # Install latest Steam
            Install-WebRequest -Installer "SteamSetup.exe" -ArgumentList "/S" -Uri "https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe"
            Remove-DesktopShortcut -ShortcutLabel "Steam"
            $balloon.BalloonTipText = "Stream installation complete"
            $balloon.ShowBalloonTip(5000)

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
            #https://officecdn.microsoft.com/db/492350F6-3A01-4F97-B9C0-C7C6DDF67D60/media/en-US/O365HomePremRetail.img

            # Install Adobe Creative Cloud
            # TODO: refactor
            Invoke-WebRequest "http://ccmdl.adobe.com/AdobeProducts/KCCC/1/win32/ACCCx4_3_0_256.zip" -OutFile "$env:TEMP\CreativeCloudSetup.zip"
            Expand-Archive "$env:TEMP\CreativeCloudSetup.zip" "$env:TEMP\CreativeCloudSetup"
            Start-Process -FilePath "$env:TEMP\CreativeCloudSetup\Set-up.exe" -ArgumentList "--silent" -Wait

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
            Invoke-WebRequest "http://download.oracle.com/otn-pub/java/jdk/9.0.1+11/jdk-9.0.1_windows-x64_bin.exe" -OutFile "$env:TEMP\JDKSetup.exe"
            Start-Process -FilePath "$env:TEMP\JDKSetup.exe" -ArgumentList "/s STATIC=1 ADDLOCAL=ToolsFeature" -Wait

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
