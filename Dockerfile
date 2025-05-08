# Stage 1: Build the app
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install --omit=dev && npm cache clean --force  
COPY . .
RUN npm prune --production

# Stage 2: Create a clean final image
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app /app
EXPOSE 5001
# Start the backend server
CMD [ "node", "index.js" ]