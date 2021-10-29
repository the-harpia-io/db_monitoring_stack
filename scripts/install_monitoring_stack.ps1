# Restore images
#docker load -i $pwd/../backup/images/db_monitoring_stack_elasticsearch.tar
docker load -i $pwd/../backup/images/db_monitoring_stack_grafana.tar
#docker load -i $pwd/../backup/images/db_monitoring_stack_logstash.tar
#docker load -i $pwd/../backup/images/db_monitoring_stack_kibana.tar
docker load -i $pwd/../backup/images/mariadb.tar
#docker load -i $pwd/../backup/images/apm-server.tar

# Run containers
$CMD = "$pwd\..\archives\docker-compose-Windows-x86_64.exe"
& $CMD up -d