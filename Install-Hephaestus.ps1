Import-Module PSWorkflow

function Install-WebRequest ($Installer, $ArgumentList, $Uri) {
    $FilePath = "$env:TEMP\$Installer"

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

            # Enable Windows Subsystem for Linux
            Enable-WindowsOptionalFeature -FeatureName Microsoft-Windows-Subsystem-Linux -Online -All -NoRestart

            # TODO: Configure WSL after reboot
            # WSL> adduser wicwega
            # WSL> adduser wicwega sudo
            # WSL> apt-get install mc ...
            # CMD> ubuntu config --default-user wicwega
        } # Sequence

        Sequence {
            # Install latest Chrome
            Install-WebRequest -Installer "ChromeSetup.msi" -ArgumentList "/quiet" -Uri "https://dl.google.com/chrome/install/googlechromestandaloneenterprise64.msi"
            Remove-DesktopShortcut -ShortcutLabel "Google Chrome"

            # Install latest Firefox
            # TODO: Remove desktop icon
            Install-WebRequest -Installer "FirefoxSetup.exe" -ArgumentList "-ms" -Uri "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US"

            # Install latest Opera
            # TODO: Remove desktop icon
            Install-WebRequest -Installer "OperaSetup.exe" -ArgumentList "/silent /launchopera 0" -Uri "https://net.geo.opera.com/opera/stable/windows"

            # Install latest LastPass browser extensions
            Install-WebRequest -Installer "LastPassSetup.exe" -ArgumentList "--silinstall --userinstallff --userinstallie --noaddremove --nostartmenu --nohistory" -Uri "https://lastpass.com/download/cdn/lastpass_x64.exe"

            # Install latest Slack
            Install-WebRequest -Installer "SlackSetup.exe" -ArgumentList "-s" -Uri "https://slack.com/ssb/download-win64"
            Remove-DesktopShortcut -ShortcutLabel "Slack"

            # Install latest Skype Classic
            Install-WebRequest -Installer "SkypeSetup.exe" -ArgumentList "/VERYSILENT /SP- /NOCANCEL /NORESTART /SUPPRESSMSGBOXES /NOLAUNCH" -Uri "https://go.skype.com/classic.skype"
            Remove-DesktopShortcut -ShortcutLabel "Skype"

            # Install latest Steam
            Install-WebRequest -Installer "SteamSetup.exe" -ArgumentList "/S" -Uri "https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe"
            Remove-DesktopShortcut -ShortcutLabel "Steam"

            # TODO: Spotify

            # Install latest Nomacs
            Install-WebRequest -Installer "NomacsSetup.msi" -ArgumentList "/passive" -Uri "http://download.nomacs.org/nomacs-setup-x64.msi"

            # Install MPC-HC
            # TODO: Add version-agnostic download link to latest release
            Install-WebRequest -Installer "MPCHCSetup.exe" -ArgumentList "/SP- /VERYSILENT /NORESTART" -Uri "https://binaries.mpc-hc.org/MPC%20HomeCinema%20-%20x64/MPC-HC_v1.7.13_x64/MPC-HC.1.7.13.x64.exe"
            Remove-DesktopShortcut -ShortcutLabel "MPC-HC x64"

            # TODO: Microsoft Office

            # Install Adobe Creative Cloud desktop application
            # TODO: Add version-agnostic download link to latest release
            # Invoke-WebRequest "http://ccmdl.adobe.com/AdobeProducts/KCCC/1/win32/ACCCx4_3_0_256.zip" -OutFile "$env:TEMP\CreativeCloud.zip"
            # TODO: Implement function to unzip archive to given path
            # Extract-Archive -Archive "$env:TEMP\CreativeCloud.zip" -OutDirectory "$env:TEMP"
            # TODO: Implement function to initiate installer at given path
            # Invoke-Installer -Installer "$env:TEMP\ACCCx4_3_0_256\Set-up.exe" -ArgumentList "--silent"

            # TODO: File Optimizer
            # TODO: FileZilla Client

            # Install Git
            # TODO: Refine installation: https://github.com/msysgit/msysgit/wiki/Silent-or-Unattended-Installation
            # TODO: Add version-agnostic download link to latest release
            Install-WebRequest -Installer "GitSetup.exe" -ArgumentList "/SILENT /COMPONENTS='icons,ext\reg\shellhere,assoc,assoc_sh'" -Uri "https://github.com/git-for-windows/git/releases/download/v2.15.0.windows.1/Git-2.15.0-64-bit.exe"

            # Install Visual Studio Code
            # TODO: Add version-agnostic download link to latest release
            Install-WebRequest -Installer "VSCodeSetup.exe" -ArgumentList "/VERYSILENT /MERGETASKS=!runcode" -Uri "https://go.microsoft.com/fwlink/?Linkid=852157"

            # Install JetBrains Toolbox
            # TODO: Add version-agnostic download link to latest release
            Install-WebRequest -Installer "JetBrainsSetup.exe" -ArgumentList "/S /NoDesktopIcon" -Uri "https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.6.2914.exe"

            # Install latest Docker CE for Windows
            Install-WebRequest -Installer "DockerSetup.exe" -ArgumentList "install --quiet" -Uri "https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe"

            #TODO: Devilbox
        } # Sequence

    } # Parallel

    # Enable System Restore
    Enable-ComputerRestore -Drive "C:\"

    # Create system restore point
    Checkpoint-Computer -Description "Initial system"
}

# Execute workflow as job
Install-Hephaestus -AsJob
