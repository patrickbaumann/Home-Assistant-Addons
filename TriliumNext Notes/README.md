![128x128](https://github.com/user-attachments/assets/7b39fd05-4c0d-46f3-8283-117e2093f3e3)

# TriliumNext Notes for Home Assistant

## About

This addon installs TriliumNext Notes, a hierarchical note-taking application focused on building a personal knowledge base. Trilium offers comprehensive note-taking capabilities with Markdown support, encryption, synchronization, and many other features.


## Installation

1. Add repository to your Home Assistant addon repositories:


   [![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%patrickbaumann%2FHome-Assistant-Addons)
   - Click **Add**

3. Find the "TriliumNext Notes" addon and install it.

4. Start the addon.


## Initial Configuration

When running for the first time, the stup will start. Please note:

- **Important**: During initial setup, TriliumNext Notes will display the IP address and port of Home Assistant. This is normal behavior caused by Home Assistant's ingress system.

- Ignore the displayed URL and instead use the Home Assistant interface to access TriliumNext Notes (via the addon or sidebar).

- Create a user for and set a secure password.

## Configuration Options

| Option | Description | Default |
|--------|-------------|---------|
| `timezone` | Timezone for the addon | `Europe/Berlin` |
| `log_level` | Log level (trace/debug/info/warning/error) | `info` |
| `https_only` | Force HTTPS connections only | `false` |

## Data Storage

All data is stored in the `/home/node/trilium-data` directory. This directory is automatically mapped to your Home Assistant host and persists even if you reinstall the addon.

## Backup

It's recommended to create regular backups using the Home Assistant backup function. These will include your Notes data.

You can also create manual backups within TriliumNext Notes under **Options** → **Backup**.

## Known Issues

### URL Path in TriliumNext Notes Interface

During initial setup and in some dialogs, TriliumNext Notes might show the incorrect URL (with Home Assistant host:port instead of the ingress path). This is known behavior and doesn't affect functionality.


## Troubleshooting

### Addon won't Start

- Check the addon logs under **Settings** → **Add-ons** → **TriliumNext Notes** → **Logs**
- Ensure required ports aren't being used by other services

### Web Interface Doesn't Load Completely

- Clear your browser cache and try again
- Check the browser console for JavaScript errors
- Ensure your browser is up to date

## Support

For issues or questions related to the addon, please create an issue in the [GitHub](https://github.com/patrickbaumann/TriliumNext-Home-Assistant-Addon) repository.

## License

This addon is licensed under the [MIT License](LICENSE).

TriliumNext Notes itself is licensed under the [GNU AFFERO GENERAL PUBLIC LICENSE](https://github.com/TriliumNext/Notes/blob/develop/LICENSE).
