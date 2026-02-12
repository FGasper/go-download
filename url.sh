#!/bin/sh

set -o errexit

for dep in jq curl; do
    if ! command -v "$dep" >/dev/null 2>&1; then
        echo "Error: “${dep}” is not installed." >&2
        echo "Try: sudo dnf install -y ${dep}" >&2
        exit 1
    fi
done

full_list="$(curl 'https://go.dev/dl/?mode=json')"

OS="$(uname -o | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m | sed 's/x86_64/amd64/;s/aarch64/arm64/')"

filename=$(printf "%s" "$full_list" | jq -r ".[0].files[] | select(.kind==\"archive\" and .os==\"$OS\" and .arch==\"$ARCH\") | .filename")

if [ -z "$filename" ]; then
    echo "No download found for $OS on $ARCH!" >&2
    exit 1
fi

echo "https://go.dev/dl/$filename"
