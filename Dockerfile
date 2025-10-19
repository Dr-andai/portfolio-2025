# Node.js image
FROM node:18

# Install Git
RUN apt-get update && apt-get install -y git && apt-get clean

# Set a working directory inside the container
WORKDIR /usr/src/app

# Clone repository 
RUN git clone https://github.com/Dr-andai/portfolio-2025.git .

# Copy your local project into the container (if you already have it locally)
COPY . .

# Install dependencies
RUN npm install

# Build the app for production
RUN npm run build

# Expose your app's port (e.g., 3000)
EXPOSE 3000

# Start the app
CMD ["npm", "run", "dev"]
