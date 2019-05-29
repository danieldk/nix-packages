#!/bin/sh

set -e

SCRIPTNAME=$(realpath "$0")
DANIELDK_OVERLAY_PATH="$(dirname "$SCRIPTNAME")"/overlay.nix
OVERLAYS_DIR="$HOME/.config/nixpkgs/overlays"

if [ ! -d "${OVERLAYS_DIR}" ]; then
  mkdir -p "${OVERLAYS_DIR}"
fi

ln -s "${DANIELDK_OVERLAY_PATH}" "${OVERLAYS_DIR}/danieldk.nix"
