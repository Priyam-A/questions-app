import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'styled_text.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Opacity(opacity:0.9,child: Image.asset('assets/images/quiz-logo.png', height: 250, width: 250)),
          Image.asset(
            'assets/images/quiz-logo.png',
            height: 250,
            width: 250,
            color: const Color.fromARGB(200, 255, 255, 255),
          ),
          const SizedBox(
            height: 75,
          ),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.outfit(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          TextButton.icon(
            onPressed: startQuiz,
            icon: const Icon(Icons.arrow_right_alt),
            style: TextButton.styleFrom(
              iconColor: Colors.white,
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }
}
