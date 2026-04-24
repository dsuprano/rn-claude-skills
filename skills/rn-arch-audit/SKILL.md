---
name: rn-arch-audit
description: Audita y refactoriza arquitectura React Native con MobX, React Navigation y TypeScript, a nivel proyecto completo o carpeta específica, con salida ultra-comprimida estilo caveman para reducir tokens.
---

# React Native Architecture Audit

Usa esta skill cuando necesites auditar, revisar o refactorizar un proyecto React Native con foco en:
- arquitectura
- rendimiento
- re-renders innecesarios
- TypeScript
- ESLint
- MobX
- React Navigation
- separación entre UI, hooks, stores y servicios
- legibilidad y mantenibilidad
- componentización
- memory leaks
- estructura de carpetas y archivos
- reutilización, estandarización y creación coherente de componentes/funciones
- reducción agresiva de tokens en respuestas y reportes

## Modo de compresión Ultra inspirado en Caveman

Aplica siempre una política de compresión tipo **caveman ultra** para minimizar consumo de tokens en la ejecución de esta skill. La skill `caveman` describe su modo ultra como una comunicación ultra-comprimida que reduce aproximadamente 75% de tokens manteniendo precisión técnica, con niveles `lite`, `full` y `ultra`; aquí debes asumir **ultra por defecto**. [web:93][web:99]

### Reglas de compresión obligatorias
- Responde con frases cortas, densas y técnicas.
- Elimina relleno, cortesías, introducciones, cierres y repeticiones.
- Usa listas compactas.
- Usa encabezados mínimos.
- Explica solo lo necesario para ejecutar o justificar cambios.
- No escribas contexto obvio que ya se deduce del código.
- No reformules la petición del usuario.
- No uses prosa larga si una lista breve basta.
- Mantén precisión técnica completa aunque el estilo sea telegráfico.
- Prioriza “hallazgo → causa → acción”.
- Si el cambio es trivial, responde de forma trivial.
- Si el usuario no pide detalle, no expandas.
- Cuando entregues refactors, muestra solo el contexto necesario.
- Si necesitas comparar opciones, da solo criterios y recomendación final.
- Evita duplicar la misma idea en varias secciones.
- Si una sección no aporta valor, omítela.

### Regla de claridad mínima
Aunque uses compresión ultra, nunca sacrifiques:
- precisión técnica
- seguridad en el cambio
- nombres de archivos
- impacto esperado
- decisión tomada: reutilizar / estandarizar / crear nuevo

### Política operativa de token saving
- Default: **ultra**
- Si el problema requiere explicación sensible o riesgo alto, puedes subir claridad localmente en ese punto, pero vuelve a ultra inmediatamente después.
- Prefiere bullets sobre párrafos.
- Prefiere “antes/después” breve sobre explicación narrativa.
- Prefiere rutas de archivo exactas sobre descripciones largas.
- Prefiere decisiones concretas sobre discusión extensa.

## Alcance de ejecución

Objetivo solicitado:

$ARGUMENTS

Si `$ARGUMENTS` está vacío, asume que debes analizar el proyecto completo.

Si `$ARGUMENTS` contiene una ruta de carpeta o feature, limita la auditoría y refactorización a ese scope, pero considera dependencias relacionadas si impactan directamente el análisis.

Ejemplos:
- `/rn-arch-audit`
- `/rn-arch-audit src/features/chat`
- `/rn-arch-audit src/features/auth`
- `/rn-arch-audit src/core/stores`

## Contexto arquitectónico esperado

La app sigue una arquitectura modular orientada por features, con una separación clara entre:
- app: bootstrap y navegación
- core: infraestructura y servicios compartidos globalmente
- design-system: sistema visual reutilizable
- features: dominio y casos de uso del negocio
- assets/types: recursos y contratos compartidos

Usa esta estructura como referencia obligatoria:

