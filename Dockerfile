FROM ubuntu:latest

# Install dependency
RUN apt-get update \
    && apt-get install -y curl ant default-jdk \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Node.js related
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .

EXPOSE 3000
CMD ["node", "main.js"]
