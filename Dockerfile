# Use uma imagem base com Node.js e FFmpeg
FROM jrottenberg/ffmpeg:4.3-ubuntu

# Instale o Node.js
RUN apt-get update && apt-get install -y nodejs npm

# Crie e defina o diretório de trabalho
WORKDIR /usr/src/app

# Copie o package.json e o package-lock.json para instalar as dependências
COPY package*.json ./

# Instale as dependências da aplicação
RUN npm install

# Copie o código da aplicação para o diretório de trabalho
COPY . .

# Expor a porta da aplicação (mude conforme necessário)
EXPOSE 5678

# Comando para iniciar a aplicação
CMD ["npm", "start"]
