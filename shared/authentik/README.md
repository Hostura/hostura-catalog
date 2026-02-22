# Authentik

Open-source identity provider with SSO, MFA, and user management.

## Overview

Authentik provides centralized authentication for all Hostura applications:

- **Single Sign-On (SSO)** via SAML, OAuth2, OIDC, LDAP
- **Multi-Factor Authentication (MFA)**
- **User management** and self-service
- **Application proxy** for legacy apps

## Requirements

- PostgreSQL (shared or dedicated)
- Traefik running for HTTPS

## Configuration

| Variable | Description | Required |
|----------|-------------|----------|
| `AUTHENTIK_SECRET_KEY` | Secret key for encryption | Yes (auto-generated) |
| `AUTHENTIK_BOOTSTRAP_PASSWORD` | Initial admin password | Yes |
| `AUTHENTIK_BOOTSTRAP_EMAIL` | Admin email address | Yes |
| `AUTHENTIK_DB_PASSWORD` | PostgreSQL password | Yes (auto-generated) |

## Components

| Service | Container | Description |
|---------|-----------|-------------|
| Server | `hostura-authentik-server` | Web interface and API |
| Worker | `hostura-authentik-worker` | Background tasks |
| Redis | `hostura-authentik-redis` | Cache and message broker |

## Access

The web interface is available at `https://auth.{HOSTURA_DOMAIN}`.

Default admin login:
- **Username:** `akadmin`
- **Password:** Value of `AUTHENTIK_BOOTSTRAP_PASSWORD`

## Database

Authentik uses PostgreSQL. By default, it connects to the shared `hostura-postgres` instance.

The database and user are created automatically:
- **Database:** `authentik`
- **User:** `authentik`

## Integration with Applications

To protect an application with Authentik:

1. Create an application in Authentik admin
2. Create a provider (OAuth2/OIDC, SAML, or Proxy)
3. Configure the application to use Authentik

### OAuth2/OIDC Example

```yaml
environment:
  OAUTH_CLIENT_ID: "your-client-id"
  OAUTH_CLIENT_SECRET: "your-client-secret"
  OAUTH_AUTHORIZATION_URL: "https://auth.${HOSTURA_DOMAIN}/application/o/authorize/"
  OAUTH_TOKEN_URL: "https://auth.${HOSTURA_DOMAIN}/application/o/token/"
  OAUTH_USERINFO_URL: "https://auth.${HOSTURA_DOMAIN}/application/o/userinfo/"
```

## Links

- [Website](https://goauthentik.io)
- [Documentation](https://docs.goauthentik.io)
- [GitHub](https://github.com/goauthentik/authentik)
