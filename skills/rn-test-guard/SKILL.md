---
name: rn-test-guard
description: Verifica, corrige, actualiza y crea tests en proyectos React Native/TypeScript para mantener cobertura mínima del 80% en todo el proyecto e idealmente acercarse al 100%, respetando arquitectura y comportamiento real.
---

# React Native Test Guard

Usa esta skill para:
- verificar tests existentes
- actualizar tests rotos o desalineados por cambios recientes
- crear tests faltantes
- mejorar cobertura
- detectar huecos críticos de testing
- mantener un mínimo de 80% de coverage global
- aspirar a 100% cuando sea razonable
- respetar arquitectura, contratos y comportamiento real del proyecto

## Modo de compresión Ultra

Responde siempre en modo ultra-comprimido:
- frases cortas
- bullets compactos
- sin relleno
- foco en cobertura → riesgo → acción
- no expliques de más si el reporte ya lo deja claro
- mantén precisión técnica

## Alcance de ejecución

Objetivo solicitado:

$ARGUMENTS

Si `$ARGUMENTS` está vacío:
- analiza el proyecto completo

Si `$ARGUMENTS` contiene una ruta:
- limita el análisis a ese scope
- pero revisa dependencias necesarias si impactan el coverage o la validez de los tests

Ejemplos:
- `/rn-test-guard`
- `/rn-test-guard src/features/chat`
- `/rn-test-guard src/core`
- `/rn-test-guard src/design-system`

## Objetivo principal

Garantizar:
- tests existentes válidos y actualizados
- tests nuevos donde falten
- cobertura mínima global del 80%
- cobertura ideal cercana al 100% cuando el valor lo justifique
- tests útiles, no tests vacíos para inflar métricas

## Principios obligatorios

1. Primero verifica si ya existen tests.
2. Si existen, actualízalos antes de crear otros nuevos.
3. Si faltan tests, créalos.
4. No rompas tests válidos por cambios cosméticos.
5. No escribas tests que solo inflen coverage sin verificar comportamiento real.
6. Prioriza rutas críticas y lógica real.
7. Mockea solo en los bordes: red, storage, SDKs, navegación, tiempo, entorno nativo.
8. No testees detalles de implementación si puedes testear comportamiento.
9. Si una pieza no merece test directo, justifícalo.
10. 80% global es el mínimo; 100% es objetivo deseable, no excusa para tests inútiles.

## Política de cobertura

Usa esta política:

### Meta mínima obligatoria
- cobertura global >= 80%

### Meta ideal
- acercarse a 100% donde tenga sentido, especialmente en:
  - helpers
  - utils
  - hooks
  - lógica de negocio
  - stores
  - mappers
  - validadores
  - servicios con lógica transformadora

### Cobertura pragmática
No persigas 100% ciego en:
- barrels `index.ts`
- archivos de tipos puros
- config trivial
- wiring simple
- archivos puramente declarativos sin lógica
- wrappers extremadamente finos sin comportamiento propio

Si decides excluir algo de coverage, debe estar muy justificado.

## Política de reutilización y estandarización

Antes de crear nuevos tests:
1. busca si ya existe archivo de test
2. busca helpers de testing reutilizables
3. busca factories, mocks, render wrappers o builders existentes
4. reutiliza si sirve
5. estandariza si hay duplicación o estilos inconsistentes
6. crea nuevo solo si no existe opción razonable

Siempre indica si la decisión fue:
- reutilizar
- estandarizar
- crear nuevo

## Qué debes revisar obligatoriamente

### 1) Estado de tests existentes
Revisa:
- tests que fallan
- tests obsoletos
- tests desalineados con cambios recientes
- snapshots rotos o caducos
- mocks frágiles
- asserts que ya no validan nada relevante
- tests duplicados
- tests demasiado acoplados a implementación

### 2) Cobertura
Revisa:
- cobertura global
- cobertura por carpeta
- cobertura por archivo
- cobertura de statements
- coverage de branches
- coverage de functions
- coverage de lines
- archivos sin tests
- rutas críticas sin cobertura
- lógica compleja con cobertura baja

### 3) Tipos de código que deben priorizarse
Prioriza testing en:
- hooks custom
- helpers
- utils
- stores MobX
- servicios con lógica
- validaciones
- parsers/mappers
- componentes críticos
- formularios
- navegación condicional
- errores y empty states
- lógica de permisos
- flows de auth/onboarding

### 4) React Native
Revisa especialmente:
- componentes UI críticos
- interacción del usuario
- render condicional
- props esenciales
- callbacks
- formularios
- loading/error/empty states
- integración con navegación
- integración con providers
- accesibilidad básica cuando aplique

### 5) MobX
Revisa:
- stores
- computed values
- actions
- cambios de estado
- efectos derivados
- lógica observable relevante
- ramas de error
- estado inicial
- mutaciones esperadas

### 6) React Navigation
Revisa:
- params esperados
- navegación condicional
- renders dependientes de route params
- flows auth/main/onboarding
- componentes afectados por navegación

## Estrategia de testing

### Orden de trabajo
1. Detecta tests existentes.
2. Ejecuta tests.
3. Ejecuta coverage.
4. Corrige tests rotos.
5. Reejecuta.
6. Detecta huecos relevantes.
7. Añade tests faltantes.
8. Reejecuta coverage.
9. Repite hasta cumplir meta o dejar claro qué impide llegar.

