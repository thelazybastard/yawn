# Yawn

Timer in your terminal.

## Downloads

Pre-built binaries for Windows, macOS, and Linux are available on the [Releases](https://github.com/thelazybastard/yawn/releases) page.

### Download and Use

1. Navigate to the [Releases](https://github.com/thelazybastard/yawn/releases) page
2. Download the binary for your operating system:
   - **Windows**: `yawn-windows.exe`
   - **macOS**: `yawn-macos` 
   - **Linux**: `yawn-linux`
3. Make the binary executable (macOS/Linux only):
   ```bash
   chmod +x yawn-*
   ```
4. Add it to your `PATH` for system-wide access:
   - **macOS/Linux**: Move to `/usr/local/bin/` and rename it:
     ```bash
     mv yawn-macos /usr/local/bin/yawn
     # or for Linux:
     mv yawn-linux /usr/local/bin/yawn
     ```
   - **Windows**: Move to your desired location and add that directory to your `PATH` environment variable, or rename to `yawn.exe`

## Usage

This is a simple timer that will notify you after a specified number of minutes.

```bash
yawn <start> <minutes>
```

## License

MIT

