#!/usr/bin/env bash
set -e

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_DIR="$ROOT_DIR/skills"

echo "==> Validando estructura de skills"

if [ ! -d "$SKILLS_DIR" ]; then
  echo "❌ No existe carpeta skills/"
  exit 1
fi

found=0
declare -A names

for skill_dir in "$SKILLS_DIR"/*; do
  [ -d "$skill_dir" ] || continue
  found=1

  skill_name="$(basename "$skill_dir")"
  skill_file="$skill_dir/SKILL.md"

  if [ ! -f "$skill_file" ]; then
    echo "❌ Falta SKILL.md en $skill_name"
    exit 1
  fi

  if ! grep -q '^name:' "$skill_file"; then
    echo "❌ Falta 'name:' en $skill_name/SKILL.md"
    exit 1
  fi

  if ! grep -q '^description:' "$skill_file"; then
    echo "❌ Falta 'description:' en $skill_name/SKILL.md"
    exit 1
  fi

  if [[ -n "${names[$skill_name]}" ]]; then
    echo "❌ Nombre duplicado: $skill_name"
    exit 1
  fi

  names["$skill_name"]=1
  echo "✅ $skill_name OK"
done

if [ "$found" -eq 0 ]; then
  echo "❌ No se encontraron skills"
  exit 1
fi

echo "✅ Validación completada"