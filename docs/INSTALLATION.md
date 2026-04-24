cat > docs/INSTALLATION.md <<'EOF'
# Installation

## Requisitos
- Git
- Claude Code instalado
- Acceso a `~/.claude/skills/`

## Instalación global

```bash
git clone https://github.com/TU_USUARIO/claude-code-rules.git
cd claude-code-rules
./install.sh
```

Esto copiará todas las skills a:

```bash
~/.claude/skills/
```

## Verificación

Comprueba que existan:

```bash
ls ~/.claude/skills
```

Deberías ver:

- rn-arch-audit
- rn-cleanup
- rn-quality-gate
- rn-test-guard

## Reinstalación

```bash
./install.sh
```

## Actualización

```bash
./update.sh
```
EOF