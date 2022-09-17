FROM node:lts-alpine 

#instalamos http-server
RUN npm install -g http-server

RUN mkdir /app

# set current work dir
WORKDIR /app

# Copy package.json, packge-lock.json into current dir
COPY package*.json ./

# install dependencies
RUN npm install

# copy sources
COPY . .
# Run app
RUN npm run build

# open default port
EXPOSE 8080

#EJECUTAMOS 
CMD ["http-server", "dist"]