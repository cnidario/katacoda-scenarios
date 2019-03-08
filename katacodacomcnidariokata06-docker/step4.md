# Operaciones (avanzadas!)con Docker (4!)

- Un Dockerfile es un documento de texto que dice como construír una imagen de un contenedor. Es una especie de build automatizado de imágenes
- Todos los comandos son en letras mayúsculas. Algunos de ellos son
  - FROM
  - RUN
  - ADD y COPY
  - CMD
  - EXPOSE
  - ENTRYPOINT

- `FROM` es siempre el primero y obligatorio. Las imágenes son creadas en capas (*layers*), lo que significa que puedes usar una imagen como base para otra. Se usa como `FROM <nombre-de-imagen>`
- `RUN` es para crear la imagen actual. Cada run añade una capa, Docker ejecuta el comando y guarda el estado como una nueva capa. De esto modo se puede hacer rollback a estados anteriores fácilmente. La sintaxis es `RUN <comando shell>`. Docker correrá ese comando automáticamente con la shell `bin/sh`
- `COPY` copia ficheros locales en el contenedor. Necesitan estar en el mismo directorio o subdirectorio. Ejemplo `COPY requirements.txt /usr/src/app`
- `CMD` define los comandos que correran cuando la imagen se arranque (la imagen se instancie en un contenedor). No crea una nueva capa para la imagen. Sólo puede haber un `CMD` por Dockerfile. Ejemplo: `CMD ["python", "./app.py"]`
- `EXPOSE` crea pistas a los usuarios de una imagen sobre los servicios que proporciona el contenedor en puertos TCP. No hace los puertos accesibles, esto tiene que hacerse igualmente como vimos con el parámetro `-p 8080:80`.


- Vamos a escribir un Dockerfile :
- Primero 
`apt update && apt install -y wget`{{execute}}
`wget https://bit.ly/2CbrAEt`{{execute}}
`nano Dockerfile`{{execute}}
`FROM ubuntu:latest
RUN apt-get update -y
RUN apt-get install -y caca-utils
COPY 2CbrAEt /
CMD ["/usr/bin/cacaview", "/2CbrAEt"]`

- Construyamos la imagen
`docker image build -t myfirstdocker .`{{execute}}
`docker image ls`{{execute}}
- Lancemos un contenedor con nuestra imagen
`docker container run -it myfirstdocker`{{execute}}
- Borremos la imagen
`docker image rm myfirstdocker`{{execute}}


