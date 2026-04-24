cat > update.sh <<'EOF'
#!/usr/bin/env bash
set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Actualizando repositorio"
cd "$REPO_DIR"
git pull

echo "==> Reinstalando skills"
"$REPO_DIR/install.sh"

echo "✅ Update completo"
EOF