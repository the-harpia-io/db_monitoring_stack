# Install Docker Engine
sudo dpkg -i ./archives/containerd.io_1.4.11-1_amd64.deb
sudo dpkg -i ./archives/docker-ce-cli_20.10.9_3-0_ubuntu-focal_amd64.deb
sudo dpkg -i ./archives/docker-ce_20.10.9_3-0_ubuntu-focal_amd64.deb

# Install docker-compose
sudo cp ./archives/docker-compose-Linux-x86_64 /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose