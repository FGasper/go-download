# go-download

This is a simple script that outputs the URL to the latest archive build of Go
for the local OS & architecture.

To use:
```
curl -fsSL https://raw.githubusercontent.com/FGasper/go-download/refs/heads/main/url.sh | sh | xargs curl -fsSL | tar -xvzf -
```

(Besides `curl`, the script itself needs `jq` to run.)

This will:
- download `url.sh` & execute it (without saving it to disk)
- use the script’s output as an argument to `curl`
  - This downloads the Go archive.
- unpack the Go archive (itself not saved to disk) in the current directory

This is useful in CI on OSes whose package repositories provide a Go
that’s too old for the code you want to test.
