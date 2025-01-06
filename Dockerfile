# Use the official Node.js LTS Alpine image
FROM node:20-alpine as build

# Set working directory
WORKDIR /app

# Copy package files first to leverage Docker layer caching
COPY package.json ./

# Install production dependencies
RUN npm install --production

# Copy the rest of the application
COPY . .

# Expose port
ENV PORT=80
EXPOSE 80

# Run the application
CMD ["npm", "start"]