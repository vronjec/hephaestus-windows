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
                </start:Group>
                <start:Group Name="Development" xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout">
                    <start:DesktopApplicationTile Row="0" Column="0" Size="2x2" DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\System Tools\Command Prompt.lnk" />
                    <start:DesktopApplicationTile Row="0" Column="2" Size="2x2" DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell.lnk" />
                    <start:DesktopApplicationTile Row="0" Column="4" Size="2x2" DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell ISE.lnk" />
                    <start:DesktopApplicationTile Row="2" Column="0" Size="2x2" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Administrative Tools\Hyper-V Manager.lnk" />
                    <start:DesktopApplicationTile Row="2" Column="2" Size="2x2" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Docker for Windows.lnk" />
                    <start:Tile                   Row="2" Column="4" Size="2x2"             AppUserModelID="CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc!ubuntu" />
                    <start:DesktopApplicationTile Row="4" Column="0" Size="2x2" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Cyberduck\Cyberduck.lnk" />
                    <start:DesktopApplicationTile Row="4" Column="2" Size="2x2" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\Visual Studio Code.lnk" />
                    <start:DesktopApplicationTile Row="4" Column="4" Size="2x2" DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\JetBrains Toolbox\PhpStorm.lnk" />
                </start:Group>
                <start:Group Name="Design" xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout">
                    <start:DesktopApplicationTile Row="0" Column="0" Size="2x2" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Adobe Photoshop CC 2018.lnk" />
                    <start:DesktopApplicationTile Row="0" Column="2" Size="2x2" DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\FileOptimizer\Launch FileOptimizer.lnk" />
                </start:Group>
                <start:Group Name="Entertainment" xmlns:start="http://schemas.microsoft.com/Start/2014/StartLayout">
                    <start:Tile                   Row="0" Column="0" Size="2x2"             AppUserModelID="SpotifyAB.SpotifyMusic_zpdnekdrzrea0!Spotify" />
                    <start:DesktopApplicationTile Row="0" Column="2" Size="2x2" DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Steam\Steam.lnk" />
                </start:Group>
            </defaultlayout:StartLayout>
        </StartLayoutCollection>
    </DefaultLayoutOverride>
    <CustomTaskbarLayoutCollection PinListPlacement="Replace">
        <defaultlayout:TaskbarLayout>
            <taskbar:TaskbarPinList>
                <taskbar:DesktopApp DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Google Chrome.lnk" />
                <taskbar:UWA                    AppUserModelID="91750D7E.Slack_8she8kybcnzg4!Slack" />
                <taskbar:DesktopApp DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Skype\Skype.lnk" />
                <taskbar:UWA                    AppUserModelID="45273LiamForsyth.PawsforTrello_7pb5ddty8z1pa!trello" />
                <taskbar:DesktopApp DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Visual Studio Code\Visual Studio Code.lnk" />
                <taskbar:DesktopApp DesktopApplicationLinkPath="%APPDATA%\Microsoft\Windows\Start Menu\Programs\JetBrains Toolbox\PhpStorm.lnk" />
                <taskbar:DesktopApp DesktopApplicationLinkPath="%ALLUSERSPROFILE%\Microsoft\Windows\Start Menu\Programs\Adobe Photoshop CC 2018.lnk" />
                <taskbar:UWA                    AppUserModelID="CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc!ubuntu" />
            </taskbar:TaskbarPinList>
        </defaultlayout:TaskbarLayout>
    </CustomTaskbarLayoutCollection>
</LayoutModificationTemplate>
"@

