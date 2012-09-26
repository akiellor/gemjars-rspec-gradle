#!/bin/sh

set -e

echo "$(pwd)\n$(modules)" | xargs -I _ find _ -name "*.do" -maxdepth 1  | grep -e "^[^\.]\+\.do" | cut -f 1 -d . >&2
