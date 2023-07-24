# Check if running as administrator
if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "You must run this script as an Administrator." -ForegroundColor Red
    exit
}

# Define the menu options
$menu = @(
    "1 - essential",
    "2 - gaming",
    "3 - dev",
    "4 - productive"
)

# Define the mapping between menu options and file names
$files = @{
    1 = "essential.txt"
    2 = "gaming.txt"
    3 = "dev.txt"
    4 = "productive.txt"
}

# Display the menu
Write-Host "`nPlease choose one or more options (separated by commas):`n" -ForegroundColor Cyan
foreach ($option in $menu) {
    Write-Host $option -ForegroundColor Yellow
}

# Read the user's choice
$choice = Read-Host

# Split the choice into individual numbers
$numbers = $choice.Split(",")

# Process each number
foreach ($number in $numbers) {
    # Get the corresponding file name
    $file = $files[[int]$number]

    # Check if the file exists
    if (Test-Path $file) {
        # Read the commands from the file
        $commands = Get-Content $file

        # Build the choco install command
        $command = "choco install $($commands -join ' ') -y"

        # Execute the command
        Invoke-Expression $command
    } else {
        Write-Error "File not found: $file"
    }
}
