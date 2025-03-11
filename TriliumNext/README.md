# Trilium Notes for Home Assistant

## About

This addon installs Trilium Notes, a hierarchical note-taking application focused on building a personal knowledge base. Trilium offers comprehensive note-taking capabilities with Markdown support, encryption, synchronization, and many other features.



## Installation

1. Add repository to your Home Assistant addon repositories:
   - Navigate to **Settings** → **Add-ons** → **Add-on Store**
   - Click the three-dot menu in the top right
   - Select **Repositories**
   - Add this repository URL: `https://github.com/HyperCriSiS/TriliumNext-Home-Assistant-Addon`
   - Click **Add**

2. Find the "Trilium Notes" addon and install it.

3. Start the addon.


## Initial Configuration

When running for the first time, Trilium Notes will show a setup screen. Please note:

- **Important**: During initial setup, Trilium will display the IP address and port of Home Assistant. This is normal behavior caused by Home Assistant's ingress system.

- Ignore the displayed URL and instead use the Home Assistant interface to access Trilium (via the addon or sidebar).

- Create a user for Trilium and set a secure password.

## Configuration Options

| Option | Description | Default |
|--------|-------------|---------|
| `timezone` | Timezone for the addon | `Europe/Berlin` |
| `log_level` | Log level (trace/debug/info/warning/error) | `info` |
| `https_only` | Force HTTPS connections only | `false` |

## Data Storage

Trilium Notes stores all data in the `/home/node/trilium-data` directory. This directory is automatically mapped to your Home Assistant host and persists even if you reinstall the addon.

## Backup

It's recommended to create regular backups using the Home Assistant backup function. These will include your Trilium data.

You can also create manual backups within Trilium under **Options** → **Backup**.

## Known Issues

### URL Path in Trilium Interface

During initial setup and in some dialogs, Trilium might show the incorrect URL (with Home Assistant host:port instead of the ingress path). This is known behavior and doesn't affect functionality.

### Browser Compatibility

Trilium Notes works best with modern browsers. If you experience UI issues, please try using a different browser.

## Troubleshooting

### Addon Won't Start

- Check the addon logs under **Settings** → **Add-ons** → **Trilium Notes** → **Logs**
- Ensure required ports aren't being used by other services

### Web Interface Doesn't Load Completely

- Clear your browser cache and try again
- Check the browser console for JavaScript errors
- Ensure your browser is up to date

## Support

For issues or questions related to the addon, please create an issue in the [GitHub](https://github.com/HyperCriSiS/TriliumNext-Home-Assistant-Addon) repository.

## License

This addon is licensed under the [MIT License](LICENSE).

Trilium Notes itself is licensed under the [AGPL-3.0 License](https://github.com/triliumnext/trilium/blob/master/LICENSE).