```txt
src/
├── app/                            # Capa de aplicación: punto de entrada, composición global y navegación
│   ├── AppProviders.tsx            # Wrapper raíz con providers globales (StoreProvider, ThemeProvider, QueryClient, etc.)
│   ├── navigation/                 # Configuración completa de React Navigation
│   │   ├── RootNavigator.tsx       # Orquestador principal: decide qué flujo renderizar (auth, onboarding, main)
│   │   ├── AuthNavigator.tsx       # Flujo de autenticación
│   │   ├── MainNavigator.tsx       # Flujo autenticado principal
│   │   ├── routes.ts               # Constantes centralizadas de nombres de rutas
│   │   ├── types.ts                # Param lists y tipos de navegación
│   │   └── options.ts              # screenOptions, headers y configuración compartida de navegación
│   └── components/                 # Componentes exclusivos de la capa app (ej: ErrorBoundary, SplashGate)
│
├── core/                           # Infraestructura compartida globalmente, sin lógica visual de negocio
│   ├── api/                        # Cliente HTTP, interceptores, configuración base de requests/responses
│   ├── config/                     # Variables de entorno, flags, constantes globales, configuración runtime
│   ├── helpers/                    # Helpers transversales de bajo nivel (toast, formatters genéricos, etc.)
│   ├── i18n/                       # Internacionalización: setup, namespaces, locales y utilidades de traducción
│   ├── providers/                  # Providers transversales reutilizables a nivel app
│   ├── services/                   # Servicios de infraestructura y acceso a APIs/SDKs (authService, chatService, etc.)
│   ├── storage/                    # Abstracciones de persistencia (AsyncStorage, SecureStore, keychain, cache local)
│   ├── stores/                     # Stores MobX globales o transversales compartidos por múltiples features
│   │   ├── RootStore.ts            # Store raíz que compone e inyecta dependencias al resto de stores
│   │   ├── AuthStore.ts            # Estado global de autenticación/sesión
│   │   ├── ChatStore.ts            # Estado compartido del dominio chat, si realmente es transversal
│   │   ├── ThemeStore.ts           # Estado global de tema/apariencia
│   │   ├── StoreProvider.tsx       # Provider + contexto para exponer el RootStore a la app
│   │   ├── types.ts                # Tipos compartidos entre stores
│   │   └── index.ts                # Barrel export de stores y hooks relacionados
│   └── utils/                      # Utilidades genéricas puras, sin acoplamiento al dominio
│
├── design-system/                  # Sistema de diseño reutilizable, sin reglas de negocio
│   ├── tokens/                     # Design tokens: colores, spacing, typography, shadows, radius, zIndex, etc.
│   │   ├── colors.ts               # Paleta y semántica de color
│   │   ├── spacing.ts              # Escala de spacing
│   │   ├── typography.ts           # Tipografía, tamaños, pesos y line-heights
│   │   ├── shadows.ts              # Sombras y elevaciones
│   │   └── index.ts                # Barrel export de tokens
│   ├── components/                 # Componentes visuales reutilizables siguiendo Atomic Design
│   │   ├── atoms/                  # Piezas básicas: Button, Input, Text, Icon, Badge, Spinner
│   │   ├── molecules/              # Composición simple de atoms: FormField, Header, SearchBar, CardHeader
│   │   ├── organisms/              # Bloques complejos reutilizables: Forms, Layout sections, full headers
│   │   └── index.ts                # Barrel export de componentes del sistema de diseño
│   ├── hooks/                      # Hooks visuales o de experiencia de UI compartida (useTheme, useSpacing, etc.)
│   └── index.ts                    # Punto de entrada del design-system
│
├── features/                       # Módulos de negocio organizados por dominio (Feature-First)
│   ├── auth/                       # Feature de autenticación
│   │   ├── components/             # Componentes específicos de auth; no deben subirse al design-system si son de negocio
│   │   │   ├── atoms/
│   │   │   └── molecules/
│   │   ├── hooks/                  # View-models y lógica de pantalla; orquestación del feature
│   │   │   ├── useLoginScreen.ts
│   │   │   ├── useCodeScreen.ts
│   │   │   └── ...
│   │   ├── screens/                # Pantallas del feature; la vista debe permanecer lo más limpia posible
│   │   │   ├── LoginScreen/
│   │   │   │   ├── index.tsx       # Vista en JSX; sin lógica compleja
│   │   │   │   └── styles.ts       # StyleSheet propio de la pantalla
│   │   │   └── ...
│   │   ├── types/                  # Tipos específicos del dominio auth
│   │   └── index.ts                # Barrel export del feature
│   ├── onboarding/
│   ├── chat/
│   ├── classification/
│   └── index.ts
│
├── assets/                         # Recursos estáticos empaquetados con la app
│   ├── icons/
│   ├── images/
│   └── fonts/
│
└── types/                          # Tipos globales realmente compartidos
    ├── index.ts
    └── navigation.ts
```

