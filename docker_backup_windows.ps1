# Clear previous images and volumes
rm -rf $pwd/backup/volumes/*
rm -rf $pwd/backup/images/*
rm -rf $pwd/archives/*

# Save Docker Volumes
docker run --rm --volumes-from mariadb -v $pwd/backup/volumes:/backup ubuntu tar Pcvf /backup/mariadb_data.tar /bitnami/mariadb
docker run --rm --volumes-from elasticsearch -v $pwd/backup/volumes:/backup ubuntu tar Pcvf /backup/elasticsearch_data.tar /usr/share/elasticsearch/data

# Save changes in Images
docker commit elasticsearch db_monitoring_stack_elasticsearch:latest
docker commit grafana db_monitoring_stack_grafana:latest
docker commit logstash db_monitoring_stack_logstash:latest
docker commit kibana db_monitoring_stack_kibana:latest
docker commit mariadb mariadb:latest
docker commit apm-server apm-server:latest

# Download Images
docker save db_monitoring_stack_elasticsearch:latest > $pwd/backup/images/db_monitoring_stack_elasticsearch.tar
docker save db_monitoring_stack_grafana:latest > $pwd/backup/images/db_monitoring_stack_grafana.tar
docker save db_monitoring_stack_logstash:latest > $pwd/backup/images/db_monitoring_stack_logstash.tar
docker save db_monitoring_stack_kibana:latest > $pwd/backup/images/db_monitoring_stack_kibana.tar
docker save mariadb:latest > $pwd/backup/images/mariadb.tar
docker save apm-server:latest > $pwd/backup/images/apm-server.tar
docker save ubuntu:latest > $pwd/backup/images/ubuntu.tar

# Create single archive
Compress-Archive -Path $pwd -DestinationPath $pwd/archives/db_monitoring_stack_full.zip