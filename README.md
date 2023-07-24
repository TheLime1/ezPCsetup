# PC Setup Script

This PowerShell script provides a menu-based interface for installing packages using the Chocolatey package manager.

## Requirements

- Windows operating system (more operating systems soon)
- Administrator privileges
- .NET Framework 4 or higher [download here](https://dotnet.microsoft.com/en-us/download/dotnet-framework)

## Usage

1. Open a PowerShell console as an administrator.
2. Navigate to the directory containing the script.
3. Run the setup script `.\initial_setup.ps1`
4. Run the script using the `.\menu.ps1` command.
5. Follow the on-screen instructions to choose one or more options from the menu.
6. The script will install the packages associated with the chosen options.

## Configuration

The script can be customized by modifying the `$menu` and `$files` variables.

- `$menu` defines the menu options that are displayed to the user.
- `$files` defines the mapping between menu options and file names.

Each file should contain a list of Chocolatey package names, one per line. When an option is chosen, the script will read the corresponding file and install all of the listed packages.

## Example

Here's an example of a `gaming.txt` file that installs several gaming-related packages:

```
steam
epicgameslauncher
ubisoft-connect
geforce-game-ready-driver
ea-app
msiafterburner
goggalaxy
```

## Updating

to update the packages, run the `update.ps1` script.
