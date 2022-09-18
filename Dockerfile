#Bajamos la imagen:
FROM node:lts-alpine 

#instalamos http-server para que corra la app vue
RUN npm install -g http-server
#creamos un directorio app
RUN mkdir /app

#lo seteamos a ese directorio como el de trabajo
WORKDIR /app

# Copiamos el package json y el package-lock.json para hacer el npm intall
COPY package*.json ./

# install dependencies
RUN npm install

# copiamos de origen a destino: se pone . porque estamos ejecutando en la misma ruta del proyecto
COPY . .
# generamos el buil de la app en base al script de package.json 
RUN npm run build

# abrimos el puerto 8080 del contenedor que se cree
EXPOSE 8080

#EJECUTAMOS los comandos propios de http-server y apuntamos a la carpeta dist donde se genero el build de la app
CMD ["http-server", "dist"]