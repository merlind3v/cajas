#!/usr/bin/env bash
# Add CUPS queues for the USB printers: Brother DCP-1510 and Canon G2070.
# Needs the drivers from install.sh (brlaser, cnijfilter2) and the printers
# plugged in and switched on. Re-running it updates the existing queues.
set -euo pipefail

if [[ $EUID -eq 0 ]]; then
  echo "Run this script as a normal user, not root." >&2
  exit 1
fi

URIS=$(lpinfo -v)

add_queue() {
  local name=$1 desc=$2 uri_pattern=$3 ppd=$4 uri
  uri=$(grep -oE "$uri_pattern" <<<"$URIS" | head -1 || true)
  if [[ -z $uri ]]; then
    echo "$desc: not found, is it plugged in and switched on?" >&2
    return 1
  fi
  sudo lpadmin -p "$name" -E -v "$uri" -m "$ppd" -D "$desc" -L "USB"
  echo "$desc: queue $name -> $uri"
}

status=0
add_queue DCP-1510-series "Brother DCP-1510" \
  'usb://Brother/DCP-1510[^ ]*' drv:///brlaser.drv/br1510.ppd || status=1
# Canon's own backend (cnijbe2) and PPD; Gutenprint's "G2000 series" sends
# jobs that the G2070 silently ignores.
add_queue Canon_G2070 "Canon G2070" \
  'cnijbe2://Canon/\?port=usb[^ ]*' canong2070.ppd || status=1

exit $status
