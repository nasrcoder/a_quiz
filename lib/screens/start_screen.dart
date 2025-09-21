import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/my_text.dart';


class StartScreen extends StatelessWidget {
  final VoidCallback startQuiz;
  const StartScreen({required this.startQuiz, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            height: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          SizedBox(height: 80),
          MyText(
            mytext: 'Learn Flutter the Fun Way. !',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 237, 223, 252),
              fontSize: 24,
              fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(height: 30),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.deepPurpleAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
            ),
            onPressed: startQuiz,
            label: MyText(
              mytext: 'Start Quiz',
              style: GoogleFonts.lobster(fontSize: 24, letterSpacing: 2),
            ),
            icon: Icon(Icons.arrow_right_alt, size: 50),
          ),
        ],
      ),
    );
  }
}
