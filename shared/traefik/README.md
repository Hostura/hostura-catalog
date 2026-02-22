# Traefik

Cloud-native reverse proxy and load balancer with automatic HTTPS.

## Overview

Traefik is the central reverse proxy for all Hostura applications. It handles:

- **Automatic HTTPS** via Let's Encrypt
- **HTTP to HTTPS redirection**
- **Dynamic routing** based on Docker labels
- **Dashboard** for monitoring

## Requirements

- Port 80 and 443 available on the host
- Docker socket access
- A valid domain with DNS pointing to the server

## Configuration

| Variable | Description | Required |
|----------|-------------|----------|
| `HOSTURA_DOMAIN` | Primary domain (e.g., `example.com`) | Yes |
| `HOSTURA_ACME_EMAIL` | Email for Let's Encrypt certificates | Yes |
| `TRAEFIK_DASHBOARD_AUTH` | Dashboard basic auth (htpasswd format) | No |

## Dashboard Access

The dashboard is available at `https://traefik.{HOSTURA_DOMAIN}`.

To generate basic auth credentials:

```bash
# Using htpasswd
htpasswd -nb admin your_password

# Using docker
docker run --rm httpd:alpine htpasswd -nb admin your_password
```

## Network

Traefik uses the `hostura` external network. This network is created by `hostura init`.

## Ports

| Port | Description |
|------|-------------|
| 80 | HTTP (redirects to HTTPS) |
| 443 | HTTPS |
| 8080 | Dashboard (internal, exposed via Traefik itself) |

## Links

- [Website](https://traefik.io)
- [Documentation](https://doc.traefik.io/traefik/)
- [GitHub](https://github.com/traefik/traefik)
