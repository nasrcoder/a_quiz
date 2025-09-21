import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/questions.dart';
import '../widgets/answer_button.dart';


class QusetionsScreen extends StatefulWidget {
  final void Function(String answer) onSelectAnswer;

  const QusetionsScreen( {required this.onSelectAnswer, super.key,});

  @override
  State<QusetionsScreen> createState() => _QusetionsScreenState();
}

class _QusetionsScreenState extends State<QusetionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    currentQuestionIndex++;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 25,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 28),
            ...currentQuestion.ShuffledAnswers.map((answer) {
              return Container(
                margin: EdgeInsets.all(8),
                child: AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
