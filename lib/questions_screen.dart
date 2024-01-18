import 'package:flutter/material.dart';
import 'package:project_2/answer_button.dart';
//import 'package:project_2/data/quiz_questions.dart';
import 'package:project_2/models/question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.addAns, this.quesList, {super.key});
  final void Function(String) addAns;
  final List<Question> quesList;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<QuestionsScreen> {
  int idx = 0;
  
  void answerQuestion(String selAns,corrAns) {
    widget.addAns(selAns);
    setState(() {
      idx += 1;
    });
  }

  @override
  Widget build(context) {
    final Question ques = widget.quesList[idx];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              ques.text,
              style: GoogleFonts.cairo(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            ...ques.getShuffled().map((item) {
              return AnswerButton(
                answer: item,
                func: () {
                  answerQuestion(item,ques.answers[0]);
                },
              );
            }),
            /*
            AnswerButton(
              answer: ques.answers[0],
              func: () {},
            ),
            AnswerButton(
              answer: ques.answers[1],
              func: () {},
            ),
            AnswerButton(
              answer: ques.answers[2],
              func: () {},
            ),
            AnswerButton(
              answer: ques.answers[3],
              func: () {},
            ),
            */
          ],
        ),
      ),
    );
  }
}
