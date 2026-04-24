---
name: rn-cleanup
description: Limpieza y depuración técnica de proyectos React Native/TypeScript. Detecta y elimina código, archivos, carpetas, exports, imports, tipos, dependencias y artefactos no usados, a nivel global o por carpeta específica, con salida ultra-comprimida.
---

# React Native Cleanup & Dead Code Removal

Usa esta skill para limpiar técnica y estructuralmente un proyecto React Native/TypeScript con foco en:
- archivos no usados
- carpetas huérfanas
- componentes no usados
- funciones no usadas
- hooks no usados
- helpers no usados
- stores no usados
- types/interfaces/enums no usados
- exports no usados
- imports no usados
- dependencias npm no usadas
- código duplicado
- ramas muertas
- utilidades obsoletas
- código legado sin referencias
- limpieza de barrel exports
- consolidación de duplicados
- reducción de ruido técnico y deuda muerta

## Modo de compresión Ultra

Responde siempre en modo ultra-comprimido:
- frases cortas
- bullets compactos
- sin relleno
- sin repetir contexto
- foco en evidencia → riesgo → acción
- si algo es obvio por el reporte, no lo expliques de más
- si el usuario no pide detalle, no expandas
- mantén precisión aunque el estilo sea telegráfico

## Alcance de ejecución

Objetivo solicitado:

$ARGUMENTS

Si `$ARGUMENTS` está vacío:
- analiza el proyecto completo

Si `$ARGUMENTS` contiene una ruta:
- limita el análisis y limpieza a esa carpeta o scope
- revisa dependencias cruzadas si afectan seguridad del borrado

Ejemplos:
- `/rn-cleanup`
- `/rn-cleanup src/features/chat`
- `/rn-cleanup src/core`
- `/rn-cleanup src/design-system`
- `/rn-cleanup src/features/auth`

## Objetivo principal

Eliminar todo lo que no se usa o no aporta valor técnico real al proyecto, incluyendo:
- archivos
- carpetas
- componentes
- funciones
- hooks
- helpers
- types
- enums
- interfaces
- exports
- imports
- dependencias
- código duplicado
- artefactos obsoletos

Hazlo sin romper funcionalidad.

## Principios obligatorios

1. Toda eliminación debe estar respaldada por evidencia.
2. Nunca asumas “no usado” sin comprobar referencias reales o herramientas de análisis.
3. Antes de borrar, verifica imports, re-exports, uso dinámico y wiring indirecto.
4. Borra en lotes pequeños y verificables.
5. Después de cada lote, valida que el proyecto siga sano.
6. No mezcles cleanup técnico con refactors de negocio grandes.
7. Si hay duda razonable, no borres; marca como “revisión manual”.
8. Si detectas duplicados, primero consolida, luego elimina la variante sobrante.
9. Si algo parece no usado pero forma parte de wiring, bootstrap, registro, navegación, i18n, DI, mocks, tests o carga dinámica, trátalo como caso sensible.
10. Siempre prioriza seguridad sobre agresividad.

## Política de evidencia

Antes de eliminar cualquier cosa, debes recopilar evidencia usando tantas fuentes como sea posible:

### Herramientas principales
- `knip` para archivos, exports, tipos y dependencias no usados
- `depcheck` para dependencias no usadas
- `ts-prune` para exports TypeScript no usados
- `eslint` para imports/variables no usados y disables obsoletos
- búsqueda textual/grep para referencias reales
- revisión de barrel exports
- revisión de navegación, registros, i18n, providers y side effects de inicialización

### Regla crítica
No elimines algo solo porque una herramienta lo marque. Corrobora con:
- referencias directas
- referencias indirectas
- re-exports
- imports dinámicos
- navegación
- registros de pantallas
- acceso por strings
- wiring de providers
- consumo por tests
- consumo por mocks
- consumo por generación automática o runtime

## Política de reutilización y consolidación

