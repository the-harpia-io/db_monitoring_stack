# Extract the archive.
Expand-Archive $pwd\..\archives\docker-20.10.9.zip -DestinationPath $Env:ProgramFiles

# Install Docker. This requires rebooting.
$null = Install-WindowsFeature containers

# Restart server
Restart-Computer -Confirm