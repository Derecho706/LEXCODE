# lexcode

Herramienta interactiva de estudio para Derecho.

Aplicación Flutter de aprendizaje gamificado inspirada en Duolingo. Incluye un temario de 7 unidades (nociones generales, delitos, protección de datos, propiedad intelectual, ciberseguridad, firma y comercio, nuevas tecnologías), cada una con 3 lecciones y un examen de 10 preguntas, más un examen final de 70 preguntas. Se aprueba con el 70 %, se ganan vidas y estrellas, y el progreso se guarda localmente con `shared_preferences`. No requiere backend ni conexión a internet.

## ¿Qué hace?

- **Temario de 7 unidades:** Nociones Generales, Desafíos y Delitos, Protección de
  Datos, Propiedad Intelectual, Ciberseguridad, Firma y Comercio y Nuevas Tecnologías.
- Cada unidad incluye **3 lecciones** (texto teórico + quiz) y un **examen de 10
  preguntas**. El **examen final** tiene 70 preguntas y desbloquea un reconocimiento.
- **Mecánica de juego:** 3 vidas, estrellas por evaluación, desbloqueo secuencial,
  explicación y fuente PDF en cada respuesta, y mascota con 19 estados.
- **Reglas:** se aprueba con el 70 %; reprobar un examen quita una vida; aprobar el
  final otorga +10 estrellas. El progreso se guarda y se puede reiniciar.

## Flujo

`Landing → Temario → Unidades → Lecciones (teoría + quiz) → Examen de unidad → Examen final → Reconocimiento`

## Tecnologías

Flutter 3.50.0 / Dart 3.14.0 · flutter_riverpod · shared_preferences · google_fonts ·
flutter_animate · material_ui · flutter_test / flutter_lints

## Estructura

```text
lib/
├── main.dart, app.dart      entrada y configuración de la app
├── core/                    tema oscuro y assets de la mascota
├── data/                    currículo y examen final
├── features/                landing, units, lessons, theory, quiz, victory, recognition
├── models/                  GameState, Question, Unit
├── providers/               aprobado, vidas, estrellas y reinicio
├── services/                persistencia con SharedPreferences
└── widgets/                 vidas, estrellas, progreso, ruta y mascota
assets/images/               20 ilustraciones PNG
test/                        pruebas de reglas y widgets
```

## Requisitos

- Flutter SDK 3.50.0 stable (Dart ^3.14.0)

## Cómo probarlo

Requiere Flutter 3.50.0 stable (Dart ^3.14.0).

```bash
flutter pub get
flutter test
flutter analyze
flutter run
```

`flutter test` ejecuta las pruebas de `test/widget_test.dart` (umbral de aprobación, persistencia e integridad del currículo). `flutter analyze` comprueba el código y `flutter run` inicia la app para probar el flujo completo: temario → lecciones → exámenes → reconocimiento.
