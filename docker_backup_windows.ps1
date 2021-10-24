# Clear previous images and volumes
rm -rf $pwd/backup/volumes/*
rm -rf $pwd/backup/images/*
rm -rf $pwd/archives/*

# Save Docker Volumes
docker run --rm --volumes-from mariadb -v $pwd/backup/volumes:/backup ubuntu tar Pcvf /backup/mariadb_data.tar /bitnami/mariadb
docker run --rm --volumes-from elasticsearch -v $pwd/backup/volumes:/backup ubuntu tar Pcvf /backup/elasticsearch_data.tar /usr/share/elasticsearch/data

# Save changes in Images
docker commit elasticsearch docker.elastic.co/elasticsearch/elasticsearch:7.15.0
docker commit grafana grafana/grafana:8.2.0
docker commit logstash docker.elastic.co/logstash/logstash:7.15.0
docker commit kibana docker.elastic.co/kibana/kibana:7.15.0
docker commit mariadb bitnami/mariadb:latest
docker commit apm-server docker.elastic.co/apm/apm-server:7.15.0

# Download Images
docker save docker.elastic.co/elasticsearch/elasticsearch:7.15.0 > $pwd/backup/images/db_monitoring_stack_elasticsearch.tar
docker save grafana/grafana:8.2.0 > $pwd/backup/images/db_monitoring_stack_grafana.tar
docker save docker.elastic.co/logstash/logstash:7.15.0 > $pwd/backup/images/db_monitoring_stack_logstash.tar
docker save docker.elastic.co/kibana/kibana:7.15.0 > $pwd/backup/images/db_monitoring_stack_kibana.tar
docker save bitnami/mariadb:latest > $pwd/backup/images/mariadb.tar
docker save docker.elastic.co/apm/apm-server:7.15.0 > $pwd/backup/images/apm-server.tar
docker save ubuntu:latest > $pwd/backup/images/ubuntu.tar

# Create single archive
Compress-Archive -Path $pwd -DestinationPath $pwd/archives/db_monitoring_stack_full.zip