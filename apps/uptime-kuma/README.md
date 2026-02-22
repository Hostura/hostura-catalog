# Uptime Kuma

Self-hosted uptime monitoring tool with a modern interface.

## Description

Uptime Kuma is a self-hosted alternative to services like UptimeRobot. It allows you to monitor the availability of your services and get alerts when issues arise.

## Features

- ✅ HTTP(s), TCP, DNS, Docker, Steam monitoring, etc.
- ✅ Modern and responsive interface
- ✅ Public status pages
- ✅ Multi-channel notifications (90+ integrations)
- ✅ SSL certificate monitoring
- ✅ Multi-user

## Configuration

| Variable | Description | Default |
| ---------- | ------------- | --------- |
| `UPTIME_KUMA_DISABLE_FRAME_SAMEORIGIN` | Allow iframe embedding | `false` |

## Access

- **Dashboard**: `https://status.your-domain.tld`
- **Public status page**: Configurable in the interface

## Post-installation

1. Access the interface
2. Create your administrator account
3. Add your first monitors
4. Configure notifications (Discord, Telegram, Email, etc.)
5. (Optional) Create a public status page

## Supported monitoring types

- HTTP(s) - Websites and APIs
- TCP Port - Network services
- Ping - Server availability
- DNS - DNS resolution
- Docker - Container status
- Steam Game Server
- And more...

## Notifications

Over 90 supported services, including:

- Discord / Slack / Telegram
- Email (SMTP)
- Pushover / Pushbullet
- Custom Webhook
- PagerDuty / Opsgenie

## Resources

- [Documentation](https://github.com/louislam/uptime-kuma/wiki)
- [GitHub](https://github.com/louislam/uptime-kuma)
- [Demo](https://demo.uptime.kuma.pet)
