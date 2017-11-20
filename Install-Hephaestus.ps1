Import-Module PSWorkflow

Workflow Install-Hephaestus
{
    # Disable System Restore
    Disable-ComputerRestore -Drive "C:\"

    Parallel {

        Sequence {
            # Set computer name
            Switch -CaseSensitive ((Get-WmiObject -Class Win32_BIOS).SerialNumber) {
                "MP0ARBG" { Rename-Computer -NewName "Hephaestus" -Force -WarningAction SilentlyContinue -ErrorAction SilentlyContinue }
            }

            # Enable Hyper-V
            Enable-WindowsOptionalFeature -FeatureName Microsoft-Hyper-V -Online -All -NoRestart 

            # Enable Windows Subsystem for Linux
            Enable-WindowsOptionalFeature -FeatureName Microsoft-Windows-Subsystem-Linux -Online -All -NoRestart 
        } # Sequence

        Sequence {
            # Install latest Chrome
            Invoke-WebRequest "https://dl.google.com/chrome/install/375.126/chrome_installer.exe" -OutFile "$env:temp\ChromeSetup.exe"
            Start-Process -FilePath "$env:temp\ChromeSetup.exe" -ArgumentList "/install /silent" -Wait

            # Install latest Firefox
            Invoke-WebRequest "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US" -OutFile "$env:temp\FirefoxSetup.exe"
            Start-Process -FilePath "$env:temp\FirefoxSetup.exe" -ArgumentList "-ms" -Wait

            # Install latest Opera
            Invoke-WebRequest "https://net.geo.opera.com/opera/stable/windows" -OutFile "$env:temp\OperaSetup.exe"
            Start-Process -FilePath "$env:temp\OperaSetup.exe" -ArgumentList "/silent /launchopera 0" -Wait

            # Install latest LastPass browser extensions
            Invoke-WebRequest "https://lastpass.com/download/cdn/lastpass_x64.exe" -OutFile "$env:temp\LastPassSetup.exe"
            Start-Process -FilePath "$env:temp\LastPassSetup.exe" -ArgumentList "--silinstall --userinstallff --userinstallie --noaddremove --nostartmenu --nohistory" -Wait

            # TODO: Microsoft Office
            # TODO: Adobe Creative Cloud
            # TODO: File Optimizer
            # TODO: FileZilla Client

            # Install Visual Studio Code
            # TODO: Add version-agnostic download link to latest release
            Invoke-WebRequest "https://go.microsoft.com/fwlink/?Linkid=852157" -OutFile "$env:temp\VSCodeSetup.exe"
            Start-Process -FilePath "$env:temp\VSCodeSetup.exe" -ArgumentList "/VERYSILENT /MERGETASKS=!runcode" -Wait

            # Install JetBrains Toolbox
            # TODO: Add version-agnostic download link to latest release
            Invoke-WebRequest "https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.6.2914.exe" -OutFile "$env:temp\JetBrainsSetup.exe"
            Start-Process -FilePath "$env:temp\JetBrainsSetup.exe" -ArgumentList "/S /NoDesktopIcon" -Wait

            # Install Docker CE for Windows
            Invoke-WebRequest "https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe" -OutFile "$env:temp\DockerSetup.exe"
            Start-Process -FilePath "$env:temp\DockerSetup.exe" -ArgumentList "install --quiet" -Wait

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
