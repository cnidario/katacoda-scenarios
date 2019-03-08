# Nuestro primer contenedor

Alpine Linux es una distribución de Linux minimalista y muy ligera.
Vamos a crear un contenedor de Alpine.

- Necesitamos la imagen de Alpine Linux.
`docker images pull alpine`{{execute}}
- Listado de imagenes en el sistema
`docker image ls`{{execute}}
- Lanzamos el contenedor
`docker container run alpine`{{execute}}
- No hemos visto nada, esto es porque la imagen de Alpine no hace nada. Vamos a lanzar un programa sobre ella
`docker container run alpine echo "Hola desde alpine"`{{execute}}
- Vamos a listar los contenedores que están corriendo
`docker container ls`{{execute}}
- Vaya, no hay nada. Ejecutemos
`docker container ls -a`
- Ahora sí. La opción `-a` de `container ls` lista también los contenedores finalizados. Esto es porque un contenedor finaliza en cuanto termina de ejecutar su proceso.
- `ps ax` es el comando de Unix que lista todos los procesos ejecutándose, lánzalo en un contenedor de alpine
`docker container run alpine ????`

>>¿Cuál es el PID del proceso que acabas de lanzar (ps ax)?<<
=== 1

- Examinemos el contenido del contenedor. `ls -l` lista los ficheros del directorio actual, es el `dir` de Unix
`docker container run alpine ls -l`{{execute}}
- Vamos a meternos dentro de un contenedor
`docker container run -it alpine /bin/sh`{{execute}}
- Fisga
`ls -l`{{execute}}
- Hoy estamos muy torpes. `rm -rf <dir>` borra recursivamente y sin pedir confirmación un fichero o directorio
`rm -rf bin`{{execute}}
`ls -l`{{execute}}
- La liaste. ¿La liaste?
`exit`{{execute}}
- ¿Y ahora qué?
`docker container run alpine ls -l`{{execute}}
- Ufff, esa estuvo cerca... Cada vez que lanzamos una aplicación en un contenedor:
  1. El cliente Docker contacta con el demonio de Docker
  2. El demonio de Docker crea el contenedor a partir de la imagen y lanza el comando en el contenedor
  3. El demonio de Docker manda la salida del comando al cliente de Docker
  4. El contenedor finaliza
  5. La imagen es inmutable, no se modifica. Por eso si lo volvemos a lanzar estamos como el principio otra vez


