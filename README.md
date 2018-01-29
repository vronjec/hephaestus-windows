# Hephaestus: The Windows development machine

## Introduction

An automation script for installing and configuring a Windows 10-based
development machine.

## Features

*   **Phase 1: Automatic installation**
    *   Installs browsers and messaging applications
        *   Google Chrome with LastPass browser extension
        *   Mozilla Firefox
        *   Opera
        *   Skype Classic
    *   Installs office applications and utilities
        *   Microsoft Office 365 Personal
        *   PeaZip archiver utility
    *   Installs graphic design applications and utilities
        *   Adobe Creative Cloud application launcher
        *   FileOptimizer file optimizer
    *   Installs software development applications and utilities
        *   Cyberduck FTP and cloud storage client
        *   Git version control software
        *   Visual Studio Code source code editor
        *   JetBrains Toolbox application launcher
        *   Docker CE for Windows virtualization software
    *   Installs multimedia and entertainment applications
        *   Nomacs image viewer
        *   MPC-HC media player
        *   Steam application launcher
    *   Enables optional Windows features
        *   Hyper-V 
        *   Containers
        *   Windows Subsystem for Linux (WSL)
*   **Phase 2: Automatic configuration and manual installation** (after
    automatic restart)
    *   Removes unused desktop icons, startup applications and Windows
        Store apps
    *   Applies Start Menu and Quick Launch layout (requires restart to
        take effect)
    *   Configures Windows Explorer, Start Menu and taskbar
    *   Configures VPN connections
    *   Opens Google Chrome tabs with Microsoft Store apps to install
        *   Slack
        *   Spotify
        *   Trello
        *   Ubuntu
    *   Opens Adobe Creative Cloud application launcher
    *   Opens JetBrains Toolbox application launcher
*   **Phase 3: Automatic configuration and clean up** (after manual
    restart)
    *   Unlocks Start Menu and Quick Launch layout (requires restart to
        take effect)
    *   Empties Recycle Bin
    *   Creates system restore point
        
## Requirements

*   Hardware support for Hyper-V virtualization
*   Internet connection

## Recommendations

*   Perform a clean installation of Windows 10 Pro Insider Preview 17025
    or newer (for features to access published container ports using
    localhost or 127.0.0.1)
*   Link Microsoft account during installation to access otherwise
    unavailable Insider Preview features

## Installation

Run PowerShell as Administrator:

```powershell
. { Invoke-WebRequest -useb https://raw.githubusercontent.com/vronjec/hephaestus-windows/master/Install-Hephaestus.ps1 } | Invoke-Expression
```

## Etymology

Hephaestus is the Greek god of blacksmiths, carpenters, craftsmen,
artisans, sculptors, metallurgy, fire, and volcanoes. In Greek
mythology, he is the son of Zeus and Hera, brother of Athena,
and consort of Aphrodite. He built automatons of metal to work for him,
and made all the weapons of the gods. In some versions of the myth,
Prometheus stole the fire that he gave to man from Hephaestus's forge.
(Summary based on [Wikipedia](https://www.wikipedia.org/) article
"[Hephaestus](https://en.wikipedia.org/wiki/Hephaestus)")

## License

Source files are released under the terms of the license specified in
the repository, the copyright header at the top of each file, or if not
specified, under the [MIT license](https://opensource.org/licenses/MIT).

