# Use the official Node.js image as a base
FROM node:20-alpine
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

# Set the working directory
USER node
WORKDIR /usr/src/app

COPY package*.json ./

# Switch to the 'node' user
USER root

# Install dependencies
RUN npm install

COPY . .
# Start the application
CMD ["npm", "start"]
