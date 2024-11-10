# Use the official Node.js image as a base
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

EXPOSE 8080

# Start the application
CMD ["node", "server.js"]
