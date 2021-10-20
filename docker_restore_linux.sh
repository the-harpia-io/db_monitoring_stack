# Restore images
echo "Start uploading images"
docker load < $PWD/backup/images/db_monitoring_stack_elasticsearch.tar
docker load < $PWD/backup/images/db_monitoring_stack_grafana.tar
docker load < $PWD/backup/images/db_monitoring_stack_logstash.tar
docker load < $PWD/backup/images/db_monitoring_stack_kibana.tar
docker load < $PWD/backup/images/mariadb.tar
docker load < $PWD/backup/images/apm-server.tar
docker load < $PWD/backup/images/ubuntu.tar

# Run containers
echo "Start running containers"
docker-compose run -d
sleep 30s

# Restore volumes
echo "Start restoring volumes"
docker run --rm --volumes-from mariadb -v $PWD/backup/volumes:/backup ubuntu bash -c "cd /bitnami/mariadb && tar xvf /backup/mariadb_data.tar --strip 1"
docker run --rm --volumes-from elasticsearch -v $PWD/backup/volumes:/backup ubuntu bash -c "cd /usr/share/elasticsearch/data && tar xvf /backup/elasticsearch_data.tar --strip 1"