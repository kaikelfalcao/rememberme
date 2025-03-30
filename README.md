# Reminder Tool
This project is a simple reminder tool written in Go. It allows users to set a reminder message that will be displayed after a specified delay.

## Table of Contents
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)
  - [Command-Line Flags](#command-line-flags)
  - [Examples](#examples)
- [Uninstallation](#uninstallation)
- [License](#license)


## Features
- Set a custom reminder message.
- Specify a delay before the reminder is shown.
- Runs in the background and sends a desktop notification.

## Prerequisites
- Go 1.18 or higher installed on your system.
- `make` utility installed.

## Installation

### Option 1: Download Pre-Built Binaries (Recommended)

1. Go to the [Releases](https://github.com/kaikelfalcao/rememberme/releases) page.
2. Download the binary.
3. Place the binary in a directory included in your system's `PATH` or run it directly.

### Option 2: Build from Source

1. Clone the repository:
   ```
   git clone https://github.com/kaikelfalcao/rememberme.git
   cd rememberme
   ```

2. Build the application:
   ```bash
   make build
   ```

3. Install the application:
   ```bash
   make install
   ```

Alternatively, you can use:
   ```bash
   make all
   ```

## Usage

You can run the reminder tool from the command line with the following syntax:

```bash
rememberme --message="Your reminder message" --delay="10s"
```

To see all available options:
```bash
rememberme -h
```

### Command-Line Flags

- `--message`: The message to display after the delay (default: "Reminder").
- `--delay`: The delay before displaying the message (e.g., 10s, 1m, 1h; default: 10 seconds).

### Examples

1. Set a reminder that says "Time to take a break!" after 5 minutes:
   ```
   ./rememberme --message "Time to take a break!" --delay 5m
   ```

2. Use the default message with a 30-second delay:
   ```
   ./rememberme --delay 30s
   ```

3. Display help information:
   ```
   ./rememberme -h
   ```

## Uninstallation

To uninstall the application and clean up build artifacts, run:

```bash
make clean
```

This will:
- Remove the binary from the build directory (`bin/`).
- Remove the installed binary from `/usr/local/bin` (or the specified `INSTALL_DIR`).

## License

This project is licensed under the MIT License. See the LICENSE file for more details.