# Create default file asscoiations configuration file
Set-Content -Path "$env:TEMP\DefaultAsscoiations.xml" -Value @"
<?xml version="1.0" encoding="UTF-8"?>
<DefaultAssociations>
    <Association Identifier=".arw" ProgId="nomacs.arw.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".bmp" ProgId="nomacs.bmp.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".cr2" ProgId="nomacs.crw.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".crw" ProgId="nomacs.crw.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".dng" ProgId="nomacs.dng.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".epub" ProgId="AppXvepbp3z66accmsd0x877zbbxjctkpr6t" ApplicationName="Microsoft Edge" />
    <Association Identifier=".gif" ProgId="nomacs.gif.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".htm" ProgId="ChromeHTML" ApplicationName="Google Chrome" />
    <Association Identifier=".html" ProgId="ChromeHTML" ApplicationName="Google Chrome" />
    <Association Identifier=".jpe" ProgId="nomacs.jpg.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".jpeg" ProgId="nomacs.jpg.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".jpg" ProgId="nomacs.jpg.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".mrw" ProgId="nomacs.mrw.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".nef" ProgId="nomacs.nef.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".nrw" ProgId="nomacs.nef.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".orf" ProgId="nomacs.orf.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".oxps" ProgId="Windows.XPSReachViewer" ApplicationName="XPS Viewer" />
    <Association Identifier=".pdf" ProgId="AppXd4nrz8ff68srnhf9t5a8sbjyar1cr723" ApplicationName="Microsoft Edge" />
    <Association Identifier=".pef" ProgId="nomacs.pef.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".pgm" ProgId="nomacs.pgm.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".png" ProgId="nomacs.png.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".ppm" ProgId="nomacs.ppm.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".psd" ProgId="Photoshop.Image.19" ApplicationName="Adobe Photoshop CC 2018" />
    <Association Identifier=".raf" ProgId="nomacs.raf.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".raw" ProgId="nomacs.raw.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".rw2" ProgId="nomacs.raw.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".srw" ProgId="nomacs.srw.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".tif" ProgId="nomacs.tif.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".tiff" ProgId="nomacs.tif.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".url" ProgId="ChromeHTML" ApplicationName="Google Chrome" />
    <Association Identifier=".website" ProgId="IE.AssocFile.WEBSITE" ApplicationName="Internet Explorer" />
    <Association Identifier=".xbm" ProgId="nomacs.xbm.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".xpm" ProgId="nomacs.xpm.3" ApplicationName="nomacs - Image Lounge" />
    <Association Identifier=".xps" ProgId="Windows.XPSReachViewer" ApplicationName="XPS Viewer" />
    <Association Identifier="http" ProgId="ChromeHTML" ApplicationName="Google Chrome" />
    <Association Identifier="https" ProgId="ChromeHTML" ApplicationName="Google Chrome" />
    <Association Identifier="mailto" ProgId="ChromeHTML" ApplicationName="Google Chrome" />
</DefaultAssociations>
"@

function Install-DesktopApplication ($Name, $FileType, $ArgumentList, $Uri) {
    $FilePath = "$env:TEMP\${Name}Setup.${FileType}"

    # Enable TLS 1.2
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

    Invoke-WebRequest -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::FireFox -Uri "$Uri" -OutFile "$FilePath"

    Switch ($FileType) {
        "msi" {
            Start-Process -FilePath msiexec -ArgumentList "/i $FilePath $ArgumentList" -Wait
        }

        default {
            Start-Process -FilePath "$FilePath" -ArgumentList "$ArgumentList" -Wait
        }
    }

    Remove-Item "$FilePath"
}

function Remove-WindowsApp ($Name) {
    Get-AppxPackage -Name "$Name" -AllUsers | Remove-AppxPackage -AllUsers
    Get-AppxProvisionedPackage -Online | Where-Object DisplayName -EQ "$Name" | Remove-AppxProvisionedPackage -Online
}

function Remove-DesktopItem ($Item) {
    $OneDrivePath = "${env:USERPROFILE}\OneDrive\Desktop\${Item}"
    $PublicPath = "${env:PUBLIC}\Desktop\${Item}"

    if (Test-Path -Path $OneDrivePath) {
        Remove-Item -Path $OneDrivePath -Force
    }

    if (Test-Path -Path $PublicPath) {
        Remove-Item -Path $PublicPath -Force
    }
}

function Remove-StartupItem ($Item) {
    $StartupShortcutPath = "${env:APPDATA}\Microsoft\Windows\Start Menu\Programs\Startup\${Item}.lnk"
    $CurrentUserRegistryPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
    $LocalMachineRegistryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"

    if (Test-Path -Path "$StartupShortcutPath") {
        Remove-Item -Path "$StartupShortcutPath" -Force
    }

    if (Get-Member -InputObject (Get-ItemProperty -Path "$CurrentUserRegistryPath") -Name ${Item}) {
        Remove-ItemProperty -Path $CurrentUserRegistryPath -Name "$Item" -ErrorAction SilentlyContinue
    }

    if (Get-Member -InputObject (Get-ItemProperty -Path "$LocalMachineRegistryPath") -Name ${Item}) {
        Remove-ItemProperty -Path $LocalMachineRegistryPath -Name "$Item" -ErrorAction SilentlyContinue
    }
}

