# System Requirements
## Installing Neovim
See https://github.com/neovim/neovim/blob/master/INSTALL.md

## Installing Mason dependency managers
The [mason](https://github.com/mason-org/mason.nvim) package manager is used to install various lsp/linters/formatters.

It requires the system to have:

`python`, `pip` (for ruff, etc.)

`npm` (for pyright)

# Deployment
## Unix-like
The default configuration location is: `~/.config/nvim`.

Go into `.config` and clone the repo into folder `nvim`
```bash
cd ~/.config && git clone git@github.com:neilkichler/nvim-config.git nvim
```
## Windows
The default configuration location is: `%USERPROFILE%\AppData\Local`.

### Command Prompt
```
cd %USERPROFILE%\AppData\Local &&  git clone git@github.com:neilkichler/nvim-config.git nvim
```
### or via Powershell
```powershell
cd $env:userprofile\AppData\Local; git clone git@github.com:neilkichler/nvim-config.git nvim
``` 

# Installation
Open Neovim and the automatic configuration and downloading of plugins should begin:
```bash
nvim
```
