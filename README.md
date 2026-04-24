# Claude Code Rules

Colección de skills personalizadas para Claude Code, enfocadas en React Native + TypeScript + MobX + React Navigation.

## Skills incluidas

- `rn-arch-audit`: auditoría de arquitectura, refactor y estandarización
- `rn-cleanup`: limpieza técnica y eliminación segura de dead code
- `rn-quality-gate`: deja TSC + ESLint sin errores ni warnings
- `rn-test-guard`: verifica, actualiza y crea tests para alcanzar cobertura mínima del 80%

## Instalación rápida

```bash
git clone https://github.com/TU_USUARIO/claude-code-rules.git
cd claude-code-rules
./install.sh
```

## Actualización

```bash
cd claude-code-rules
./update.sh
```

## Validación

```bash
./validate.sh
```

## Uso en Claude Code

```txt
/rn-arch-audit
/rn-arch-audit src/features/chat

/rn-cleanup
/rn-cleanup src/features/chat

/rn-quality-gate
/rn-quality-gate src/core

/rn-test-guard
/rn-test-guard src/features/auth
```

## Instalación manual

Claude Code carga skills desde:

```bash
~/.claude/skills/
```

Cada skill debe vivir en su propia carpeta y contener un archivo `SKILL.md`.

## Estructura del repositorio

```txt
skills/
  rn-arch-audit/
    SKILL.md
  rn-cleanup/
    SKILL.md
  rn-quality-gate/
    SKILL.md
  rn-test-guard/
    SKILL.md
```