Antes de borrar o crear reemplazos:
1. busca si ya existe una implementación equivalente
2. si hay duplicados, elige la mejor versión
3. estandariza la mejor versión
4. actualiza referencias
5. elimina las variantes sobrantes

Cuando tomes una decisión, clasifícala como:
- eliminar
- consolidar
- conservar
- revisar manualmente

## Qué debes revisar obligatoriamente

### 1) Archivos y carpetas
Detecta:
- archivos huérfanos
- carpetas vacías
- carpetas con contenido obsoleto
- features antiguas sin rutas ni imports
- pantallas no registradas
- componentes nunca importados
- assets no referenciados
- mocks, stories o fixtures obsoletos

### 2) Código TypeScript
Detecta:
- exports no usados
- imports no usados
- tipos no usados
- interfaces no usadas
- enums no usados
- funciones no usadas
- constantes no usadas
- helpers duplicados
- branches muertas
- wrappers innecesarios
- barrels que exportan cosas nunca consumidas

### 3) Dependencias
Detecta:
- paquetes npm no usados
- dependencias duplicadas en propósito
- librerías instaladas pero reemplazadas por otra solución
- types packages innecesarios
- dependencias de dev no usadas
- plugins/linters/configs muertos

### 4) React Native / app wiring
Revisa con especial cuidado:
- pantallas registradas en navegación
- componentes cargados por navegación o lazy loading
- providers globales
- stores inyectados por contexto
- i18n namespaces/locales
- assets usados indirectamente
- utilidades usadas por config o bootstrap
- side effects de inicialización
- hooks invocados desde composición no obvia

### 5) Duplicación
Detecta:
- componentes casi iguales
- helpers repetidos
- tipos repetidos
- transformadores/mappers repetidos
- lógica copiada entre features
- utilidades equivalentes en `core` y `features`
- variantes pequeñas que deberían unificarse

## Clasificación de riesgo

Clasifica cada hallazgo como:

### SAFE
Se puede eliminar con alta confianza:
- imports no usados
- variables no usadas
- exports internos claramente no consumidos
- archivos sin referencias y sin wiring especial
- carpetas vacías
- dependencias claramente no usadas y no requeridas por scripts

### CAREFUL
Requiere validación adicional:
- exports re-exportados por barrels
- tipos potencialmente usados por reflexión o tooling
- archivos usados en tests o mocks
- assets con nombres genéricos
- helpers compartidos en varios sitios
- módulos consumidos indirectamente

### RISKY
No eliminar sin validación explícita:
- navegación
- auth
- bootstrap
- providers
- stores globales
- config
- i18n
- side effects de arranque
- integraciones externas
- código cargado dinámicamente
- código usado por scripts, CI o generación

## Flujo obligatorio

0. Revisa si el repo tiene cambios sin confirmar y advierte al usuario si el cleanup puede mezclarse con trabajo no relacionado.
1. Define el scope exacto.
2. Recolecta evidencia con herramientas.
3. Construye inventario de candidatos a eliminar o consolidar.
4. Clasifica por riesgo: SAFE / CAREFUL / RISKY.
5. Empieza solo por SAFE.
6. Aplica cambios en lotes pequeños.
7. Tras cada lote, ejecuta validaciones.
8. Si algo falla, revierte mentalmente ese lote y reduce el alcance.
9. Documenta todo lo eliminado o consolidado.
10. Solo después pasa a CAREFUL, si la evidencia es suficiente.
11. RISKY queda como propuesta o requiere aprobación explícita.

## Validaciones obligatorias

Después de cada lote de cleanup:
- typecheck
- lint
- tests relevantes
- revisión básica de imports rotos
- revisión de exports rotos
- revisión de navegación si el scope toca screens/features
- revisión de build si aplica

Si el proyecto no tiene tests:
- deja constancia
- aumenta cautela
- prioriza SAFE

## Reglas de borrado

