---
name: rn-quality-gate
description: Garantiza que TypeScript y ESLint pasen sin errores ni warnings en proyectos React Native/TypeScript, corrigiendo el código sin romper la arquitectura ni la configuración existente.
---

# React Native Typecheck + Lint Zero Issues

Usa esta skill para asegurar que:
- `tsc` pase sin errores
- `eslint` pase sin errores
- `eslint` pase sin warnings
- el proyecto quede alineado con su arquitectura actual
- las correcciones respeten configuración, aliases, estructura y convenciones existentes

## Modo de compresión Ultra

Responde siempre en modo ultra-comprimido:
- frases cortas
- bullets compactos
- sin relleno
- sin repetir contexto
- foco en error → causa → fix
- si algo es obvio por el output, no lo expliques de más
- mantén precisión técnica

## Alcance de ejecución

Objetivo solicitado:

$ARGUMENTS

Si `$ARGUMENTS` está vacío:
- analiza y corrige el proyecto completo

Si `$ARGUMENTS` contiene una ruta:
- limita la revisión y corrección a esa carpeta o scope
- pero corrige archivos dependientes si son necesarios para dejar `tsc` y `eslint` sanos dentro de ese alcance

Ejemplos:
- `/rn-quality-gate`
- `/rn-quality-gate src/features/chat`
- `/rn-quality-gate src/core`
- `/rn-quality-gate src/design-system`

## Objetivo principal

Dejar el proyecto o scope solicitado con:
- `tsc --noEmit` limpio
- `eslint` limpio
- `eslint --max-warnings=0` limpio

Sin romper:
- arquitectura
- estructura de carpetas
- aliases
- configuración de TypeScript
- configuración de ESLint
- contratos públicos razonables
- convenciones del proyecto

## Principios obligatorios

1. Cero errores TypeScript.
2. Cero errores ESLint.
3. Cero warnings ESLint.
4. No arreglar problemas con hacks si hay una solución correcta.
5. No ocultar errores con ignores salvo último recurso y con justificación.
6. No romper arquitectura para satisfacer una regla de lint.
7. No cambiar configuración global si el problema puede corregirse bien en código.
8. Si una regla o un tipo revela un problema real, arregla la causa, no el síntoma.
9. Si algo requiere refactor, haz el menor cambio seguro posible.
10. Si el proyecto tiene una convención clara, síguela.

## Política de corrección

Aplica este orden:

1. Reproducir errores reales.
2. Agrupar por tipo:
- TypeScript
- ESLint
- warnings
- imports
- tipos
- promesas
- hooks
- props
- dead code
3. Corregir primero problemas automáticos y seguros.
4. Luego corregir problemas estructurales pequeños.
5. Luego validar de nuevo.
6. Repetir hasta dejar cero issues.

## Política de respeto arquitectónico

Debes respetar:
- arquitectura feature-based
- separación entre `app`, `core`, `design-system`, `features`, `types`
- stores globales en el lugar correcto
- lógica fuera de pantallas
- estilos en archivo propio
- aliases del proyecto
- contratos de navegación
- convenciones i18n
- límites entre componentes de negocio y design-system

No debes:
- mover código de forma masiva sin necesidad
- inventar nuevas capas
- meter lógica de negocio en UI
- romper contratos de rutas
- convertir estado local en global sin motivo
- alterar reglas globales solo para hacer pasar el lint

## Política de reutilización y estandarización

Antes de crear cualquier componente, función, hook, helper, type, service o utilidad nueva, sigue este orden:

1. Buscar si ya existe algo equivalente.
2. Reutilizar si sirve.
3. Estandarizar o extender si existe una variante inconsistente.
4. Solo si no hay opción razonable, crear algo nuevo.
5. Si creas algo nuevo, hazlo coherente con la arquitectura actual.

Siempre debes indicar en cada corrección si la decisión fue:
- reutilizar
- estandarizar
- crear nuevo

## Qué debes revisar obligatoriamente

### 1) TypeScript
Corrige:
- `any` innecesarios
- tipos implícitos inseguros
- errores de props
- errores de retorno
- null/undefined mal manejados
- union narrowing incorrecto
- tipos de navegación
- tipos de stores
- errores en responses o mappers
- import types incorrectos
- generics mal definidos
- incompatibilidades entre interfaces y uso real

### 2) ESLint
Corrige:
- imports no usados
- variables no usadas
- reglas de hooks
- dependencias de effects
- no-floating-promises
- shadowing
- unreachable code
- reglas de TS ESLint
- errores de import/order si forman parte de la configuración
- disables obsoletos
- warnings convertibles en fix seguro

### 3) React / React Native
Corrige:
- hooks mal usados
- efectos con dependencias incorrectas
- callbacks mal tipados
- props no usadas
- componentes demasiado acoplados al lint error
- patterns incompatibles con reglas del proyecto
- warnings de estilo o JSX si están configurados

