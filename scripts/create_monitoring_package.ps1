# Clear previous images and volumes
# Remove-Item $pwd/backup/volumes/* -Recurse
# Remove-Item $pwd/backup/images/* -Recurse
# Remove-Item $pwd/archives/* -Recurse

# Save Docker Volumes
# docker run --rm --volumes-from mariadb -v $pwd/backup/volumes:/backup ubuntu tar Pcvf /backup/mariadb_data.tar /bitnami/mariadb
# docker run --rm --volumes-from elasticsearch -v $pwd/backup/volumes:/backup ubuntu tar Pcvf /backup/elasticsearch_data.tar /usr/share/elasticsearch/data

# Save changes in Images
# docker commit elasticsearch docker.elastic.co/elasticsearch/elasticsearch:7.15.0
# docker commit grafana grafana/grafana:8.2.0
# docker commit logstash docker.elastic.co/logstash/logstash:7.15.0
# docker commit kibana docker.elastic.co/kibana/kibana:7.15.0
# docker commit mariadb bitnami/mariadb:latest
# docker commit apm-server docker.elastic.co/apm/apm-server:7.15.0

# Download Images
#docker save docker.elastic.co/elasticsearch/elasticsearch:7.15.0 -o $pwd/backup/images/db_monitoring_stack_elasticsearch.tar
docker save grafana/grafana:8.2.0 -o $pwd/backup/images/db_monitoring_stack_grafana.tar
#docker save docker.elastic.co/logstash/logstash:7.15.0 -o $pwd/backup/images/db_monitoring_stack_logstash.tar
#docker save docker.elastic.co/kibana/kibana:7.15.0 -o $pwd/backup/images/db_monitoring_stack_kibana.tar
docker save bitnami/mariadb:latest -o $pwd/backup/images/mariadb.tar
#docker save docker.elastic.co/apm/apm-server:7.15.0 -o $pwd/backup/images/apm-server.tar

# Create single archive
# Install-Module -Name 7Zip4PowerShell -Verbose
# Compress-7Zip -Path $pwd\* -ArchiveFileName C:\Users\mykola\Documents\db_monitoring_stack_full.zip -Format Zip
# tar -czvf monitoring_db_stack.tar.gz monitoring_db_stack
# tar -xzvf monitoring_db_stack.tar.gz

# Download Windows Docker engine for offline installation
# invoke-webrequest -UseBasicparsing -Outfile docker-20.10.9.zip https://download.docker.com/win/static/stable/x86_64/docker-20.10.9.zip
# Download Linux Docker engine
# https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-ce-cli_20.10.9~3-0~ubuntu-focal_amd64.deb

# Make EXE archive
# https://www.makeuseof.com/tag/how-to-make-an-exe-installation-file/amp/
# ps2exe .\docker_configure.ps1 ..\installations\docker_configure.exe -requireAdmin
# ps2exe .\docker_install.ps1 ..\installations\docker_install.exe -requireAdmin
# ps2exe .\initial_run.ps1 ..\installations\initial_run.exe -requireAdmin
# ps2exe .\install_monitoring_stack.ps1 ..\installations\install_monitoring_stack.exe -requireAdmin

# Save-Module -Name DockerMsftProvider -Path C:\Users\mykola\Projects\monitoring_db_stack\archives


# Convert PS1 to EXE
# https://adamtheautomator.com/ps1-to-exe/