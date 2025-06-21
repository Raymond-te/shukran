# Use Node.js LTS
FROM node:lts

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg \
    imagemagick \
    webp \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy dependency definitions
COPY ./package.json ./package-lock.json* ./

# Install npm dependencies
RUN npm install

# Copy application source
COPY . .

# Expose app port (optional)
EXPOSE 3000

# Define environment (optional)
ENV NODE_ENV production

# Start the app
CMD ["npm", "start"]
