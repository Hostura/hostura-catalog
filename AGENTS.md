# AGENTS.md – Hostura Catalog

## Project Overview

**hostura-catalog** is the community-maintained application catalog for [Hostura](https://github.com/Hostura/hostura). It contains Docker app definitions ready to deploy via the Hostura CLI or UI.

**Repository:** <https://github.com/Hostura/hostura-catalog>  
**License:** MIT

## Repository Structure

```txt
hostura-catalog/
├── apps/                    # Application catalog
│   └── {app-name}/
│       ├── docker-compose.yml
│       ├── config.yml       # Metadata (REQUIRED)
│       └── README.md
├── shared/                  # Shared services (DB, cache)
├── templates/               # Reusable snippets
├── schema/                  # Validation schemas
├── README.md
├── CONTRIBUTING.md
└── AGENTS.md
```

## Rules for Adding an Application

### Required Files

1. **`config.yml`** - Must conform to `schema/app.schema.yml`
2. **`docker-compose.yml`** - Valid Docker Compose configuration
3. **`README.md`** - App documentation

### Naming Conventions

- App folder: `kebab-case` (e.g., `uptime-kuma`, `home-assistant`)
- Environment variables: `UPPER_SNAKE_CASE`, prefixed with app name (e.g., `VAULTWARDEN_ADMIN_TOKEN`)
- Traefik subdomain: short and memorable (e.g., `vault`, `status`, `media`)

### Docker Compose

- Always specify a precise image version (never `latest`)
- Use the external `traefik` network for web apps
- Do not expose ports directly (Traefik handles routing)
- Prefer named volumes over bind mounts
- Include standard Traefik labels (see `templates/traefik-labels.yml`)

### config.yml

Required fields:

- `name`, `description`, `version`, `maintainer`, `categories`
- `traefik.subdomain`, `traefik.port`

Recommended fields:

- `variables` with `label`, `required`, `default`, `secret`
- `backup.volumes` for persistent data

### Security

- Never include hardcoded credentials
- Mark sensitive variables with `secret: true`
- Use `${VAR:-default}` for default values in docker-compose
- Document any special permissions required

## Useful Commands

```bash
# Validate docker-compose
docker compose -f apps/{app}/docker-compose.yml config

# YAML linter
yamllint apps/{app}/config.yml
```

## Available Categories

- `cloud` - Cloud storage, sync
- `communication` - Chat, email, video
- `development` - Dev tools, CI/CD
- `media` - Photos, music
- `monitoring` - Monitoring, alerts
- `productivity` - Notes, wikis, projects
- `security` - Passwords, VPN, auth
- `storage` - Files, backups
- `streaming` - Video/audio streaming
- `other` - Miscellaneous

## Reference Examples

- [`apps/vaultwarden/`](apps/vaultwarden/) - Simple app without dependencies
- [`apps/jellyfin/`](apps/jellyfin/) - App with external bind mount
- [`apps/uptime-kuma/`](apps/uptime-kuma/) - Monitoring app

## Do NOT

- Create files outside the defined structure
- Modify `schema/app.schema.yml` without discussion
- Use `latest` as image tag
- Include sensitive data (tokens, passwords)
- Expose ports without going through Traefik

## Related Repositories

- **hostura** – Core binary (Rust CLI/API)
- **stack** – Infrastructure Docker Compose configs
