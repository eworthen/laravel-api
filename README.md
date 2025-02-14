# Laravel 11 API with Sanctum & Docker

This is a Laravel 11 API project using Sanctum for authentication and MySQL running inside Docker containers.
## Prerequisites

- Docker & Docker Compose installed
- Composer installed
- Postman or any API testing tool

## Setup & Installation

1. **Clone the Repository:**
   ```sh
   git clone <your-repo-url>
   cd <your-project-folder>
   ```

2. **Copy Environment File:**
   ```sh
   cp .env.example .env
   ```

3. **Update `.env` File:**
   Ensure the database configuration matches your Docker Compose setup:
   ```env
   DB_CONNECTION=mysql
   DB_HOST=mysql  # Service name in docker-compose.yml
   DB_PORT=3306
   DB_DATABASE=your_database_name
   DB_USERNAME=your_db_user
   DB_PASSWORD=your_db_password
   ```

4. **Start Docker Containers:**
   ```sh
   docker-compose up -d
   ```

5. **Run Migrations:**
   ```sh
   docker exec -it <laravel_container_id> bash
   php artisan migrate --seed
   ```

6. **Generate App Key:**
   ```sh
   php artisan key:generate
   ```

## API Endpoints

### **1. User Registration**
**Endpoint:** `POST /api/register`
```json
{
  "name": "TestUser",
  "email": "testuser@laravel.com",
  "password": "password",
  "password_confirmation": "password"
}
```

### **2. User Login**
**Endpoint:** `POST /api/login`
```json
{
  "email": "testuser@laravel.com",
  "password": "password"
}
```
**Response:**
```json
{
  "token": "your_sanctum_token"
}
```

### **3. Post Blog Data**
**Endpoint:** `POST /api/blogs`
**Headers:**
- Authorization: Bearer `your_sanctum_token`
- Accept: application/json

**Request Body:**
```json
{
  "title": "My First Blog",
  "content": "This is the content of my first blog post."
}
```

### **4. Get Blog Data**
**Endpoint:** `GET /api/blogs`
**Headers:**
- Authorization: Bearer `your_sanctum_token`

### **5. Get User Data**
**Endpoint:** `GET /api/user`
**Headers:**
- Authorization: Bearer `your_sanctum_token`

## Running Tests
Run the tests inside the Laravel container:
```sh
php artisan test
```

## Stopping Containers
To stop the Docker containers:
```sh
docker-compose down
```

## License
This project is open-source and available under the MIT License.