## Reglas de interpretación del árbol

- `app/` define bootstrap y navegación, no lógica de negocio.
- `core/` es infraestructura compartida y transversal.
- `design-system/` contiene solo piezas visuales reutilizables y agnósticas del dominio.
- `features/` es el lugar principal para el código de negocio.
- `types/` global solo debe contener contratos realmente compartidos.
- Si algo solo lo usa una feature, debe vivir dentro de esa feature.
- Si algo contiene reglas de negocio, no pertenece al design-system.
- Si algo depende de infraestructura externa, evalúa si debe vivir en `core/services`, `core/api` o `core/storage`.

## Política de reutilización y estandarización

Antes de crear cualquier componente, función, hook, helper, store, servicio, tipo o utilidad nueva, debes seguir este orden obligatorio:

1. Buscar si ya existe algo equivalente o parcialmente reutilizable dentro del proyecto.
2. Evaluar si puede reutilizarse tal cual.
3. Si no encaja exactamente, evaluar si puede estandarizarse o extenderse sin romper compatibilidad ni introducir sobreingeniería.
4. Si existe duplicación o variantes inconsistentes, proponer una unificación hacia una versión más estándar y reutilizable.
5. Solo si no existe una opción razonable para reutilizar o estandarizar, crear una nueva implementación.
6. Toda nueva implementación debe diseñarse pensando en reutilización futura cuando tenga sentido.

### Regla práctica
Siempre debes comprobar primero:
- si ya existe el componente
- si ya existe la función
- si ya existe el hook
- si ya existe el helper
- si ya existe el tipo
- si ya existe el servicio
- si ya existe una pieza equivalente en `design-system`, `core`, `features` o `types`

### Criterio de decisión
- Si ya existe algo reutilizable: reutilízalo.
- Si existe pero está inconsistente o duplicado: estandarízalo o unifícalo.
- Si no existe: créalo de forma coherente con la arquitectura para futuras ocasiones.

### Restricciones
- No crear duplicados por conveniencia.
- No crear una variante nueva si una pequeña extensión de la existente resuelve el problema.
- No mover algo a `core` o `design-system` solo por reutilizarlo una segunda vez; primero valida si su abstracción realmente es estable y transversal.
- No sobreabstraer demasiado pronto.

### Obligación al responder
Cuando propongas o hagas un cambio, indica explícitamente cuál de estas decisiones tomaste:
- reutilizar
- estandarizar
- crear nuevo

Y explica brevemente por qué.

## Principios obligatorios

1. Prioriza arquitectura feature-based.
2. Cada feature debe ser autocontenida cuando sea razonable.
3. La UI no debe contener lógica de negocio compleja.
4. Los stores de MobX no deben convertirse en cajones globales.
5. El estado observable debe ser el mínimo necesario.
6. No todo debe ir a `core`; evita shared prematuro.
7. No mandes componentes de negocio al design-system.
8. Cada screen o componente complejo debe tener su estilo en archivo propio.
9. Si un archivo mezcla responsabilidades, divídelo.
10. Si hay sobreingeniería, simplifícala.
11. Si algo ya está bien, dilo claramente y no lo cambies por gusto.