function Set-RegistryKey ($Path, $Key, $Value) {
    if (-Not (Test-Path -Path "$Path")) {
        New-Item -Path "$Path" -Force | Out-Null
        New-ItemProperty -Path "$Path" -Name $Key -Value $Value -PropertyType DWORD -Force | Out-Null
    } else {
        New-ItemProperty -Path "$Path" -Name $Key -Value $Value -PropertyType DWORD -Force | Out-Null
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

    ##
    # Phase 1
    #

    # Automatic installation
    Parallel {

        # Install desktop applications
        Sequence {
            Install-DesktopApplication -Name "Chrome" -FileType "msi" -ArgumentList "/quiet" -Uri "https://dl.google.com/chrome/install/googlechromestandaloneenterprise64.msi"
            Install-DesktopApplication -Name "Firefox" -FileType "exe" -ArgumentList "-ms" -Uri "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=en-US"
            Install-DesktopApplication -Name "Opera" -FileType "exe" -ArgumentList "/silent /allusers=yes /launchopera=no /desktopshortcut=no /setdefaultbrowser=no /pintotaskbar=no /startmenushortcut=yes" -Uri "https://net.geo.opera.com/opera/stable/windows"
            Install-DesktopApplication -Name "LastPass" -FileType "exe" -ArgumentList "--silinstall --userinstallchrome --userinstallff --userinstallie --noaddremove --nostartmenu --nohistory" -Uri "https://lastpass.com/download/cdn/lastpass_x64.exe"
            Install-DesktopApplication -Name "Skype" -FileType "exe" -ArgumentList "/VERYSILENT /SP- /NOCANCEL /NORESTART /SUPPRESSMSGBOXES /NOLAUNCH" -Uri "https://go.skype.com/classic.skype"
            Install-DesktopApplication -Name "Nomacs" -FileType "msi" -ArgumentList "/passive" -Uri "http://download.nomacs.org/nomacs-setup-x64.msi"

            # TODO: Add version-agnostic download link to latest release
            Install-DesktopApplication -Name "MPC-HC" -FileType "exe" -ArgumentList "/SP- /VERYSILENT /NORESTART" -Uri "https://binaries.mpc-hc.org/MPC%20HomeCinema%20-%20x64/MPC-HC_v1.7.13_x64/MPC-HC.1.7.13.x64.exe"

            Install-DesktopApplication -Name "CreativeCloud" -FileType "exe" -ArgumentList "--mode=silent --action=install" -Uri "http://ccmdls.adobe.com/AdobeProducts/KCCC/1/win32/CreativeCloudSet-Up.exe"
            Install-DesktopApplication -Name "FileOptimizer" -FileType "exe" -ArgumentList "/S" -Uri "https://sourceforge.net/projects/nikkhokkho/files/latest/download?source=files"

            # TODO: Add version-agnostic download link to latest release
            Install-DesktopApplication -Name "PeaZip" -FileType "exe" -ArgumentList "/VERYSILENT" -Uri "http://www.peazip.org/downloads/peazip-6.5.0.WIN64.exe"

            # TODO: Add version-agnostic download link to latest release
            Install-DesktopApplication -Name "Cyberduck" -FileType "exe" -ArgumentList "/quiet" -Uri "https://update.cyberduck.io/windows/Cyberduck-Installer-6.3.5.27408.exe"

            # TODO: Refine installation: https://github.com/msysgit/msysgit/wiki/Silent-or-Unattended-Installation
            # TODO: Add version-agnostic download link to latest release
            Install-DesktopApplication -Name "Git" -FileType "exe" -ArgumentList "/SILENT /COMPONENTS='icons,ext\reg\shellhere,assoc,assoc_sh'" -Uri "https://github.com/git-for-windows/git/releases/download/v2.15.0.windows.1/Git-2.15.0-64-bit.exe"

            Install-DesktopApplication -Name "VSCode" -FileType "exe" -ArgumentList "/verysilent /suppressmsgboxes /mergetasks=!runcode,!desktopicon,quicklaunchicon,addcontextmenufiles,addcontextmenufolders,associatewithfiles,addtopath" -Uri "https://go.microsoft.com/fwlink/?Linkid=852157"

            # TODO: Add version-agnostic download link to latest release
            Install-DesktopApplication -Name "JetBrains" -FileType "exe" -ArgumentList "/S /NoDesktopIcon" -Uri "https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.6.2914.exe"

            # TODO: Java Development Kit
            # TODO: Add version-agnostic download link to latest release
            #Invoke-WebRequest "http://download.oracle.com/otn-pub/java/jdk/9.0.1+11/jdk-9.0.1_windows-x64_bin.exe" -OutFile "$env:TEMP\JDKSetup.exe"
            #Start-Process -FilePath "$env:TEMP\JDKSetup.exe" -ArgumentList "/s STATIC=1 ADDLOCAL=ToolsFeature" -Wait

            # TODO: Android Studio
            # TODO: Visual Studio Emulator for Android (https://aka.ms/vscomemudownload)

            Install-DesktopApplication -Name "Docker" -FileType "exe" -ArgumentList "install --quiet" -Uri "https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe"
            Install-DesktopApplication -Name "Steam" -FileType "exe" -ArgumentList "/S" -Uri "https://steamcdn-a.akamaihd.net/client/installer/SteamSetup.exe"
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
            Enable-WindowsOptionalFeature -FeatureName Microsoft-Hyper-V -Online -All -NoRestart -WarningAction SilentlyContinue
            Enable-WindowsOptionalFeature -FeatureName Containers -Online -All -NoRestart -WarningAction SilentlyContinue
            Enable-WindowsOptionalFeature -FeatureName Microsoft-Windows-Subsystem-Linux -Online -All -NoRestart -WarningAction SilentlyContinue
        } # Sequence

    } # Parallel

    # Restart computer
    Restart-Computer -Wait

    ##
    # Phase 2
    #

    # Automatic configuration
    Parallel {

        # Set computer name and configure hardware-specific settings
        Switch -CaseSensitive ((Get-WmiObject -Class Win32_BIOS).SerialNumber) {
            "MP0ARBG" {
                # Set service startup type to fix Bluetooth issues
                #Set-Service –Name "bthhfsrv" –StartupType "Automatic"
                #Set-Service –Name "bthserv" –StartupType "Automatic"
            }

            default {
                Rename-Computer -NewName "hephaestus" -Force -WarningAction SilentlyContinue -ErrorAction SilentlyContinue
            }
        }

        # Configure Windows
        Sequence {
            # Apply Start Menu and Quick Launch layout
            New-Item -Path HKCU:\Software\Policies\Microsoft\Windows -Name Explorer
            Set-ItemProperty -Path HKCU:\Software\Policies\Microsoft\Windows\Explorer -Name StartLayoutFile -Value "$env:TEMP\StartLayout.xml"
            Set-ItemProperty -Path HKCU:\Software\Policies\Microsoft\Windows\Explorer -Name LockedStartLayout -Value 1

            # Apply default file asscoiations configuration file
            New-Item -Path HKCU:\Software\Policies\Microsoft\Windows -Name System
            Set-ItemProperty -Path HKCU:\Software\Policies\Microsoft\Windows\Explorer -Name DefaultAssociationsConfiguration -Value "$env:TEMP\DefaultAsscoiations.xml"

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

            # Disable startup delay for Startup applications
            Set-RegistryKey -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize -Key StartupDelayInMSec -Value 0

            # Disable UAC
            Set-RegistryKey -Path HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System -Key EnableLUA -Value 0

            # Prevent bloatware apps from returning
            Set-RegistryKey -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Cloud Content" -Key DisableWindowsConsumerFeatures -Value 1
        } # Sequence

        # Configure VPN
        Sequence {
            Add-VpnConnection -Name "Le VPN (Hungary)" -ServerAddress "hu.le-vpn.com" -TunnelType L2tp -L2tpPsk "levpnsecret" -AuthenticationMethod MSChapv2 -RememberCredential -EncryptionLevel Required -Force
            Add-VpnConnection -Name "Le VPN (Serbia)" -ServerAddress "rs.le-vpn.com" -TunnelType L2tp -L2tpPsk "levpnsecret" -AuthenticationMethod MSChapv2 -RememberCredential -EncryptionLevel Required -Force
            Add-VpnConnection -Name "Le VPN (United Kingdom)" -ServerAddress "uk.le-vpn.com" -TunnelType L2tp -L2tpPsk "levpnsecret" -AuthenticationMethod MSChapv2 -RememberCredential -EncryptionLevel Required -Force
            Add-VpnConnection -Name "Le VPN (United States)" -ServerAddress "us.le-vpn.com" -TunnelType L2tp -L2tpPsk "levpnsecret" -AuthenticationMethod MSChapv2 -RememberCredential -EncryptionLevel Required -Force
        }

        # Remove desktop icons and startup applications
        Sequence {
            Remove-DesktopItem -Item "Google Chrome.lnk"
            Remove-DesktopItem -Item "Firefox.lnk"
            Remove-DesktopItem -Item "Skype.lnk"
            Remove-DesktopItem -Item "MPC-HC x64.lnk"
            Remove-DesktopItem -Item "PeaZip.lnk"
            Remove-DesktopItem -Item "Adobe Creative Cloud.lnk"
            Remove-DesktopItem -Item "FileOptimizer.lnk"
            Remove-DesktopItem -Item "Le VPN.lnk"
            Remove-DesktopItem -Item "Docker for Windows.lnk"
            Remove-DesktopItem -Item "Spotify.lnk"
            Remove-DesktopItem -Item "Steam.lnk"
            Remove-DesktopItem -Item "desktop.ini"

            Remove-StartupItem -Item "Send to OneNote"
            Remove-StartupItem -Item "Skype"
            Remove-StartupItem -Item "Spotify Web Helper"

            # Disable Intel HD Graphics tray icon
            Remove-StartupItem -Item "IgfxTray"
            Remove-StartupItem -Item "HotKeysCmds"
            Remove-StartupItem -Item "Persistence"
        } # Sequence

        # Remove Microsoft Store apps
        Sequence {
            Remove-WindowsApp -Name "89006A2E.AutodeskSketchBook"
            Remove-WindowsApp -Name "A278AB0D.DisneyMagicKingdoms"
            Remove-WindowsApp -Name "king.com.CandyCrushSaga"
            Remove-WindowsApp -Name "king.com.CandyCrushSodaSaga"
            Remove-WindowsApp -Name "A278AB0D.MarchofEmpires"
            Remove-WindowsApp -Name "Microsoft.BingFinance"
            Remove-WindowsApp -Name "Microsoft.BingNews"
            Remove-WindowsApp -Name "Microsoft.BingSports"
            Remove-WindowsApp -Name "Microsoft.BingWeather"
            Remove-WindowsApp -Name "Microsoft.MicrosoftOfficeHub"
            Remove-WindowsApp -Name "Microsoft.MicrosoftSolitaireCollection"
            Remove-WindowsApp -Name "Microsoft.Office.OneNote"
            Remove-WindowsApp -Name "Microsoft.XboxApp"
            Remove-WindowsApp -Name "Microsoft.ZuneMusic"
            Remove-WindowsApp -Name "Microsoft.ZuneVideo"
            Remove-WindowsApp -Name "WinZipComputing.WinZipUniversal"
        } # Sequence

    } # Parallel

    # Manual installation
    Parallel {

        # Enlist Microsoft Store apps to install
        Sequence {
            $SlackLink = "microsoft.com/store/apps/9wzdncrdk3wp"
            $SpotifyLink = "microsoft.com/store/apps/9ncbcszsjrsb"
            $TrelloLink = "microsoft.com/store/apps/9nblggh4xxvw"
            $UbuntuLink = "microsoft.com/store/apps/9nblggh4msv6"

            # Open enlisted apps as browser tabs
            Start-Process -FilePath chrome.exe -ArgumentList "$SlackLink $SpotifyLink $TrelloLink $UbuntuLink" -Wait
        } # Sequence

        # Open launchers to install applications
        Sequence {
            # Open Adobe Creative Cloud
            Start-Process "${env:ProgramFiles(x86)}\Adobe\Adobe Creative Cloud\ACC\Creative Cloud.exe"

            # Open JetBrains Toolbox
            Start-Process -FilePath "$env:LOCALAPPDATA\JetBrains\Toolbox\bin\jetbrains-toolbox.exe"
        } # Sequence

    } # Parallel

    # Suspend workflow until next logon
    Suspend-Workflow

    ##
    # Phase 3
    #

    # Automatic customization
    Parallel {

        # Configure WSL
        Sequence {
            # WSL> sudo apt-get update && sudo apt-get upgrade -y
            # WSL> sudo apt-get install lftp mc screenfetch tree

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

        # Configure Docker
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

    } # Parallel

    # Clean up

    # Unlock Start Menu and Quick Launch layout
    Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Name LockedStartLayout -Value 0

    # Unlock default file associations
    Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Name DefaultAssociationsConfiguration -Value 0

    # Empty Recycle Bin
    Clear-RecycleBin -Force

    # Enable System Restore
    Enable-ComputerRestore -Drive "$env:SystemDrive"

    # Create system restore point
    Checkpoint-Computer -Description "Setup after Hephaestus automation script" -RestorePointType APPLICATION_INSTALL

    # Unregister workflow resume task
    Unregister-ScheduledTask -TaskName ResumeHephaestusSetup -Confirm:$false
}

# Create task to resume workflow after restart
Register-ScheduledTask -TaskName ResumeHephaestusSetup `
                       -Action (New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-WindowStyle Normal -NoLogo -NoProfile -NoExit -Command &{ Import-Module PSWorkflow; Get-Job -Name HephaestusSetup | Resume-Job -Wait | Wait-Job }") `
                       -RunLevel Highest `
                       -Trigger (New-ScheduledTaskTrigger -AtLogOn)

# Execute workflow as job
Install-Hephaestus -JobName HephaestusSetup