- No borrar por intuición.
- No borrar por “parece viejo”.
- No borrar porque no te guste la estructura.
- No borrar en masa sin lotes.
- No mezclar cleanup con rediseño arquitectónico grande.
- No tocar lógica de negocio crítica sin evidencia fuerte.
- No eliminar piezas públicas o transversales sin rastrear consumo real.
- No borrar algo solo porque un barrel no lo muestre; revisa también acceso directo.
- No borrar algo solo porque no aparezca en grep simple; considera strings, navegación y wiring.

## Reglas específicas para proyectos React Native

Antes de eliminar algo, comprueba si está conectado a:
- React Navigation
- providers globales
- MobX RootStore / StoreProvider
- i18n/locales
- AsyncStorage/SecureStore wiring
- assets usados por nombre
- componentes usados en composición condicional
- feature flags
- entorno nativo o configuración de plataforma
- scripts de build/test

## Formato de respuesta obligatorio

Usa salida ultra-comprimida.

1. Scope
- proyecto completo o ruta analizada

2. Evidencia
- herramientas usadas
- hallazgos por fuente

3. Candidatos
Para cada candidato:
- ruta o símbolo
- tipo: archivo / carpeta / export / import / función / hook / type / dependencia / duplicado
- evidencia
- riesgo: SAFE / CAREFUL / RISKY
- decisión: eliminar / consolidar / conservar / revisar manualmente

4. Plan de acción
- lote 1
- lote 2
- lote 3

5. Cambios aplicados
Para cada lote:
- qué se eliminó
- qué se consolidó
- qué se conservó
- qué referencias se actualizaron

6. Validación
- typecheck
- lint
- tests
- estado final

7. Deletion log
- lista final de archivos/símbolos/dependencias eliminados
- lista de duplicados consolidados
- lista de sospechosos no eliminados por riesgo

## Criterios de decisión

### Eliminar
Si:
- no tiene referencias reales
- no participa en wiring
- no forma parte de runtime dinámico
- no es dependencia necesaria
- herramientas + grep + contexto coinciden

### Consolidar
Si:
- hay duplicación
- existe una mejor implementación
- se puede migrar sin riesgo alto
- la eliminación debe ocurrir después de redirigir referencias

### Conservar
Si:
- se confirma uso
- participa en runtime indirecto
- es parte de infraestructura o arranque
- su eliminación es dudosa

### Revisar manualmente
Si:
- la evidencia es insuficiente
- hay uso dinámico
- depende de strings, configuración o runtime
- toca auth, navegación, bootstrap o integraciones

## Herramientas sugeridas

Si están disponibles, prioriza:
- `npx knip`
- `npx depcheck`
- `npx ts-prune`
- `npx eslint . --report-unused-disable-directives`

Y complementa con:
- búsqueda de referencias
- inspección de barrels
- revisión de tsconfig
- revisión de package.json
- revisión de navegación y providers

## Regla de documentación

Mantén o propone un registro de limpieza con:
- archivos eliminados
- exports eliminados
- dependencias eliminadas
- duplicados consolidados
- validaciones realizadas
- items marcados como dudosos

Nombre sugerido:
- `docs/DELETION_LOG.md`

## Reglas de trabajo

- Prioriza seguridad.
- Borra poco, valida, sigue.
- Si algo es dudoso, no lo borres.
- Si hay duplicados, consolida antes de eliminar.
- No crees abstracciones nuevas salvo que la consolidación lo requiera.
- Si el usuario pidió limpieza solo de una carpeta, no expandas el scope sin justificar.
- Si detectas problemas arquitectónicos graves, menciónalos, pero no conviertas esta skill en una auditoría general.
- Mantén el foco en limpieza técnica y eliminación segura de dead code.

## Modo de ejecución

Trabaja por fases:

Fase 1:
- mapear scope
- reunir evidencia
- clasificar hallazgos

Fase 2:
- proponer lotes SAFE
- aplicar cleanup en lotes pequeños

Fase 3:
- validar tras cada lote
- consolidar duplicados claros

Fase 4:
- resumir deletion log
- dejar pendientes CAREFUL/RISKY separados

Empieza siempre por evidencia, nunca por borrado.