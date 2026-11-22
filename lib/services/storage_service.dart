import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import '../models/game_state.dart';

class StorageService {
  final SharedPreferences prefs;
  StorageService(this.prefs);

  static Future<StorageService> load() async =>
      StorageService(await SharedPreferences.getInstance());

  GameState read() => GameState(
    hearts: prefs.getInt('hearts') ?? 3,
    stars: prefs.getInt('stars') ?? 0,
    completedLessons: (prefs.getStringList('completedLessons') ?? []).toSet(),
    failedLessons: (prefs.getStringList('failedLessons') ?? []).toSet(),
    completedUnits: (prefs.getStringList('completedUnits') ?? []).toSet(),
    lessonScores: Map<String, int>.from(
      (jsonDecode(prefs.getString('lessonScores') ?? '{}') as Map).map(
        (k, v) => MapEntry(k as String, v as int),
      ),
    ),
    reconocimientoFinal: prefs.getBool('reconocimientoFinal') ?? false,
  );

  Future<void> save(GameState s) async {
    await prefs.setInt('hearts', s.hearts);
    await prefs.setInt('stars', s.stars);
    await prefs.setStringList('completedLessons', s.completedLessons.toList());
    await prefs.setStringList('failedLessons', s.failedLessons.toList());
    await prefs.setStringList('completedUnits', s.completedUnits.toList());
    await prefs.setString('lessonScores', jsonEncode(s.lessonScores));
    await prefs.setBool('reconocimientoFinal', s.reconocimientoFinal);
  }
}
