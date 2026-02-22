# Catalog Structure Specification

Technical reference for the Hostura CLI (Rust) to parse the application catalog.

## Directory Structure

```txt
hostura-catalog/
├── apps/                          # ← Main entry point
│   └── {app-name}/                # kebab-case (e.g., uptime-kuma)
│       ├── config.yml             # REQUIRED - Parsable metadata
│       ├── docker-compose.yml     # REQUIRED - Docker config
│       └── README.md              # Documentation (optional for CLI)
├── shared/                        # Shared services (mysql, postgres)
│   └── {service-name}/
│       ├── config.yml
│       └── docker-compose.yml
└── schema/
    └── app.schema.yml             # JSON Schema for validation
```

## config.yml Format

### Required Fields

```yaml
name: string              # "Vaultwarden"
description: string       # 10-200 chars
version: string           # Pattern: ^[0-9]+\.[0-9]+(\.[0-9]+)?(-[a-zA-Z0-9]+)?$
maintainer: string        # GitHub username
categories: [string]      # 1-5 items, from valid enum
traefik:
  subdomain: string       # Pattern: ^[a-z][a-z0-9-]*$
  port: integer           # 1-65535
```

### Optional Fields

```yaml
logo: string              # "logo.svg" (file may not exist)
website: string           # URI
documentation: string     # URI
variables: [...]          # Array of variable objects
database: {...}           # DB config if needed
backup: {...}
resources: {...}
notes: string
type: string              # Only for shared services: "shared-service"
```

## Valid Categories (enum)

```txt
cloud
communication
development
media
monitoring
networking
productivity
security
storage
streaming
other
```

## Parsing Guidelines

| Aspect | Convention |
| -------- | ------------ |
| App directories | `apps/*/` only (ignore other folders) |
| Required file | `config.yml` - if missing, skip the app |
| Encoding | UTF-8 |
| Language | English |
| Docker images | Always versioned (never `latest`) |
| Shared services | `shared/*/` with `type: shared-service` in config |

## Differentiating Apps vs Shared Services

```yaml
# In shared/mysql/config.yml
type: shared-service      # ← This field indicates a shared service

# In apps/*/config.yml
# No "type" field = normal application
```

## Files to Ignore

- `README.md` (documentation only)
- `CONTRIBUTING.md`, `AGENTS.md`
- `templates/` (reusable snippets, not apps)
- `schema/` (for validation only)
- Any `.bak`, `.tmp` files

## Variable Object Structure

When parsing `variables` array:

```yaml
variables:
  - name: string          # REQUIRED - UPPER_SNAKE_CASE, pattern: ^[A-Z][A-Z0-9_]*$
    label: string         # REQUIRED - Display label
    description: string   # Optional
    required: boolean     # Default: false
    default: string       # Optional default value
    secret: boolean       # Default: false - hide value in UI
```

## Database Object Structure

When parsing `database` object:

```yaml
database:
  type: string            # mysql | mariadb | postgres | mongodb | none
  version: string         # e.g., ">=8.0"
  default_mode: string    # shared | dedicated (default: shared)
  allow_dedicated: bool   # default: true
  allow_shared: bool      # default: true
  name: string            # DB name to create
  user: string            # Dedicated user
  env_mapping:            # Env var mapping
    host: string
    port: string
    name: string
    user: string
    password: string
```

## Traefik Object Structure

```yaml
traefik:
  subdomain: string       # REQUIRED
  port: integer           # REQUIRED
  auth: boolean           # Default: false - protect with Authentik
  middlewares: [string]   # Optional additional middlewares
  enabled: boolean        # Only for shared services (false = internal only)
```

## Example: Minimal Valid config.yml

```yaml
name: MyApp
description: "A simple application for demonstration"
version: "1.0.0"
maintainer: "username"
categories:
  - other

traefik:
  subdomain: myapp
  port: 8080
```
