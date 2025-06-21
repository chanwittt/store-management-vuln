# Store Management Demo

This is a simple demo application consisting of a web frontend, a REST API and a MySQL database. It allows basic management of inventory, promotions, employees and customers.

## Features

- JWT based authentication
- Inventory and promotion management
- Employee and customer management
- Frontend built with HTML and Tailwind CSS
- Backend built with Express.js
- MySQL database

## Setup

1. Install dependencies (requires internet access):
   ```bash
   npm install
   ```
2. Set up a MySQL database and update the environment variables `DB_HOST`, `DB_USER`, `DB_PASS`, and `DB_NAME` as needed.
3. Start the server:
   ```bash
   npm start
   ```
4. Open `http://localhost:3000/login.html` in your browser to use the app.

## Using Docker Compose

You can also run the application using Docker Compose. This setup builds
separate containers for the backend API, the frontend served by Nginx and the
MySQL database. Make sure Docker and Docker Compose are installed and then run:

```bash
docker compose up --build
```

The web application will be available at
`http://localhost:8080/login.html` and the API will listen on
`http://localhost:3000`. The MySQL instance will continue to listen on
`localhost:3306`.

This project is intended for demonstration purposes only.
