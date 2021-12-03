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

# Linux: Install Monitoring DB Stack
## Run next command in the Termical to configure Docker Engine
```
sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io
```

## Run next command in the Terminal to configure Docker Compose
```
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

## Install Monitoring Stack
### Download monitoring package
```
cd /opt && git clone https://github.com/the-harpia-io/monitoring_db_stack.git
```

### Specify Client Name, Slack and License key:
```
export CLIENT_NAME = 'Motorola-Zramim'
export SLACK_WEBHOOK = 'http://slack-webhook.com/url'
export LICENSE_KEY = '<Your unique License key>'
```

### Start Services
```
cd /opt/monitoring_db_stack
docker-compose up -d
```