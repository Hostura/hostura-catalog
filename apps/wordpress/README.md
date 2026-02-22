# WordPress

The world's most popular CMS for building websites and blogs.

## Description

WordPress powers over 40% of the web. Easy to use, extensible via thousands of plugins and themes.

## Features

- ✅ Modern block editor (Gutenberg)
- ✅ Thousands of themes and plugins
- ✅ Multi-site
- ✅ REST API
- ✅ SEO-friendly

## Database mode

At installation, you can choose:

### Shared mode (recommended)

Uses the shared Hostura MySQL instance.

- ✅ Resource savings
- ✅ Centralized backups
- ✅ Simplified maintenance

### Dedicated mode

Installs a MySQL container dedicated to WordPress.

- ✅ Complete isolation
- ✅ Specific configuration possible
- ❌ Consumes more resources

## Configuration

| Variable | Description | Default |
| ---------- | ------------- | --------- |
| `WORDPRESS_DB_PASSWORD` | Database password | (required) |
| `WORDPRESS_TABLE_PREFIX` | Table prefix | `wp_` |
| `WORDPRESS_DEBUG` | Debug mode | `false` |

## Access

- **Site**: `https://www.your-domain.tld`
- **Admin**: `https://www.your-domain.tld/wp-admin`

## Post-installation

1. Access the site URL
2. Follow the WordPress installation wizard
3. Create your administrator account
4. Configure your site

## Recommended plugins

- **Security**: Wordfence, Sucuri
- **Cache**: W3 Total Cache, WP Super Cache
- **SEO**: Yoast SEO, Rank Math
- **Backup**: UpdraftPlus

## Resources

- [Documentation](https://developer.wordpress.org/)
- [WordPress.org](https://wordpress.org)
- [Plugins](https://wordpress.org/plugins/)
- [Themes](https://wordpress.org/themes/)
