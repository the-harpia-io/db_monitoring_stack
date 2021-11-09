# Install Monitoring DB Stack
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
3. Specify Client Name
```$env:CLIENT_NAME = 'Motorola-Zramim'```
4. Start Services
```cd monitoring_db_stack```
```docker-compose up -d```

## Windows:
1. Run EXE file

### Install Docker Engine on your Server
2. Execute Docker installation file (it will requarie server restart): "docker_install.exe"
3. Execute Docker Configure file after restart: "docker_configure.exe"

### Install Monitoring DB Stack
1. Go to: "C:\Program Files\Monitoring DB Stack\installations"
2. Execute installation file: "install_monitoring_stack.exe"

## Linux:
### Unzip archive and go inside
sudo tar -xzvf monitoring_db_stack.tar.gz && cd monitoring_db_stack

### Install Docker Engine
chmod +x ./scripts/docker_install.sh && sudo ./scripts/docker_install.sh

### Install Monitoring DB Stack
export CLIENT_NAME=ClientA && chmod +x ./scripts/install_monitoring_stack.sh && sudo ./scripts/install_monitoring_stack.sh

# Upgrade Monitoring DB Stack
## Windows:
1. Run EXE file
2. Execute installation file: "install_monitoring_stack.exe"

## Linux:
### Unzip archive and go inside
sudo tar -xzvf monitoring_db_stack.tar.gz && cd monitoring_db_stack

### Upgrade Monitoring DB Stack
chmod +x ./scripts/install_monitoring_stack.sh && sudo ./scripts/install_monitoring_stack.sh
