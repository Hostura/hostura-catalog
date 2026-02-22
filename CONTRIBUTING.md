# 🤝 Contribution Guide

Thank you for contributing to the Hostura catalog!

## Required files

Each application must contain:

| File | Required | Description |
| ------ | ---------- | ------------- |
| `docker-compose.yml` | ✅ | Docker Compose configuration |
| `config.yml` | ✅ | Metadata and variables (see schema) |
| `README.md` | ✅ | App documentation |
| `logo.svg` or `logo.png` | ❌ | Application logo |

## config.yml format

The `config.yml` file must comply with the [schema](schema/app.schema.yml).

```yaml
name: "App name"
description: "Short description"
version: "1.0.0"
website: "https://..."
maintainer: "your-username"
categories:
  - category1
  - category2

variables:
  - name: VAR_NAME
    label: "Display label"
    required: true
    default: "value"
    secret: false

traefik:
  subdomain: app
  port: 8080
  auth: true

backup:
  volumes:
    - volume_name
```

## Best practices

### Docker Compose

- Use official or actively maintained images
- Always specify an image version (not `latest`)
- Prefer named volumes over bind mounts
- Do not expose ports directly (Traefik handles this)
- Use the `traefik` network for web apps

### Variables

- Prefix variables with the app name: `VAULTWARDEN_ADMIN_TOKEN`
- Mark `secret: true` for passwords and tokens
- Provide sensible default values when possible

### Security

- Never include hardcoded credentials
- Document required permissions
- Indicate if the app requires privileged access

## Validation

Before submitting, verify that:

- [ ] `config.yml` complies with the schema
- [ ] `docker-compose.yml` is valid (`docker compose config`)
- [ ] The README documents installation and configuration
- [ ] Sensitive variables are marked `secret: true`

## Available categories

- `cloud` - Cloud storage, sync
- `communication` - Chat, email, video
- `development` - Dev tools, CI/CD
- `media` - Photos, music
- `streaming` - Video/audio streaming
- `monitoring` - Monitoring, alerts
- `productivity` - Notes, wikis, projects
- `security` - Passwords, VPN, auth
- `storage` - Files, backups
- `other` - Miscellaneous