## Reglas de implementación

### Pantallas
Toda screen debe dividirse en:
- `screens/[ScreenName]/index.tsx` → solo JSX
- `screens/[ScreenName]/styles.ts` → estilos
- `hooks/use[ScreenName].ts` → lógica y estado de pantalla

Nunca pongas lógica compleja en JSX.

### Estilos
- No usar estilos inline salvo casos dinámicos justificados.
- Cada screen o componente complejo debe tener su archivo de estilos propio.
- Si una pantalla o componente crece, extrae subcomponentes y estilos separados.

### Imports
- Usar siempre aliases.
- Prohibidos los imports relativos largos.

### MobX
- Todos los stores globales deben vivir en `src/core/stores/`.
- No crear stores globales dentro de features.
- Los stores deben ser pequeños, cohesivos y orientados a dominio.
- Usar `observer` solo donde realmente se consumen observables.
- No convertir todo el árbol en `observer`.
- Preferir estado local cuando no sea necesario globalizar.
- Si un store mezcla UI state, dominio y side effects de red, debes señalarlo.

### Componentes
- `design-system`: componentes genéricos, reutilizables y sin lógica de negocio.
- `features`: componentes específicos del dominio.
- No crear componentes directamente dentro de una screen si pueden reutilizarse o dividirse.
- Si hace falta, extraer: `types`, `helpers`, `hooks`, `services`, `stores`, `subcomponents`.

### Nombres
- Screen: `[Name]Screen`
- Hook de screen: `use[Name]Screen`
- Store: `[Name]Store`
- Componente: PascalCase
- Estilos: `styles.ts`
- Tipos: `types.ts` o `*.types.ts`
- Constantes: UPPER_SNAKE_CASE

### Navegación
- Rutas centralizadas en `src/app/navigation/routes.ts`
- Tipos de navegación centralizados en `src/app/navigation/types.ts`
- Cada stack o navigator debe estar tipado
- No navegar desde lógica de negocio si no es necesario
- Si un flujo auth/onboarding/main está mezclado, sepáralo

### i18n
- No hardcodear strings.
- Usar siempre `t('namespace.key')`.
- Las claves deben organizarse por feature y pantalla.

## Reglas prohibidas

- No crear `src/shared/`
- No meter lógica de negocio en pantallas
- No usar imports relativos largos
- No definir estilos inline sin justificación
- No crear stores globales dentro de features
- No duplicar componentes o helpers ya existentes
- No usar `any` salvo caso excepcional y explícitamente justificado
- No sobreingenierizar
- No convertir estado local en global sin necesidad

## Criterios de revisión obligatorios

### TypeScript
- Sin `any` innecesarios
- Sin tipos implícitos inseguros
- Tipos centralizados y reutilizables
- Tipado seguro para navegación, props, responses y stores

### ESLint
- Sin imports no usados
- Sin variables muertas
- Sin dependencias incorrectas en hooks
- Sin patrones propensos a bugs

### Performance
- Sin renders innecesarios
- Sin objetos o callbacks inline innecesarios
- Sin cálculos costosos en render
- Sin stores o providers demasiado amplios
- Sin leaks por efectos mal limpiados

### MobX
Revisa específicamente:
- qué componentes deberían ser `observer`
- cuáles no deberían ser `observer`
- si se observa demasiado estado en pantallas contenedoras
- si conviene dividir stores o sub-stores
- si hay computed values que deberían existir
- si hay acciones que deberían agruparse
- si hay lectura temprana de observables que amplifica renders
- si hay componentes muy grandes observando demasiadas dependencias
- si el store está mezclando dominio, UI state y networking

