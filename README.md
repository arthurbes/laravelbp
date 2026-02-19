🚀 Modern Laravel 12 + Vue.js (Inertia) Boilerplate
===================================================

This is an opinionated and **clean** boilerplate designed for SaaS applications and high-performance systems. It focuses on a clear separation between the backend engine (Laravel) and the user experience (Vue 3 via Inertia.js), utilizing a modular and customized Docker environment.

## 🛠 Tech Stack

| Technology | Purpose |
| :--- | :--- |
| **Laravel 12** | Backend Framework (Minimalist Skeleton) |
| **Vue 3 + Vite** | Reactive Frontend with Ultra-fast Build |
| **Inertia.js** | SPA bridge without the complexity of pure APIs |
| **Docker (Alpine)** | Isolated and lightweight environment (Nginx, PHP 8.3+, MariaDB, Redis) |
| **Tailwind CSS** | Utility-first framework for custom UI |
| **Pest** | Elegant and productive testing framework |
| **PHPStan** | Static analysis for type safety (Senior Level) |

---

## 🏗 Architecture & Docker

Unlike the standard setup, this boilerplate separates infrastructure configurations from the source code, facilitating maintenance and ensuring maximum performance by isolating the PHP runtime, the Nginx server, and the Node build process.

### Folder Structure
```text
.
├── docker/             # Infrastructure configurations (Nginx, Dockerfiles)
├── src/                # Laravel application source code
│   ├── app/            # Logic (Models, Services, Actions)
│   ├── resources/js/   # Frontend (Vue 3 Components)
│   └── tests/          # Tests with Pest
├── .github/workflows/  # CI/CD Automation (Pint, PHPStan, Pest)
└── docker-compose.yml  # Environment orchestration
```

---

## 🚦 Getting Started

### Prerequisites
*   Docker & Docker Compose (V2 recommended) installed.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone git@github.com:arthurbes/laravelbp.git
    cd laravelbp
    ```

2.  **Prepare environment variables:**
    ```bash
    cp .env.example .env          # Docker and Laravel variables
    ```

3.  **Start the Docker environment:**
    ```bash
    docker compose up -d --build
    ```
    *The `laravelbp-app` container will automatically run `composer install` and `migrations` on the first boot. The `node` container automatically runs `npm install` and `npm run dev`.*

4.  **Access the application:**
    *   **Web:** [http://localhost:8080](http://localhost:8080)
    *   **Vite HMR:** [http://localhost:5173](http://localhost:5173)

---

## 🛡 Code Quality (QA)

This project comes with pre-configured **GitHub Actions**, ensuring validations on every 'push'/'pull request' for the `main`, `develop`, and `feature/*` branches.

*   **Linting:** Runs Laravel Pint to maintain PSR-12 style.
*   **Static Analysis:** Runs PHPStan to prevent typing bugs during development.
*   **Tests:** Runs the unit and functional test suite via Pest.

To run checks locally via Docker:

```bash
# Style (Pint)
docker exec -it laravelbp-app ./vendor/bin/pint

# Static Analysis (PHPStan)
docker exec -it laravelbp-app ./vendor/bin/phpstan analyse

# Tests (Pest)
docker exec -it laravelbp-app php artisan test
```

---

## 📈 Roadmap
- [x] Modular Docker (PHP-FPM, Nginx, Node with PHP)
- [x] Inertia + Vue 3 Integration
- [x] GitHub Actions (Full CI)
- [ ] Filament Admin Integration
- [ ] Multi-tenancy support

**Developed and maintained by Arthur Batista** - Senior Developer | Adobe Commerce & Laravel Enthusiast.