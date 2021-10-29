# Install Monitoring DB Stack
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
chmod +x ./scripts/install_monitoring_stack.sh && sudo ./scripts/install_monitoring_stack.sh

# Upgrade Monitoring DB Stack
## Windows:
1. Run EXE file
2. Execute installation file: "install_monitoring_stack.exe"

## Linux:
### Unzip archive and go inside
sudo tar -xzvf monitoring_db_stack.tar.gz && cd monitoring_db_stack

### Upgrade Monitoring DB Stack
chmod +x ./scripts/install_monitoring_stack.sh && sudo ./scripts/install_monitoring_stack.sh
