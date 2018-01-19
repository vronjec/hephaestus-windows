# Hephaestus: The Windows development machine

## Introduction

An automation script for installing and configuring a Windows 10-based
development machine.

## Features

*   Installs browsers and messaging applications:
    *   Google Chrome with LastPass browser extension
    *   Mozilla Firefox with LastPass browser extension
    *   Opera with LastPass browser extension
    *   Skype Classic
*   Installs office applications and utilities:
    *   Microsoft Office 365 Personal
    *   PeaZip archiver utility
*   Installs graphic design applications and tools:
    *   Adobe Creative Cloud app (for manual installation of Adobe apps)
    *   FileOptimizer lossless file optimizer
*   Installs software development applications and tools:
    *   Cyberduck FTP and cloud storage client
    *   Git version control software
    *   Visual Studio Code source code editor
    *   JetBrains Toolbox (for manual installation of JetBrains apps)
    *   Docker CE for Windows
*   Installs multimedia and entertainment applications:
    *   Nomacs image viewer
    *   MPC-HC media player
    *   Steam app (for manual installation of Steam games)
*   Enables optional Windows features for development:
    *   Windows Subsystem for Linux (WSL)
    *   Hyper-V 
    *   Containers
*   Creates system restore point when installation completes
    
## Requirements

*   Hardware support for Hyper-V virtualization
*   Internet connection

## Recommendations

*   Perform a clean installation of Windows 10 Pro Insider Preview 17025
    or newer (for feature to access containers via published ports using
    localhost or 127.0.0.1)
*   Link Microsoft account during installation to access otherwise
    unavailable Insider Preview features

## Installation

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

Content, design, layout, look-and-feel and assets may be the subject of
intellectual property rights reserved by the right holders, and are not
licensed for any purpose hereunder.
