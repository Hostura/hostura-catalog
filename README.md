# Hostura Catalog

Docker application catalog for Hostura.

## Structure

```txt
hostura-catalog/
├── apps/                        # Available applications
│   └── {app-name}/
│       ├── docker-compose.yml   # Docker configuration
│       ├── config.yml           # App metadata
│       └── README.md            # Documentation
├── shared/                      # Shared services (DB, cache)
├── templates/                   # Reusable snippets
├── schema/
│   └── app.schema.yml           # Validation schema
├── CONTRIBUTING.md
├── LICENSE
└── README.md
```

## Shared vs Dedicated Services

Each application can use:

| Type | Advantage | When to use |
| ------------ | ----------- | ------------- |
| **Shared** | Less resources | Lightweight apps, personal use |
| **Dedicated** | Full isolation | Production, sensitive data |

The choice is made via an environment variable (`DB_MODE=shared|dedicated`).

## Adding an Application

1. Create `apps/{name}/docker-compose.yml`
2. Create `apps/{name}/config.yml` (see schema)
3. Add documentation in `apps/{name}/README.md`
4. Test locally with `docker compose up`
5. Create a Pull Request

## Available Applications

| App | Category | Description |
| ----- | ---------- | ------------- |
| vaultwarden | security | Password manager |
| uptime-kuma | monitoring | Uptime monitoring |
| jellyfin | media | Media server |
| wordpress | productivity | CMS / Blog |

## Related Repositories

| Repository | Description |
| ------------ | ------------- |
| [hostura](https://github.com/Hostura/hostura) | Core binary (Rust CLI/API) |
| [stack](https://github.com/Hostura/stack) | Infrastructure Docker Compose configs |

## License

AGPL-3.0 – See [LICENSE](LICENSE)
