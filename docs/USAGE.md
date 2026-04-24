cat > docs/USAGE.md <<'EOF'
# Usage

## Auditoría de arquitectura

```txt
/rn-arch-audit
/rn-arch-audit src/features/chat
```

## Limpieza técnica

```txt
/rn-cleanup
/rn-cleanup src/features/chat
```

## Quality gate de TypeScript + ESLint

```txt
/rn-quality-gate
/rn-quality-gate src/core
```

## Tests y coverage

```txt
/rn-test-guard
/rn-test-guard src/features/auth
```

## Recomendación de uso

1. `rn-arch-audit`
2. `rn-cleanup`
3. `rn-quality-gate`
4. `rn-test-guard`

Así primero corriges arquitectura, luego limpias, luego dejas calidad estática perfecta y finalmente cubres tests.
EOF