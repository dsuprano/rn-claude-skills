#!/usr/bin/env bash
set -e

NAME="$1"

if [ -z "$NAME" ]; then
  echo "Uso: ./new-skill.sh nombre-skill"
  exit 1
fi

ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$ROOT_DIR/skills/$NAME"
TEMPLATE_DIR="$ROOT_DIR/templates/skill-template"

if [ -d "$TARGET_DIR" ]; then
  echo "❌ La skill ya existe: $NAME"
  exit 1
fi

mkdir -p "$TARGET_DIR/docs" "$TARGET_DIR/examples" "$TARGET_DIR/scripts"

cp "$TEMPLATE_DIR/SKILL.md" "$TARGET_DIR/SKILL.md"
cp "$TEMPLATE_DIR/docs/workflow.md" "$TARGET_DIR/docs/workflow.md"
cp "$TEMPLATE_DIR/docs/checklists.md" "$TARGET_DIR/docs/checklists.md"
cp "$TEMPLATE_DIR/docs/edge-cases.md" "$TARGET_DIR/docs/edge-cases.md"
cp "$TEMPLATE_DIR/examples/prompts.md" "$TARGET_DIR/examples/prompts.md"
cp "$TEMPLATE_DIR/scripts/validate.sh" "$TARGET_DIR/scripts/validate.sh"

sed -i.bak "s/skill-template/$NAME/g" "$TARGET_DIR/SKILL.md" && rm "$TARGET_DIR/SKILL.md.bak"

echo "✅ Skill creada en $TARGET_DIR"