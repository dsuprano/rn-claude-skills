# Claude Code Rules

Colección escalable de skills para Claude Code, orientadas a React Native, TypeScript, arquitectura, calidad y testing.

## Objetivo
Mantener un repositorio reutilizable de skills:
- fáciles de instalar
- fáciles de extender
- modulares
- optimizadas para progressive disclosure

## Skills incluidas
- rn-arch-audit
- rn-cleanup
- rn-quality-gate
- rn-test-guard

## Instalación global

```bash
./install-global.sh
```

## Instalación por proyecto

```bash
./install-project.sh
```

## Actualización

```bash
./update.sh
```

## Validación

```bash
./validate.sh
```

## Crear una nueva skill

```bash
./new-skill.sh nombre-skill
```

## Estructura
Cada skill vive en:

```txt
skills/<skill-name>/
├── SKILL.md
├── docs/
├── examples/
└── scripts/
```

## Filosofía
- skills pequeñas y especializadas
- `SKILL.md` corto
- detalles largos en `docs/`
- ejemplos en `examples/`
- validación automática