#!/usr/bin/env bash
set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Actualizando repo"
cd "$REPO_DIR"
git pull

echo "==> Validando"
"$REPO_DIR/validate.sh"

echo "==> Reinstalando global"
"$REPO_DIR/install-global.sh"

echo "✅ Update completado"