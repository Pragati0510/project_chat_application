FROM node:latest

# Set the working directory inside the container
WORKDIR /app
# Install nodemon globally
RUN npm install -g nodemon

# Copy both package.json and package-lock.json to the working directory
COPY ./client/src/App.js /app
COPY ./client/src/index.js /app
COPY ./client/package.json /app
COPY ./client/package-lock.json /app
COPY ./client/public/index.html /app
COPY ./server/package.json /app
COPY ./server/package-lock.json /app
COPY ./server/index.js /app
COPY ./server/router.js /app
COPY ./server/users.js /app

# Install project dependencies
RUN npm install 


# Copy the rest of the application code
COPY . /app

# Expose any ports the app needs
EXPOSE 5000

# Define the command to run the application
CMD [ "npm", "start" ]
