import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexcode/services/storage_service.dart';
import 'package:lexcode/providers/game_provider.dart';
import 'package:lexcode/data/curriculum.dart';
import 'package:lexcode/data/final_exam.dart';
import 'package:lexcode/core/mascot_assets.dart';
import 'package:lexcode/features/quiz/quiz_screen.dart';
import 'package:lexcode/features/units/units_screen.dart';

Future<ProviderContainer> _contenedor() async {
  final storage = await StorageService.load();
  return ProviderContainer(
    overrides: [storageProvider.overrideWithValue(storage)],
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() => SharedPreferences.setMockInitialValues({}));

  test('el quiz de lección requiere 70 por ciento', () async {
    final container = await _contenedor();
    final notifier = container.read(gameProvider.notifier);

    expect(notifier.aprobado(7, 10), isTrue);
    expect(notifier.aprobado(6, 10), isFalse);
  });

  test('una lección reprobada queda como no pasada y no desbloquea la siguiente', () async {
    final container = await _contenedor();
    final notifier = container.read(gameProvider.notifier);

    notifier.responderQuizLeccion('u1l1', 2, 5);

    final state = container.read(gameProvider);
    expect(state.completedLessons, isEmpty);
    expect(state.failedLessons, contains('u1l1'));
    expect(state.stars, 0);
  });

  test('una lección aprobada se marca pasada, quita no pasado y no duplica estrellas', () async {
    final container = await _contenedor();
    final notifier = container.read(gameProvider.notifier);

    notifier.responderQuizLeccion('u1l1', 2, 5);
    notifier.responderQuizLeccion('u1l1', 5, 5);
    notifier.responderQuizLeccion('u1l1', 5, 5);

    final state = container.read(gameProvider);
    expect(state.completedLessons, contains('u1l1'));
    expect(state.failedLessons, isEmpty);
    expect(state.stars, 10);
    expect(state.lessonScores['u1l1'], 10);
  });

  test('failedLessons se persiste entre sesiones', () async {
    final container = await _contenedor();
    container.read(gameProvider.notifier).responderQuizLeccion('u1l1', 1, 5);
    await Future<void>.delayed(const Duration(milliseconds: 10));

    final storage = await StorageService.load();
    expect(storage.read().failedLessons, contains('u1l1'));
  });

  test('el curriculum tiene 7 unidades con exámenes y lecciones completas', () {
    expect(curriculum.length, 7);
    for (final unit in curriculum) {
      expect(unit.exam.length, 10);
      expect(unit.lessons.length, 3);
      for (final lesson in unit.lessons) {
        expect(lesson.questions.length, inInclusiveRange(3, 5));
        expect(lesson.theoryText, isNotEmpty);
      }
    }
  });

  test('el examen final tiene 70 preguntas bien formadas', () {
    expect(finalExam.length, 70);
    for (final q in finalExam) {
      expect(q.options.length, 4);
      expect(q.correct, inInclusiveRange(0, q.options.length - 1));
      expect(q.q, isNotEmpty);
      expect(q.exp, isNotEmpty);
      expect(q.fuente, isNotEmpty);
    }
  });

  test('el reconocimiento final se activa al completar todo el flujo', () async {
    final container = await _contenedor();
    final notifier = container.read(gameProvider.notifier);

    for (final unit in curriculum) {
      notifier.responderQuizUnidad(unit.id, 10, 10);
    }
    expect(container.read(gameProvider).completedUnits.length, 7);

    notifier.responderExamenFinal(50, 70);
    expect(container.read(gameProvider).reconocimientoFinal, isTrue);
  });

  test('el examen final requiere cuando menos 70 por ciento', () async {
    final container = await _contenedor();
    final notifier = container.read(gameProvider.notifier);

    notifier.responderExamenFinal(48, 70);
    expect(container.read(gameProvider).hearts, 2);
    expect(container.read(gameProvider).reconocimientoFinal, isFalse);

    notifier.responderExamenFinal(49, 70);
    expect(container.read(gameProvider).stars, 10);
    expect(container.read(gameProvider).reconocimientoFinal, isTrue);
  });

  test('todas las imágenes referenciadas existen en assets/images', () {
    final faltantes = mascotAssets.values
        .where((path) => !File(path).existsSync())
        .toList();
    expect(faltantes, isEmpty, reason: 'Faltan: $faltantes');
  });

  testWidgets('un quiz de lección reprobado muestra no pasado y reintento', (tester) async {
    final storage = await StorageService.load();
    final unit = curriculum.first;
    final lesson = unit.lessons.first;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [storageProvider.overrideWithValue(storage)],
        child: MaterialApp(
          home: QuizScreen(
            preguntas: lesson.questions,
            esExamenUnidad: false,
            id: lesson.id,
            lesson: lesson,
            unit: unit,
          ),
        ),
      ),
    );

    for (final q in lesson.questions) {
      final incorrecta = q.options.asMap().entries
          .firstWhere((entry) => entry.key != q.correct)
          .value;
      await tester.tap(find.text(incorrecta));
      await tester.pumpAndSettle();
      await tester.tap(find.text('COMPROBAR'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('CONTINUAR'));
      await tester.pumpAndSettle();
    }

    expect(find.textContaining('Lección no pasada'), findsOneWidget);
    expect(find.text('REINTENTAR QUIZ'), findsOneWidget);
    expect(find.text('VOLVER A LA UNIDAD'), findsOneWidget);

    final saved = await StorageService.load();
    expect(saved.read().failedLessons, contains(lesson.id));
    expect(saved.read().completedLessons, isEmpty);
  });

  testWidgets('un quiz de lección aprobado continúa dentro de la unidad', (tester) async {
    final storage = await StorageService.load();
    final unit = curriculum.first;
    final lesson = unit.lessons.first;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [storageProvider.overrideWithValue(storage)],
        child: MaterialApp(
          home: QuizScreen(
            preguntas: lesson.questions,
            esExamenUnidad: false,
            id: lesson.id,
            lesson: lesson,
            unit: unit,
          ),
        ),
      ),
    );

    for (final q in lesson.questions) {
      await tester.tap(find.text(q.options[q.correct]));
      await tester.pumpAndSettle();
      await tester.tap(find.text('COMPROBAR'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('CONTINUAR'));
      await tester.pumpAndSettle();
    }

    expect(find.text('¡Lección completada!'), findsOneWidget);
    await tester.tap(find.text('CONTINUAR'));
    await tester.pumpAndSettle();

    expect(find.text('Lecciones de la unidad'), findsOneWidget);
    expect(find.textContaining('Unidad 1'), findsWidgets);

    final saved = await StorageService.load();
    expect(saved.read().completedLessons, contains(lesson.id));
    expect(saved.read().failedLessons, isEmpty);
  });

  testWidgets('el caminito de unidades cabe en una pantalla pequeña', (tester) async {
    tester.view.physicalSize = const Size(320, 480);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final storage = await StorageService.load();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [storageProvider.overrideWithValue(storage)],
        child: const MaterialApp(home: UnitsScreen()),
      ),
    );

    expect(find.text('Temario Completo'), findsOneWidget);
    expect(find.textContaining('Unidad 1'), findsWidgets);
    expect(tester.takeException(), isNull);
  });

  testWidgets('CONTINUAR sigue visible en una pantalla pequeña', (tester) async {
    tester.view.physicalSize = const Size(320, 480);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final storage = await StorageService.load();
    final pregunta = curriculum.first.lessons.first.questions.first;

    await tester.pumpWidget(
      ProviderScope(
        overrides: [storageProvider.overrideWithValue(storage)],
        child: MaterialApp(
          home: QuizScreen(
            preguntas: [pregunta],
            esExamenUnidad: false,
            id: 'u1l1',
          ),
        ),
      ),
    );

    await tester.tap(find.text(pregunta.options.first));
    await tester.pumpAndSettle();
    await tester.tap(find.text('COMPROBAR'));
    await tester.pumpAndSettle();

    expect(find.text('CONTINUAR'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
