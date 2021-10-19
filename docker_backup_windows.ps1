$current_date = Get-Date -Format "MM.dd.yyyy.HH.mm"

# Clear previous images and volumes
rm $PSScriptRoot/backup/volumes/*
rm $PSScriptRoot/backup/images/*

# Save Docker Volumes
docker run --rm --volumes-from mariadb -v $PSScriptRoot/backup/volumes:/backup ubuntu tar Pcvf /backup/mariadb_data.tar /bitnami/mariadb
docker run --rm --volumes-from elasticsearch -v $PSScriptRoot/backup/volumes:/backup ubuntu tar Pcvf /backup/elasticsearch_data.tar /usr/share/elasticsearch/data

# Save changes in Images
docker commit elasticsearch db_monitoring_stack_elasticsearch:latest
docker commit grafana db_monitoring_stack_grafana:latest
docker commit logstash db_monitoring_stack_logstash:latest
docker commit kibana db_monitoring_stack_kibana:latest
docker commit mariadb mariadb:latest
docker commit apm-server apm-server:latest

# Download Images
docker save db_monitoring_stack_elasticsearch:latest > $PSScriptRoot/backup/images/db_monitoring_stack_elasticsearch.zip
docker save db_monitoring_stack_grafana:latest > $PSScriptRoot/backup/images/db_monitoring_stack_grafana.zip
docker save db_monitoring_stack_logstash:latest > $PSScriptRoot/backup/images/db_monitoring_stack_logstash.zip
docker save db_monitoring_stack_kibana:latest > $PSScriptRoot/backup/images/db_monitoring_stack_kibana.zip
docker save mariadb:latest > $PSScriptRoot/backup/images/mariadb.zip
docker save apm-server:latest > $PSScriptRoot/backup/images/apm-server.zip
docker save ubuntu:latest > $PSScriptRoot/backup/images/ubuntu.zip

# Create single archive
Compress-Archive -Path $PSScriptRoot -DestinationPath $PSScriptRoot/archives/db_monitoring_stack_$current_date.zip -Exclude $PSScriptRoot/archives

