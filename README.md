# Hephaestus

## Introduction

An automation script for installing and configuring a Windows 10-based
development machine.

## Features

*   Disable System Restore temporarily for improved performance and
    create an initial system restore point when done
*   Install Chrome, Firefox and Opera with LastPass browser extension
*   Enable Windows Subsystem for Linux (WSL)
*   Enable Hyper-V and install Docker CE for Windows

## Requirements

*   Windows 10 Professional
*   Hardware support for Hyper-V virtualization technology

## Recommendations

*   Perform a clean installation of Windows 10 Fall Creators Update or
    newer before running the script

## Installation

```powershell
Set-ExecutionPolicy RemoteSigned
.\Install-Hephaestus.ps1
```

## Etymology

Hephaestus is the Greek god of blacksmiths, carpenters, craftsmen,
artisans, sculptors, metallurgy, fire, and volcanoes. In Greek
mythology, he is the son of Zeus and Hera, brother of Athena,
and consort of Aphrodite. He built automatons of metal to work for him,
and made all the weapons of the gods. In some versions of the myth,
Prometheus stole the fire that he gave to man from Hephaestus's forge.
(Summary based on Wikipedia article
"[Hephaestus](https://en.wikipedia.org/wiki/Hephaestus)")

## License

Source files are released under the terms of the license specified in
the repository, the copyright header at the top of each file, or if not
specified, under the [MIT license](https://opensource.org/licenses/MIT).

Content, design, layout, look-and-feel and assets may be the subject of
intellectual property rights reserved by the right holders, and are not
licensed for any purpose hereunder.
