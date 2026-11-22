import 'question.dart';

class Lesson {
  final String id;
  final String title;
  final String theoryText;
  final List<Question> questions;
  const Lesson({required this.id, required this.title, required this.theoryText, required this.questions});
}

class Unit {
  final String id;
  final String title;
  final String icon;
  final String desc;
  final List<Lesson> lessons;
  final List<Question> exam;
  const Unit({required this.id, required this.title, required this.icon,
              required this.desc, required this.lessons, required this.exam});
}