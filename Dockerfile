# Step 1: Build the app using Node.js
FROM node:16 AS build-stage

WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the source code
COPY . .

# Build the Vue.js app for production
RUN npm run build

# Step 2: Use Nginx to serve the production-ready app
FROM nginx:alpine

# Copy the built app to the Nginx public folder
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Expose port 80 to access the app
EXPOSE 80

# Start Nginx server to serve the app
CMD ["nginx", "-g", "daemon off;"]
