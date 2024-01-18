import 'package:flutter/material.dart';
import 'package:project_2/data/quiz_questions.dart';
import 'package:project_2/models/question.dart';
import 'package:project_2/questions_screen.dart';
import 'package:project_2/results_screen.dart';
import 'package:project_2/welcome_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? currScreen;
  List<String> selAns = [];
  List<Question> quesList =[];
  //List<String> correctAnswerList=[];
  

  @override
  void initState() {
    currScreen = WelcomeScreen(changeScreen);
    super.initState();
  }
  
  void changeScreen() {
    quesList = List.of(questions);
    quesList.shuffle();
    setState(() {
      currScreen = QuestionsScreen(addAns,quesList);
    });
  }
  void addAns(String ans){
    selAns.add(ans);
  
    if (selAns.length==questions.length){
      setState((){
        currScreen = ResultsScreen(
          quesList: quesList,
          ansList: selAns,
          onReload: reload,
        );
        //selAns.clear();
        //quesList.clear();
      });
    }
  }
void reload(){
  quesList.clear();
  selAns.clear();
  setState((){
    currScreen = WelcomeScreen(changeScreen);
  });
}

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purple, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
          child: currScreen
        ),
      ),
//      ),
    );
  }
}
