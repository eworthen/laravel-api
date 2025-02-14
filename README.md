Laravel 11 API with Sanctum & Docker

This is a Laravel 11 API project using Sanctum for authentication and MySQL running inside Docker containers.

Prerequisites

Docker & Docker Compose installed

Composer installed

Postman or any API testing tool

Setup & Installation

Clone the Repository:

git clone <your-repo-url>
cd <your-project-folder>

Copy Environment File:

cp .env.example .env

Update .env File:
Ensure the database configuration matches your Docker Compose setup:

DB_CONNECTION=mysql
DB_HOST=mysql  # Service name in docker-compose.yml
DB_PORT=3306
DB_DATABASE=your_database_name
DB_USERNAME=your_db_user
DB_PASSWORD=your_db_password

Start Docker Containers:

docker-compose up --build -d

Run Migrations:

docker exec -it <laravel_container_id> bash
php artisan migrate --seed

Generate App Key:

php artisan key:generate

API Endpoints

1. User Registration

Endpoint: POST /api/register

{
  "name": "TestUser",
  "email": "testuser@laravel.com",
  "password": "password",
  "password_confirmation": "password"
}

2. User Login

Endpoint: POST /api/login

{
  "email": "testuser@laravel.com",
  "password": "password"
}

Response:

{
  "token": "your_sanctum_token"
}

3. Post Blog Data

Endpoint: POST /api/blogs
Headers:

Authorization: Bearer your_sanctum_token

Accept: application/json

Request Body:

{
  "title": "My First Blog",
  "content": "This is the content of my first blog post."
}

4. Get Blog Data

Endpoint: GET /api/blogs
Headers:

Authorization: Bearer your_sanctum_token

5. Get User Data

Endpoint: GET /api/user
Headers:

Authorization: Bearer your_sanctum_token

Running Tests

Run the tests inside the Laravel container:

php artisan test

Stopping Containers

To stop the Docker containers:

docker-compose down

License

This project is open-source and available under the MIT License.