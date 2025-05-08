# client-management-backend
It is about how to create containerization NodeJs App.


---

markdown
# Client Management Backend

This is the backend API for the Client Management system, built with **Node.js** and **Express**. It provides RESTful endpoints to manage users and connects to a PostgreSQL database.

---

## 🚀 Features

- REST API for managing clients
- PostgreSQL database integration
- Containerized using Docker
- Production-ready structure

---

## 🧱 Project Structure



client-management-backend/
├── routes/           # API routes
├── controllers/      # Route logic
├── models/           # Database models (if using ORM)
├── views/            # Old HTML views (for reference, not used in API)
├── app.js            # Main app entry
├── Dockerfile        # Docker configuration
└── package.json      # Project metadata



---

## 🐳 Docker Setup

This backend is containerized using Docker.

### 📝 Dockerfile Explanation

Dockerfile
# Use an official Node.js image as base
FROM node:18

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port the app runs on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]


### 🔧 Build and Run with Docker

1. **Build the Docker image**


docker build -t client-management-backend .


2. **Run the container**


docker run -p 3000:3000 client-management-backend


> Replace `docker` with `podman` if you're using Podman.

---

## 🔗 API Endpoints

| Method | Endpoint     | Description       |
| ------ | ------------ | ----------------- |
| GET    | `/users`     | Get all users     |
| POST   | `/users`     | Add a new user    |
| GET    | `/users/:id` | Get user by ID    |
| PUT    | `/users/:id` | Update user by ID |
| DELETE | `/users/:id` | Delete user by ID |

---

## 🧪 Testing

You can use tools like **Postman** or **Insomnia** to test API endpoints.

---

## 📦 Environment Variables

Make sure to create a `.env` file to store your configuration, like:


PORT=3000
DB_HOST=your_postgres_host
DB_PORT=5432
DB_USER=your_user
DB_PASSWORD=your_password
DB_NAME=clientdb

