# Check for supported version of Windows
if ([Environment]::OSVersion.Version -lt [Version]"6.1") {
    Write-Error "You must have Windows 7 or higher to use Chocolatey."
    exit
}

# Check for PowerShell v2 or higher
if ($PSVersionTable.PSVersion.Major -lt 2) {
    Write-Error "You must have PowerShell v2 or higher to use Chocolatey."
    exit
}

# Check for .NET Framework 4 or higher
try {
    $dotNetVersion = [Environment]::Version
} catch {
    $dotNetVersion = [System.Diagnostics.FileVersionInfo]::GetVersionInfo([System.Runtime.InteropServices.RuntimeEnvironment]::GetRuntimeDirectory() + "mscorlib.dll").FileVersion
}
if ([Version]$dotNetVersion -lt [Version]"4.0") {
    Write-Error "You must have .NET Framework 4 or higher to use Chocolatey."
    exit
}

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