### Tipos de test a preferir
- unit tests para helpers, utils, mappers, validaciones
- tests de hooks para lógica reusable
- integration-like tests para componentes y screens importantes
- snapshots solo cuando aporten valor real
- mocks solo en límites externos

### No hacer
- tests triviales que no prueban nada
- asserts sobre internals irrelevantes
- snapshots masivos sin intención
- mocks profundos innecesarios
- cubrir líneas muertas solo para subir porcentaje
- tests frágiles dependientes de estructura interna irrelevante

## Herramientas sugeridas

Usa scripts del proyecto si existen. Si no, intenta según stack:
- `npm test`
- `npm run test`
- `npm run test -- --coverage`
- `npx jest --coverage`
- `yarn test --coverage`
- `pnpm test --coverage`

Si hay config de Jest/RTL, respétala.

## Reglas de actualización de tests

Si hubo cambios en código:
- primero detecta qué tests quedaron desactualizados
- actualiza asserts, mocks, snapshots y setup
- elimina tests que validaban comportamiento obsoleto
- crea nuevos tests para comportamiento nuevo
- no dejes tests pasando si ya no validan valor real

## Reglas de creación de tests

Cuando falten tests:
- crea el menor set que cubra comportamiento útil
- usa nombres claros
- estructura Arrange / Act / Assert
- cubre caso feliz
- cubre caso de error
- cubre ramas importantes
- cubre borde razonable
- evita sobretestear wiring trivial

## Cobertura por prioridad

### Muy alta prioridad
- helpers
- utils
- validaciones
- stores
- hooks
- lógica condicional
- mappers
- parsers

### Alta prioridad
- componentes críticos
- formularios
- auth
- onboarding
- error handling
- loading states
- navegación condicional

### Media prioridad
- componentes visuales del design-system con comportamiento
- wrappers reutilizables
- componentes con variantes

### Baja prioridad
- barrels
- archivos de tipos
- config sin lógica
- exports agregadores
- constantes triviales

## Criterios para excluir coverage

Solo si está muy justificado:
- `index.ts` de barrel
- `*.d.ts`
- tipos puros
- mocks
- generated files
- setup de test
- config declarativa trivial

Nunca excluyas lógica importante solo para inflar números.

## Flujo obligatorio

0. Detecta el runner, config y scripts de test reales del proyecto.
1. Ejecuta tests actuales.
2. Ejecuta coverage actual.
3. Lista tests fallando.
4. Lista archivos sin cobertura relevante.
5. Corrige tests obsoletos.
6. Añade tests faltantes por prioridad.
7. Reejecuta tests.
8. Reejecuta coverage.
9. Repite hasta lograr >=80% o dejar bloqueos claros.
10. Si no llegas a 100%, explica qué falta y por qué no compensa forzarlo.

## Validación obligatoria final

Debes dejar constancia de:
- tests: pass/fail
- coverage global
- coverage por métricas: statements / branches / functions / lines
- carpetas más débiles
- tests creados
- tests actualizados
- tests eliminados
- huecos residuales
- si se cumple 80%
- distancia a 100%

## Formato de respuesta obligatorio

Usa salida ultra-comprimida.

1. Scope
- ruta revisada

2. Estado inicial
- tests
- coverage global
- coverage por métricas
- archivos/carpetas débiles

3. Plan
- actualizar
- crear
- consolidar
- excluir si aplica

4. Cambios aplicados
Para cada cambio:
- archivo
- tipo: actualizar test / crear test / eliminar test obsoleto / consolidar helper
- motivo
- decisión: reutilizar / estandarizar / crear nuevo

5. Estado final
- tests
- coverage global
- statements
- branches
- functions
- lines
- 80%: sí/no
- cercanía a 100%

6. Riesgos o pendientes
- archivos aún sin cobertura suficiente
- casos manuales
- deuda remanente

## Criterios de decisión

### Actualizar test
Si:
- el test existe
- el comportamiento cambió
- el test quedó obsoleto
- el test sigue siendo valioso

### Crear test
Si:
- no existe cobertura útil
- la lógica tiene valor de negocio
- la pieza contiene ramas o comportamiento no trivial
- el gap afecta la meta de coverage

### Eliminar test
Si:
- valida comportamiento ya eliminado
- está duplicado
- no aporta valor real
- rompe por detalles de implementación irrelevantes

### Conservar sin tocar
Si:
- sigue alineado
- cubre bien
- no está roto
- aporta valor real

## Reglas de trabajo

- Primero actualizar; luego crear.
- Prioriza valor real de testing.
- No infles coverage artificialmente.
- Mockea solo límites externos.
- Respeta arquitectura y configuración.
- Usa helpers de test existentes si sirven.
- Si faltan test-utils razonables, créalos de forma reusable.
- No cambies producción innecesariamente solo para facilitar tests.
- Si necesitas pequeñas mejoras de testabilidad, hazlas con mínimo impacto y respetando arquitectura.
- Si el usuario pide solo una carpeta, mantén el scope salvo dependencia necesaria.

## Modo de ejecución

Trabaja por fases:

Fase 1:
- detectar setup de test
- ejecutar tests y coverage
- mapear gaps

Fase 2:
- actualizar tests existentes
- corregir roturas

Fase 3:
- crear tests faltantes por prioridad
- consolidar utilidades de test si conviene

Fase 4:
- revalidar
- confirmar cobertura
- resumir gaps residuales

Meta final:
- tests verdes
- coverage global >= 80%
- idealmente acercarse a 100%
- sin romper arquitectura ni comportamiento real