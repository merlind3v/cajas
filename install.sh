#!/usr/bin/env bash
# Install office, PDF, graphics, fonts and printing tools on Arch/CachyOS.
# Run as a normal user: sudo is used for pacman, paru must not run as root.
set -euo pipefail

if [[ $EUID -eq 0 ]]; then
  echo "Run this script as a normal user, not root." >&2
  exit 1
fi

if ! command -v paru >/dev/null; then
  echo "paru is required for AUR packages." >&2
  exit 1
fi

PACMAN_PKGS=(
  # Office
  libreoffice-fresh libreoffice-fresh-es
  # PDF
  okular pdfarranger
  # Graphics
  gimp inkscape
  # Printing and scanning
  cups print-manager system-config-printer gutenprint foomatic-db-gutenprint-ppds simple-scan
)

AUR_PKGS=(
  onlyoffice-bin
  masterpdfeditor-free
  ttf-ms-fonts ttf-vista-fonts
)

sudo pacman -S --needed --noconfirm "${PACMAN_PKGS[@]}"
sudo systemctl enable --now cups

paru -S --needed --noconfirm "${AUR_PKGS[@]}"

echo "Done."
