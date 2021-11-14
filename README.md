# Windows: Install Monitoring DB Stack
## Configure Windows virtualization for Docker
1. Open Start on Windows 10
2. Search for Command Prompt, right-click the top result, and select the Run as administrator option
3. Type the following command to install the WSL on Windows 10 and press Enter
```wsl --install```
4. Restart Server

## Download and Install Docker Desktop
URL - https://desktop.docker.com/win/main/amd64/Docker%20Desktop%20Installer.exe

## Download and Install GIT client
https://github.com/git-for-windows/git/releases/download/v2.33.1.windows.1/Git-2.33.1-64-bit.exe

## Download monitoring stack package
1. Open PowerShell
2. Download package
```git clone https://github.com/the-harpia-io/monitoring_db_stack.git```
3. Specify Client Name, Slack and License key:
```
$env:CLIENT_NAME = 'Motorola-Zramim'
$env:SLACK_WEBHOOK = 'http://slack-webhook.com/url'
$env:LICENSE_KEY = '<Your unique License key>'
```
4. Start Services
```
cd monitoring_db_stack
docker-compose up -d
```