Import-Module PSWorkflow

function Install-WebRequest ($Installer, $ArgumentList, $Uri) {
    $Path = $env:TEMP

    Invoke-WebRequest "$Uri" -OutFile "$Path\$Installer"
    Start-Process -FilePath "$Path\$Installer" -ArgumentList "$ArgumentList" -Wait
    Remove-Item "$Path\$Installer"
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
        } # Sequence

        Sequence {
            # Install latest Chrome
            # TODO: Remove desktop icon
            $Installer = "ChromeSetup.msi"
            Invoke-WebRequest "https://dl.google.com/chrome/install/googlechromestandaloneenterprise64.msi" -OutFile "$Path\$Installer"
            Start-Process -FilePath msiexec -ArgumentList "/i $Path\$Installer /quiet" -Wait
            Remove-Item "$Path\$Installer"

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

            # Install latest Steam
            Install-WebRequest -Installer "SteamSetup.exe" -ArgumentList "/S" -Uri "https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe"

            # TODO: Spotify
            # TODO: nomacs

            # Install MPC-HC
            # TODO: Add version-agnostic download link to latest release
            Install-WebRequest -Installer "MPCHCSetup.exe" -ArgumentList "/SP- /VERYSILENT /NORESTART" -Uri "https://binaries.mpc-hc.org/MPC%20HomeCinema%20-%20x64/MPC-HC_v1.7.13_x64/MPC-HC.1.7.13.x64.exe"

            # TODO: Microsoft Office
            # TODO: Adobe Creative Cloud
            # TODO: File Optimizer
            # TODO: FileZilla Client
            # TODO: Git

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
