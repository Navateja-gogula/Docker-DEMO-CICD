# Use the official Node.js Alpine image for a smaller build
FROM node:18-alpine

# Set the working directory inside the container
WORKDIR /app

# Install Nodemon globally
RUN npm install -g nodemon

# Set environment variable for hot reloading
ENV CHOKIDAR_USEPOLLING=true

# Copy package.json and package-lock.json first to cache dependencies
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files
COPY . .

# Expose the port for the React app
EXPOSE 3000

# Start the React app with Nodemon for hot reloading
CMD ["nodemon", "--watch", "src", "--ext", "js,jsx,css", "--exec", "npm", "start"]
