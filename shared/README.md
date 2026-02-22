# Hostura Shared Services

This folder contains shared database services managed by Hostura.

## How it works

When a catalog application requires a database, the administrator can choose:

1. **Shared mode** (recommended): Use the shared MySQL/PostgreSQL instance
   - Resource savings (single instance for all apps)
   - Centralized backups
   - Each app has its own database and user

2. **Dedicated mode**: The app installs its own database instance
   - Complete isolation
   - Specific version possible
   - More resources consumed

## Available services

### Core Services

| Service | Ports | Network | Description |
|---------|-------|---------|-------------|
| Traefik 2.11 | 80, 443, 8080 | hostura | Reverse proxy with automatic HTTPS |
| Authentik | 9000 | hostura | Identity provider (SSO, MFA) |

### Database Services

| Service | Internal port | Network | Description |
|---------|---------------|---------|-------------|
| MySQL 8 | 3306 | hostura-internal | Shared MySQL instance |
| PostgreSQL 16 | 5432 | hostura-internal | Shared PostgreSQL instance |

## Installation

These services are automatically installed by Hostura when the first app that needs them is deployed, or can be pre-installed.

## Access

Shared services are only accessible on the internal `hostura-internal` network. Apps connect to them via the service hostname (e.g., `hostura-mysql`, `hostura-postgres`).
