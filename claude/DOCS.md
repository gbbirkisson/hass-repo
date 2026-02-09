# Home Assistant Add-on: Claude

## Configuration

**Note**: The add-on requires the "Show in sidebar" option to be enabled for easy access to the terminal.

### Option: `font_size`

The font size for the terminal interface.

- **Default**: `30`
- **Type**: `integer`

### Option: `ttyd_loglevel`

The logging level for the `ttyd` terminal server.

- **Default**: `8`
- **Type**: `integer`

## Startup Scripts

To customize the environment (e.g., install packages, set environment variables), you can place shell scripts in the following directory within your Home Assistant configuration folder:

`/config/claude/startup/`

Any files ending in `.sh` in this directory will be **sourced** (executed in the current context) before the main application starts. This allows you to export variables that will be visible to the main process.

**Example script** (`/config/claude/startup/init.sh`):

```bash
#!/bin/bash
export MY_CUSTOM_VAR="hello"
```

## Storage & Persistence

### Session Data

The add-on persists user data (including login state and history) in the add-on's `/data` directory. This directory is used as the `HOME` directory for the container.

### Project Files

A directory is created at `/config/claude`. This path is mapped to the `/config` directory of your Home Assistant instance.
- **Internal Path**: `/config/claude`
- **Home Assistant Path**: `/config/claude`

This is the recommended location for your project files, as it ensures they are backed up with Home Assistant and accessible by other add-ons (like VS Code or File Editor).
