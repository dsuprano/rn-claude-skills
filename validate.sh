cat > validate.sh <<'EOF'
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

for skill_dir in "$SKILLS_DIR"/*; do
  [ -d "$skill_dir" ] || continue
  found=1
  skill_name="$(basename "$skill_dir")"

  if [ ! -f "$skill_dir/SKILL.md" ]; then
    echo "❌ Falta SKILL.md en $skill_name"
    exit 1
  fi

  echo "✅ $skill_name OK"
done

if [ "$found" -eq 0 ]; then
  echo "❌ No se encontraron skills"
  exit 1
fi

echo "✅ Validación completada"
EOF