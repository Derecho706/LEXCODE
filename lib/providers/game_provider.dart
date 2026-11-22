import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/game_state.dart';
import '../services/storage_service.dart';

final storageProvider = Provider<StorageService>((ref) => throw UnimplementedError());

final gameProvider = NotifierProvider<GameNotifier, GameState>(GameNotifier.new);

class GameNotifier extends Notifier<GameState> {
  static const double umbralAprobacion = 0.70;

  @override
  GameState build() => ref.read(storageProvider).read();

  void _update(GameState s) {
    state = s;
    ref.read(storageProvider).save(s);
  }

  bool aprobado(int correctas, int total) =>
      total > 0 && correctas / total >= umbralAprobacion;

  int estrellasDeTema(int correctas, int total) =>
      total == 0 ? 0 : ((correctas / total) * 10).round();

  void responderQuizLeccion(String lessonId, int correctas, int total) {
    if (!aprobado(correctas, total)) {
      if (!state.completedLessons.contains(lessonId)) {
        _update(state.copyWith(
          failedLessons: {...state.failedLessons, lessonId},
        ));
      }
      return;
    }

    final puntaje = estrellasDeTema(correctas, total);
    final anterior = state.lessonScores[lessonId] ?? 0;
    final mejor = puntaje > anterior ? puntaje : anterior;
    _update(state.copyWith(
      stars: state.stars + (mejor - anterior),
      completedLessons: {...state.completedLessons, lessonId},
      failedLessons: state.failedLessons.where((id) => id != lessonId).toSet(),
      lessonScores: {...state.lessonScores, lessonId: mejor},
    ));
  }

  void responderQuizUnidad(String unitId, int correctas, int total) {
    if (!aprobado(correctas, total)) {
      _update(state.copyWith(hearts: (state.hearts - 1).clamp(0, 3)));
    } else {
      _update(state.copyWith(completedUnits: {...state.completedUnits, unitId}));
    }
  }

  void responderExamenFinal(int correctas, int total) {
    if (!aprobado(correctas, total)) {
      _update(state.copyWith(hearts: (state.hearts - 1).clamp(0, 3)));
    } else {
      _update(state.copyWith(
        stars: state.stars + 10,
        reconocimientoFinal: true,
      ));
    }
  }

  void reiniciarProgreso() => _update(const GameState());
}
