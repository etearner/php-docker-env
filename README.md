# PHP + Node.js Docker Environment

This project provides a Docker-based development environment for a PHP backend with a Node.js frontend. It includes PostgreSQL, PHP-FPM, Nginx, and Node.js services, all connected via a custom Docker network.

---

## Table of Contents
- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Environment Variables](#environment-variables)
- [Setup](#setup)
- [Usage](#usage)
- [Networking](#networking)
- [Ports](#ports)
- [Volumes](#volumes)
- [License](#license)

---

## Prerequisites
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

---

## Project Structure
```
.
├── compose.yml
├── services/
│   ├── pgsql/
│   │   └── Dockerfile
│   ├── php/
│   │   └── Dockerfile
│   ├── nginx/
│   │   ├── conf/
│   │   ├── ssl/
│   │   └── Dockerfile
│   └── node/
│       └── Dockerfile
├── var/
│   ├── pgsql/
│   │   ├── data/
│   │   └── exchange/
│   └── log/
│       └── webserver/
└── README.md
```

---

## Environment Variables
Create a `.env` file in the root directory with the following variables:

```ini
app_name=your_app_name
db_name=your_db_name
db_user=your_db_user
db_root_password=your_db_root_password
db_test_name=your_test_db_name
db_test_user=your_test_db_user
db_test_user_password=your_test_db_password
timezone=Europe/Paris
api_path=./path/to/your/php/api
app_path=./path/to/your/node/app
```

---

## Setup

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd <project-directory>
   ```

2. **Create `.env` File**:
   ```bash
   cp .env.dist .env
   ```
   Update the `.env` file with your configuration.

3. **Build and Start Containers**:
   ```bash
   docker compose up -d --build --remove-orphans -V
   ```

---

## Usage

### Accessing Services
- **PHP API**: Accessible via `http://localhost` or `https://localhost` (if SSL is configured)
- **Node.js App**: Accessible via `http://localhost:3000`
- **PostgreSQL**: Accessible on port `5432` (use the credentials from `.env`)

### Logs
- **Nginx Logs**: `./var/log/webserver/`
- **PostgreSQL Data**: `./var/pgsql/data/`

### Stopping Services
```bash
docker compose down
```

### Restarting Services
```bash
docker compose restart
```

---

## Networking
All services are connected to a custom Docker network named `lck_network`.

---

## Ports
| Service     | Host Port | Container Port |
|-------------|-----------|----------------|
| Nginx       | 80        | 80             |
| Nginx       | 443       | 443            |
| Node.js     | 3000      | 3000           |
| PostgreSQL  | 5432      | 5432           |

---

## Volumes
- **PostgreSQL Data**: Persisted in `./var/pgsql/data/`
- **Nginx Logs**: Persisted in `./var/log/webserver/`
- **PHP API**: Mounted from `${api_path}`
- **Node.js App**: Mounted from `${app_path}`

---

## License
This project is licensed under the MIT License.