### 4) MobX
Corrige sin romper:
- uso incorrecto de `observer`
- tipos defectuosos en stores
- propiedades no inicializadas según reglas del proyecto
- acciones/promesas que disparan errores de lint/ts
- accesos inseguros a estado observable

### 5) React Navigation
Corrige:
- tipado de params
- imports/types de navegación
- uso inseguro de `route` o `navigation`
- screen props mal definidas
- nombres de rutas inconsistentes si generan errores reales

## Estrategia de herramientas

Debes usar, según disponibilidad del proyecto:
- `npx tsc --noEmit`
- `npx eslint . --max-warnings=0`
- o scripts del proyecto equivalentes, por ejemplo:
  - `npm run typecheck`
  - `npm run lint`
  - `yarn typecheck`
  - `pnpm lint`

Si existe script del proyecto, priorízalo.

## Reglas de fixes

### Permitido
- corregir imports
- eliminar código no usado si el lint lo exige y es seguro
- tipar mejor funciones
- extraer types pequeños
- corregir props
- ajustar hooks
- corregir async/await
- convertir promesas flotantes en manejo explícito
- añadir guards
- usar `void` donde aplique y sea correcto
- reordenar imports si la regla lo exige
- dividir una pequeña porción si resuelve de forma limpia el problema

### No permitido salvo necesidad fuerte
- desactivar reglas globales
- aflojar `tsconfig`
- introducir `any`
- añadir `eslint-disable` sin justificación
- añadir `@ts-ignore` sin justificación
- rehacer arquitectura completa
- renombrados masivos por cosmética
- cambios grandes de API pública si no son imprescindibles

### Último recurso
Solo si no hay alternativa razonable:
- `eslint-disable-next-line` con justificación breve
- `@ts-expect-error` con justificación breve y precisa

Nunca uses estos mecanismos para ocultar problemas evitables.

## Flujo obligatorio

0. Identifica scripts reales de lint y typecheck del proyecto.
1. Ejecuta typecheck y lint.
2. Reúne todos los errores y warnings.
3. Agrupa por categorías.
4. Prioriza fixes seguros y automáticos.
5. Reejecuta checks.
6. Corrige problemas restantes con cambios mínimos.
7. Reejecuta checks.
8. Repite hasta llegar a cero errores y cero warnings.
9. Resume cambios y riesgos residuales, si los hay.

## Validación obligatoria final

Debes dejar constancia de:
- `tsc`: pass/fail
- `eslint`: pass/fail
- warnings: 0/pendientes
- scope validado
- archivos tocados
- hacks usados, si hubo alguno
- deuda residual, si existe

## Formato de respuesta obligatorio

Usa salida ultra-comprimida.

1. Scope
- ruta revisada

2. Estado inicial
- typecheck
- lint
- warnings
- categorías de errores

3. Plan
- lote 1
- lote 2
- lote 3

4. Cambios aplicados
Para cada lote:
- error o warning
- causa
- fix
- archivos
- decisión: reutilizar / estandarizar / crear nuevo

5. Estado final
- `tsc`
- `eslint`
- warnings
- riesgos residuales

6. Notas
- ignores usados
- cambios delicados
- puntos a revisar manualmente

## Criterios de decisión

### Corregir en código
Si:
- el error refleja un problema real
- la solución respeta la arquitectura
- el fix es local y seguro

### Estandarizar
Si:
- hay patrones inconsistentes que generan varios errores parecidos
- existe una forma mejor ya usada en el proyecto
- consolidar reduce futuros errores

### Reutilizar
Si:
- ya existe un helper, type, hook o componente válido
- crear otro sería duplicación

### Escalar o marcar
Si:
- el fix correcto requiere cambio arquitectónico mayor
- el error nace de configuración deficiente o inconsistente
- el scope parcial impide resolver el problema de forma segura

## Reglas de trabajo

- Prioriza cero warnings.
- Arregla causas, no síntomas.
- Respeta configuración existente.
- Respeta arquitectura existente.
- No uses hacks por comodidad.
- Si una regla está bien definida, adapta el código a la regla.
- Si una configuración está rota de verdad, señálalo claramente.
- Si el usuario pide solo una carpeta, no expandas el scope sin explicar por qué.
- Si una corrección toca archivos fuera del scope, limita el cambio al mínimo imprescindible.

## Modo de ejecución

Trabaja por fases:

Fase 1:
- detectar scripts
- ejecutar checks
- clasificar errores

Fase 2:
- aplicar fixes seguros
- revalidar

Fase 3:
- resolver errores estructurales pequeños
- revalidar

Fase 4:
- confirmar cero errores y cero warnings
- resumir cambios

Meta final:
- `tsc --noEmit` limpio
- `eslint --max-warnings=0` limpio
- sin romper arquitectura ni configuración