Aplica estas ideas:
- observar lo más cerca posible del consumo real
- componentes pequeños y específicos
- derivar datos con `computed` cuando tenga sentido
- evitar convertir todo en observable
- preferir estado local de React cuando no necesita ser global
- usar stores pequeños y cohesionados

### Navegación
Revisa:
- tipado centralizado de rutas y params
- seguridad de params
- navegación desde lugares incorrectos
- acoplamiento excesivo entre screens y navegación
- estructura de stacks, tabs y auth flow
- uso correcto de nested navigators
- separación entre navegación de app y lógica de negocio
- si las pantallas dependen demasiado del objeto `navigation`

### Memory leaks y side effects
Revisa:
- `useEffect` sin cleanup
- listeners sin unsubscribe
- timers sin limpiar
- reacciones de MobX no liberadas
- subscriptions mal gestionadas
- requests que sobreviven al unmount
- actualización de estado tras unmount
- closures obsoletas
- dependencias incorrectas en efectos
- side effects disparados desde lugares incorrectos

### Legibilidad y mantenibilidad
Evalúa:
- nombres de archivos y componentes
- tamaño de funciones y componentes
- JSX demasiado profundo
- condicionales complejas
- duplicación
- ramas difíciles de seguir
- responsabilidades mezcladas
- defaults implícitos
- archivos god files
- exceso de exports desordenados

### Componentización
Revisa:
- componentes gigantes
- props excesivas
- componentes difíciles de reutilizar
- componentes que deberían dividirse
- componentes del design-system faltantes
- componentes que no deben estar en design-system por ser de negocio
- oportunidades de composición
- oportunidades de crear container + presentational split cuando aporte claridad

## Flujo de revisión

0. Identifica primero si ya existen piezas reutilizables o estandarizables dentro del scope y sus dependencias.
1. Analiza todo el scope y sus dependencias relacionadas.
2. Enumera problemas arquitectónicos y de performance.
3. Prioriza quick wins.
4. Ejecuta primero refactors de alto impacto y bajo riesgo.
5. Revisa el resultado y detecta regresiones.

## Formato de respuesta obligatorio

Usa formato ultra-comprimido por defecto.

1. Resumen ejecutivo
- problemas clave
- quick wins
- riesgos
- mejoras estructurales

2. Hallazgos priorizados
Para cada hallazgo:
- título
- severidad: alta / media / baja
- categoría
- problema
- causa
- acción
- impacto
- esfuerzo
- decisión tomada: reutilizar / estandarizar / crear nuevo

3. Refactors concretos
Para cada refactor:
- antes
- después
- archivos afectados
- archivos nuevos a crear
- motivo
- decisión tomada: reutilizar / estandarizar / crear nuevo

4. Propuesta de estructura
Si detectas problemas estructurales:
- árbol sugerido
- qué mover
- qué no mover

5. Checklist accionable
- hoy
- esta semana
- después

## Reglas de trabajo

- Antes de crear algo nuevo, busca primero si ya existe algo reutilizable, estandarizable o extensible.
- Mantén modo ultra-comprimido siempre que no comprometa precisión técnica.
- No hagas cambios masivos sin justificar.
- No sobreingenierices.
- No conviertas todo en store global.
- No saques cosas a core si siguen siendo de feature.
- No metas componentes de negocio al design-system.
- No apliques memoización por reflejo.
- Si algo está bien, dilo.
- Si faltan datos, trabaja con supuestos razonables y explícitalos.

## Modo de ejecución

Trabaja por fases:

Fase 1:
- inspecciona la estructura general
- enumera problemas arquitectónicos

Fase 2:
- revisa stores, navegación, hooks, screens y components
- detecta quick wins de rendimiento y mantenibilidad

Fase 3:
- ejecuta primero refactors de alto impacto y bajo riesgo

Fase 4:
- vuelve a revisar el resultado
- detecta regresiones
- valida consistencia arquitectónica

Empieza por la estructura general del proyecto, luego stores y navegación, y por último baja a archivos concretos.