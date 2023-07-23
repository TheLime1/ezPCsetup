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
Write-Host "Please choose one or more options (separated by commas):"
$menu

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

        # Execute each command
        foreach ($command in $commands) {
            Invoke-Expression $command
        }
    } else {
        Write-Error "File not found: $file"
    }
}
