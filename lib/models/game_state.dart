class GameState {
  final int hearts;
  final int stars;
  final Set<String> completedLessons;
  final Set<String> failedLessons;
  final Set<String> completedUnits;
  final Map<String, int> lessonScores;
  final bool reconocimientoFinal;

  const GameState({
    this.hearts = 3,
    this.stars = 0,
    this.completedLessons = const {},
    this.failedLessons = const {},
    this.completedUnits = const {},
    this.lessonScores = const {},
    this.reconocimientoFinal = false,
  });

  GameState copyWith({
    int? hearts,
    int? stars,
    Set<String>? completedLessons,
    Set<String>? failedLessons,
    Set<String>? completedUnits,
    Map<String, int>? lessonScores,
    bool? reconocimientoFinal,
  }) => GameState(
    hearts: hearts ?? this.hearts,
    stars: stars ?? this.stars,
    completedLessons: completedLessons ?? this.completedLessons,
    failedLessons: failedLessons ?? this.failedLessons,
    completedUnits: completedUnits ?? this.completedUnits,
    lessonScores: lessonScores ?? this.lessonScores,
    reconocimientoFinal: reconocimientoFinal ?? this.reconocimientoFinal,
  );
}
