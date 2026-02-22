# Jellyfin

Free software media server for streaming your movies, series, music and photos.

## Description

Jellyfin is a free alternative to Plex and Emby. Completely free and without restrictions, it allows you to manage and stream your media collection.

## Features

- ✅ Stream movies, series, music, photos
- ✅ Real-time transcoding
- ✅ GPU support (Intel QSV, NVIDIA NVENC, AMD AMF)
- ✅ Mobile and TV applications
- ✅ Multi-user with parental controls
- ✅ Automatic metadata
- ✅ Live TV & DVR (with compatible tuner)
- ✅ 100% free and open source

## Configuration

| Variable | Description | Default |
| ---------- | ------------- | --------- |
| `JELLYFIN_MEDIA_PATH` | Path to your media on the host | `/srv/media` |
| `JELLYFIN_PublishedServerUrl` | Public server URL | Auto |

## Access

- **Web interface**: `https://media.your-domain.tld`

## Post-installation

1. Access the web interface
2. Follow the setup wizard
3. Create your administrator user
4. Add your libraries (Movies, Series, Music...)
5. Start the metadata scan

## Recommended media structure

```txt
/srv/media/
├── movies/
│   ├── Movie (2024)/
│   │   └── Movie (2024).mkv
├── series/
│   ├── Series/
│   │   ├── Season 01/
│   │   │   ├── Series - S01E01.mkv
│   │   │   └── Series - S01E02.mkv
├── music/
│   ├── Artist/
│   │   ├── Album/
│   │   │   ├── 01 - Track.flac
└── photos/
```

## GPU Transcoding

### Intel QSV

Uncomment in `docker-compose.yml`:

```yaml
devices:
  - /dev/dri:/dev/dri
```

### NVIDIA

Requires nvidia-container-toolkit. Add:

```yaml
runtime: nvidia
environment:
  - NVIDIA_VISIBLE_DEVICES=all
```

## Clients

- [Web](https://jellyfin.org)
- [Android / iOS](https://jellyfin.org/downloads/clients/)
- [Android TV / Fire TV](https://jellyfin.org/downloads/clients/)
- [Roku](https://jellyfin.org/downloads/clients/)
- [Kodi (plugin)](https://jellyfin.org/downloads/clients/)

## Resources

- [Documentation](https://jellyfin.org/docs/)
- [GitHub](https://github.com/jellyfin/jellyfin)
- [Reddit](https://reddit.com/r/jellyfin)
