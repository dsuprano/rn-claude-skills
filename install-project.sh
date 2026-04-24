#!/usr/bin/env bash
set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$REPO_DIR/.claude/skills"

echo "==> Instalando skills del proyecto en $TARGET_DIR"
mkdir -p "$TARGET_DIR"

for skill_dir in "$REPO_DIR"/skills/*; do
  [ -d "$skill_dir" ] || continue
  skill_name="$(basename "$skill_dir")"
  echo "-> Instalando $skill_name"
  rm -rf "$TARGET_DIR/$skill_name"
  cp -R "$skill_dir" "$TARGET_DIR/$skill_name"
done

echo "✅ Instalación de proyecto completada"