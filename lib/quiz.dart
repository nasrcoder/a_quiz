import 'package:flutter/material.dart';
import 'data/questions.dart';
import 'screens/qusetions_screen.dart';
import 'screens/results_screen.dart';
import 'screens/start_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

   List<String> _selectedAnswers = [];

  var activeScreen = 'start-Screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-Screen';
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswers.add(answer);

    if (_selectedAnswers.length == questions.length) {
      activeScreen = 'results-Screen';
      setState(() {});
      
    }
  }

  void restartQuiz() {
    activeScreen = 'questions-Screen';
    setState(() {});
    _selectedAnswers = [];
  }

  @override
  Widget build(BuildContext context) {
    
    Widget screenWidget = StartScreen(startQuiz: switchScreen);
    if (activeScreen == 'questions-Screen') {
      screenWidget = QusetionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'results-Screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: _selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 78, 13, 151),
                const Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ), 
          child: screenWidget,
        ),
      ),
    );
  }
}

