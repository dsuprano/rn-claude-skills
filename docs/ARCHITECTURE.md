# Architecture

## Objetivo
Mantener un repositorio de skills modular y escalable.

## Principios
- una skill = una responsabilidad principal
- `SKILL.md` corto y claro
- detalles largos en `docs/`
- ejemplos en `examples/`
- scripts en `scripts/`
- progressive disclosure por defecto

## Instalación
- global: `~/.claude/skills/`
- proyecto: `.claude/skills/`

## Escalabilidad
- usar `new-skill.sh`
- validar con `validate.sh`
- añadir ejemplos antes de inflar `SKILL.md`