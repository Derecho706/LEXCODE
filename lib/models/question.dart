class Question {
  final String q;
  final List<String> options;
  final int correct;
  final String exp;
  final String? fuente;
  const Question({
    required this.q,
    required this.options,
    required this.correct,
    required this.exp,
    this.fuente,
  });
}
