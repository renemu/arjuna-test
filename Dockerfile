# Use the official Node.js runtime as the base image
FROM node:18 as build

# Set the working directory in the container
WORKDIR /app

# Copy the entire application code to the container
COPY . .

# COPY .env.example .env
# Build the React app for production
RUN yarn && yarn build

# Use Nginx as the production server
FROM nginx:alpine

# Copy nginx configuration
COPY ./docker/nginx /etc/nginx/conf.d

# Copy the built React app to Nginx's web server directory
COPY --from=build /app/dist /usr/share/nginx/html

# Expose port 80 for the Nginx server
EXPOSE 80

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]