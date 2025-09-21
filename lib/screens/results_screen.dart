// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/widgets/my_text.dart';
import '/questions_summary/questions_summary.dart';
import '/data/questions.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final VoidCallback onRestart;
  const ResultsScreen({required this.chosenAnswers, required this.onRestart});
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Answered  $numCorrectQuestions  out  $numTotalQuestions  of  Questions Correctly. ',
              style: GoogleFonts.acme(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 172, 117, 240),
                letterSpacing: 2,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            QuestionsSummary(summaryData),
            SizedBox(height: 30),
            TextButton.icon(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 141, 56, 245),
              ),
              onPressed: onRestart,
              icon: Icon(Icons.refresh, size: 30),
              label: MyText(mytext: 'Restart Quiz. !', style: GoogleFonts.actor(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
