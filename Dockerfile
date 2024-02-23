# Pull from a base image
FROM node:16-alpine

# Use app as the working directory
WORKDIR /app

# Copy the files from the current directory to app 
COPY . /app 

# Install dependencies
RUN npm install 

# Build production app 
RUN npm run build 

# Listen on the specified port 
EXPOSE 3000 

# Set node server
ENTRYPOINT npm run start