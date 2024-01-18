import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key,required this.answer, required this.func});
  final void Function() func;
  final String answer;
  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: func,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            backgroundColor: const Color.fromARGB(255, 246, 160, 219),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
          ),
          child: Text(
            answer,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
