import 'package:material_ui/material_ui.dart';
import '../../models/unit.dart';
import '../quiz/quiz_screen.dart';

class TheoryScreen extends StatelessWidget {
  final Lesson lesson;
  final Unit unit;
  const TheoryScreen({
    super.key,
    required this.lesson,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(lesson.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(child: Text(lesson.theoryText)),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => QuizScreen(
                    preguntas: lesson.questions,
                    esExamenUnidad: false,
                    id: lesson.id,
                    lesson: lesson,
                    unit: unit,
                  ),
                ),
              ),
              child: const Text('ENTENDIDO, PRACTICAR'),
            ),
          ],
        ),
      ),
    );
  }
}
