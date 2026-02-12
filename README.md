# go-download

This is a simple script that outputs the URL to the latest archive build of Go
for the local OS & architectre.

To use:
```
curl -fsSL https://raw.githubusercontent.com/FGasper/go-download/url.sh | sh | xargs curl -fsSL | tar -xvzf -
```

This will:
- download `url.sh`
- execute that script
- use the script’s output as an argument to `curl`
  - This downloads the Go archive.
- unpack the Go archive in the current directory
