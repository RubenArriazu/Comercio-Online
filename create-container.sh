# Crea un contenedor llamado comercio-online

podman run --name comercio-online \
-v $PWD:/db-contenedor:z \
-p 3307:3306 \
-e MYSQL_ALLOW_EMPTY_PASSWORD=secret \
mysql:5.6 \
--secure-file-priv=/db-contenedor/Datos
