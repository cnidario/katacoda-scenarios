# Operaciones con contenedores (2)

- Antes he dicho que cuando termina el proceso el contenedor finaliza, pero en realidad no se destruye
`docker container ls -a`{{execute}}
- Vamos a limpiar un poco. Sustituye <ID> por un container ID o por el nombre del contenedor que quieres borrar
`docker container rm <ID>`
- Comprueba que se ha borrado
`docker container ls -a`{{execute}}
- Borra el resto...                      Es broma, usa esto
`docker container prune`{{execute}}

- Ahora vamos a hacer algo más interesante. Consigue la imagen de Nginx.
Nginx es un servidor web de contenido estático (como Apache)
`docker container run` en realidad hace varias cosas por debajo, de hecho es innecesario hacer `docker image pull` para bajarse la imagen, `docker container run` ya lo hará por nosotros.
`docker container run -p 8080:80 -d nginx`{{execute}}
- Visita ahora [https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/](https://[[HOST_SUBDOMAIN]]-8080-[[KATACODA_HOST]].environments.katacoda.com/) O ejecuta:
`curl localhost:8080`{{execute}}
- El parámetro `-p 8080:80` le dice que redireccione el puerto 8080 de tu máquina (anfitrión) al 80 del contenedor (nginx)
- El parámetro `-d` es de *detached mode* es decir, que corra el contenedor en segundo plano
`docker container ls`{{execute}}
- Ahora sí que vemos el contendor vivo. Vamos a pararlo
`docker container stop <ID> `

