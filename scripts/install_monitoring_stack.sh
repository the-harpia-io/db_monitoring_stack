# Restore images
echo "Start uploading images"
docker load -i ./backup/images/db_monitoring_stack_elasticsearch.tar
docker load -i ./backup/images/db_monitoring_stack_grafana.tar
docker load -i ./backup/images/db_monitoring_stack_logstash.tar
docker load -i ./backup/images/db_monitoring_stack_kibana.tar
docker load -i ./backup/images/mariadb.tar
docker load -i ./backup/images/apm-server.tar

# Run containers
echo "Start running containers"
docker-compose up -d
