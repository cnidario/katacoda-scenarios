# Operaciones avanzadas con Docker (5)

- Vamos a hacer algo más útil
`docker container run --name mysql-container --rm -p 3306:3306 -e MYSQL_ROOT_PASSWORD=mipassword -d mysql:5.7`{{execute}}
- Wow! Quien hubiera dicho que montar una mysql pudiera hacerse tan rápido
`docker container run --name wordpress-container --rm -e WORDPRESS_DB_HOST=172.17.0.1 -e WORDPRESS_DB_PASSWORD=mipassword -p 8080:80 -d wordpress`{{execute}}
- Visita [https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/](https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/)

- Aquí hemos hecho una pequeña chapucilla. Lanzamos un contenedor de mysql y exponemos su puerto a través del de nuestra máquina actual. Luego lanzamos el wordpress y lo conectamos al contenedor de mysql a través de nuestra máquina (172.17.0.1 es la ip de nuestra máquina en la interfaz de red virtual de los contenedores)
- Esto presenta al menos dos problemas.
  1. Tenemos que conocer la IP de nuestro host
  2. Tenemos que exponer el puerto de mysql en nuestro host!
- Paremos los contenedores
`docker container stop wordpress-container mysql-container`{{execute}}

- Gestión de una red de contenedores. Creamos una red
`docker network create if_wordpress`{{execute}}
- Lanzamos los contenedores con la red
`docker container run --name mysql-container --rm --network if_wordpress -e MYSQL_ROOT_PASSWORD=mipassword -d mysql:5.7`{{execute}}
`docker container run --name wordpress-container --rm --network if_wordpress -e WORDPRESS_DB_HOST=mysql-container -e WORDPRESS_DB_PASSWORD=mipassword -p 8080:80 -d wordpress`{{execute}}
- Un comando útil es `inspect`
`docker network inspect if_wordpress`{{execute}}

### Persistencia (volúmenes y bind mounts)
- Habíamos dicho que los contenedores son inmutables. Para tener persistencia Docker usa `bind mounts` y `volumes`