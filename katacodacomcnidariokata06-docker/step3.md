# Operaciones Docker (3)

- El comando run lanza un nuevo contenedor. ¿Y si queremos correr algo más dentro de un contenedor ya creado?
- Vuelve a lanzar el contenedor de nginx
`docker container run -p 8080:80 -d --name miwebserver nginx`{{execute}}
- Ahora podemos lanzar otro proceso dentro de un contenedor con `docker container exec`
`docker container exec -it miwebserver /bin/bash`{{execute}}
`ls -l /proc/1/exe`{{execute}}
- Explicación: esta imagen no tiene el comando `ps` para listar procesos. Las imágenes de Docker suelen hacerse minimalistas, esto además de aprovechar mejor los recursos, disminuye la 'superficie de ataque' = más simplicidad = menos problemas.
Con `ls -l /proc/1/exe` lista el fichero ejecutable del proceso con PID 1 a través de la interfaz /proc de Linux en que expone diversas funcionalidades del kernel a través del sistema de ficheros.
- Instalemos cosas útiles
`apt update && apt install -y cowsay fortune fortunes-es`{{execute}}
`/usr/games/fortune /usr/share/games/fortunes/es/ | /usr/games/cowsay`{{execute}}

>>¿Quedarán instalados nuestros juegos en los contenedores de nginx que lancemos a partir de ahora?<<
 ( ) Sí, debido a que al ponerle un nombre al contenedor, siempre que lo volvamos a arrancar queda guardado
 ( ) Sí, porque es un servidor web y por tanto su contenido tiene que guardarse en disco al contrario que otros contenedores
 (*) No porque las imágenes son inmutables y al lanzar un contenedor nuevo es como un sistema *fresco* desde 0

- Sal del contenedor
`exit`{{execute}}
- Por último recordarte que `docker container exec` lanza un proceso en un contenedor. Usamos `-it` porque queríamos *acoplar* una terminal pero podemos ejecutar comandos normales
`docker container exec miwebserver /bin/bash -c "/usr/games/fortune /usr/share/games/fortunes/es/ | /usr/games/cowsay"`{{execute}}

`docker container exec miwebserver /bin/bash -c "/usr/games/cowsay -f ghostbusters A quien vas a llamar?"`