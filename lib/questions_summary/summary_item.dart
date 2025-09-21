import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'question_identifier.dart';

class SummaryItem extends StatelessWidget {
  final Map<String, Object> itemData;
  const SummaryItem({super.key, required this.itemData});

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            questionIndex: itemData['question_index'] as int ,
            isCorrectAnswer: isCorrectAnswer,
          ),
          SizedBox(width: 20),
          Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemData['question'] as String,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(itemData['user_answer'] as String,
                  style: GoogleFonts.alumniSans(
                    fontSize: 18,
                    color: Color.fromARGB(255, 64, 244, 178),
                    letterSpacing: 0.8,
                    fontWeight: FontWeight.w600,
                  )),
              Text(itemData['correct_answer'] as String,
                  style: GoogleFonts.asul(
                    fontSize: 16,
                    color:  Color.fromARGB(255, 150, 198, 241),
                     letterSpacing: 0.8,
                    fontWeight: FontWeight.w400,
                  )),
            ],
          ),
          ),
        ],
      ),
    );
  }
}
