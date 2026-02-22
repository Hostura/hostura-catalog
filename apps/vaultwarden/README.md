# Vaultwarden

Lightweight self-hosted Bitwarden-compatible server.

## Description

Vaultwarden is an alternative implementation of the Bitwarden server written in Rust. Much lighter than the official server, it is ideal for self-hosting.

## Features

- ✅ Compatible with all Bitwarden apps (mobile, desktop, extension)
- ✅ Organizations and password sharing
- ✅ 2FA authentication (TOTP, WebAuthn, Duo)
- ✅ Secure Send
- ✅ Admin interface

## Configuration

| Variable | Description | Default |
| ---------- | ------------- | --------- |
| `VAULTWARDEN_ADMIN_TOKEN` | Token for `/admin` (leave empty = disabled) | - |
| `VAULTWARDEN_SIGNUPS_ALLOWED` | Allow signups | `false` |
| `VAULTWARDEN_INVITATIONS_ALLOWED` | Allow invitations | `true` |
| `VAULTWARDEN_SHOW_PASSWORD_HINT` | Show password hints | `false` |

## Access

- **Web interface**: `https://vault.your-domain.tld`
- **Admin**: `https://vault.your-domain.tld/admin`

## Post-installation

1. Access the web interface
2. Create your user account
3. (Recommended) Disable signups via the admin panel
4. Install the Bitwarden browser extension and configure the server URL

## Compatible clients

- [Browser extension](https://bitwarden.com/download/)
- [iOS/Android mobile app](https://bitwarden.com/download/)
- [Desktop app](https://bitwarden.com/download/)
- [CLI](https://bitwarden.com/help/cli/)

## Resources

- [Official documentation](https://github.com/dani-garcia/vaultwarden/wiki)
- [GitHub](https://github.com/dani-garcia/vaultwarden)
