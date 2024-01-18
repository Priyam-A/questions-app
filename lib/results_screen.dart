import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_2/models/question.dart';
import 'package:project_2/summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.quesList,
    required this.ansList,
    required this.onReload,
  });
  final void Function() onReload;
  final List<Question> quesList;
  final List<String> ansList;
  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];
    for (int i = 0; i < quesList.length; i++) {
      summary.add(
        {
          'index': i,
          'question': quesList[i].text,
          'correctAns': quesList[i].answers[0],
          'selectedAns': ansList[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summary = getSummary();
    final numTotalQuestions = quesList.length;
    final numCorrectQuestions = summary.where((item) {
      return item['correctAns'] == item['selectedAns'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "You answered $numCorrectQuestions out of $numTotalQuestions correctly!",
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 28,
                //fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Summary(summary),
            const SizedBox(
              height: 20,
            ),
            TextButton.icon(
              onPressed: onReload,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: Text(
                "Start over",
                style: GoogleFonts.lato(
                  fontSize: 18,
                ),
              ),
              icon: const Icon(
                Icons.refresh,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
