Import-Module PSWorkflow

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
            $Path = $env:TEMP

            # Install latest Chrome
            # TODO: Remove desktop icon
            $Installer = "ChromeSetup.msi"
            Invoke-WebRequest "https://dl.google.com/chrome/install/googlechromestandaloneenterprise64.msi" -OutFile "$Path\$Installer"
            Start-Process -FilePath msiexec -ArgumentList "/i $Path\$Installer /quiet" -Wait

            # Install latest Firefox
            # TODO: Remove desktop icon
            $Installer = "FirefoxSetup.exe"
            Invoke-WebRequest "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US" -OutFile "$Path\$Installer"
            Start-Process -FilePath "$Path\$Installer" -ArgumentList "-ms" -Wait

            # Install latest Opera
            # TODO: Remove desktop icon
            $Installer = "OperaSetup.exe"
            Invoke-WebRequest "https://net.geo.opera.com/opera/stable/windows" -OutFile "$Path\$Installer"
            Start-Process -FilePath "$Path\$Installer" -ArgumentList "/silent /launchopera 0" -Wait

            # Install latest LastPass browser extensions
            $Installer = "LastPassSetup.exe"
            Invoke-WebRequest "https://lastpass.com/download/cdn/lastpass_x64.exe" -OutFile "$Path\$Installer"
            Start-Process -FilePath "$Path\$Installer" -ArgumentList "--silinstall --userinstallff --userinstallie --noaddremove --nostartmenu --nohistory" -Wait

            # Install latest Slack
            $Installer = "SlackSetup.exe"
            Invoke-WebRequest "https://slack.com/ssb/download-win64" -OutFile "$Path\$Installer"
            Start-Process -FilePath "$Path\$Installer" -ArgumentList "-s" -Wait

            # Install latest Steam
            $Installer = "SteamSetup.exe"
            Invoke-WebRequest "https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe" -OutFile "$Path\$Installer"
            Start-Process -FilePath "$Path\$Installer" -ArgumentList "/S" -Wait

            # TODO: Spotify
            # TODO: nomacs
            # TODO: MPC-HC
            # TODO: Microsoft Office
            # TODO: Adobe Creative Cloud
            # TODO: File Optimizer
            # TODO: FileZilla Client
            # TODO: Git

            # Install Visual Studio Code
            # TODO: Add version-agnostic download link to latest release
            $Installer = "VSCodeSetup.exe"
            Invoke-WebRequest "https://go.microsoft.com/fwlink/?Linkid=852157" -OutFile "$Path\$Installer"
            Start-Process -FilePath "$Path\$Installer" -ArgumentList "/VERYSILENT /MERGETASKS=!runcode" -Wait

            # Install JetBrains Toolbox
            # TODO: Add version-agnostic download link to latest release
            $Installer = "JetBrainsSetup.exe"
            Invoke-WebRequest "https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.6.2914.exe" -OutFile "$Path\$Installer"
            Start-Process -FilePath "$Path\$Installer" -ArgumentList "/S /NoDesktopIcon" -Wait

            # Install latest Docker CE for Windows
            $Installer = "DockerSetup.exe"
            Invoke-WebRequest "https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe" -OutFile "$Path\$Installer"
            Start-Process -FilePath "$Path\$Installer" -ArgumentList "install --quiet" -Wait

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
