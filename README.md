
<p align="center">
    <img width="25%" src="./logo.svg">
</p>

# Raphael's dotfiles

> Your dotfiles are how you personalize your system. These are mine.

This repository contains the configuration of my development environment.

## What's included?

### 7-Zip

7-Zip is installed with Windows Explorer integration and added to the `PATH`.

### Browsers

Google Chrome, Mozilla Firefox and Microsoft Edge are installed but not updated, as they keep themselves up-to-date.

### Chocolatey

Chocolatey is used to install most of the other packages.

### Docker Desktop & Docker Compose

Docker Desktop & Docker Compose are installed and added to the `PATH`.

### Fonts

The following Nerd Fonts are installed:
- Cascadia Code
- Fantasque Sans Mono
- Fira Code
- Victor Code

### Git

Git is installed along with the Git Extras extensions and added to the `PATH`.

### Inkscape

Inkscape is installed.

### Keepass

Keepass is installed.

### Media Player Classic

Media Player Classic Home Cinema Edition is installed.

### Node

Node Version Manager is installed and added to the `PATH`. Node Version Manager is used to install the latest version of Node and NPM. Also Yarn is installed.

### Notion

Notion is installed.

### Windows PowerShell & PowerShell Core

A custom profile is setup for both, Windows PowerShell and PowerShell Core. The custom profile loads the `posh-git` and `oh-my-posh` modules and applies a custom theme. It also defines the following aliases:

- `..` switches to the parent directory
- `...` changes to the parent directory of the parent directory
- `....` ...
- `home` switches to the home directory
- `la` lists all files
- `lsd` lists all directories
- `e` opens the current folder or the folder provided as argument in Windows Explorer
- `c` opens the current folder or the folder provided as argument in Visual Studio Code

### Slack

Slack is installed.

### Telegram

Telegram is installed.

### Visual Studio Code

Visual Studio Code is installed and added to the `PATH`.

### Windows

A lot of the preinstalled apps are uninstalled, desktop shortcuts are removed, and the explorer and taskbar are configured.

### Windows Terminal

The Windows Terminal Application is installed and configured to open a PowerShell Core tab by default. The configuration also include a custom color scheme to make it look like this:

![Screenshot of my Windows Terminal](windows-terminal.png)

### Windows Subsystem for Linux

The Windows Subsystem for Linux is installed / activated.

## How to use it?

🔞 If you want to give it a try, fork this repository, review the code, and remove things you don't want or need. You should not blindly use my settings. Use at your own risk! 😈

Run the `configure.ps1` script in a powershell with admin rights. The script can be run multiple times, if something is already installed it will be updated to the latest version.

## Attributions

Icon made by <a href="http://www.freepik.com/" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>
