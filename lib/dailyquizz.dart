import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/globals.dart';
import 'package:quizz_app/start_screen.dart';
import 'questionss.dart';
import 'Successanswer.dart';

class DailyQuiz extends StatelessWidget {
  const DailyQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuestionProvider(),
      child: Scaffold(
        backgroundColor: Color(0xFF219C90),
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Color(0xFF071952),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "مرحلة 5",
                style: GoogleFonts.cairo(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    'assets/coin.png',
                    scale: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    coins.toString(),
                    style: GoogleFonts.cairo(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ), // Replace with your image asset path
            ),
          ],
        ),
        body: Consumer<QuestionProvider>(
          builder: (context, questionProvider, child) {
            final question = questionProvider.currentQuestion;
            return Column(
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xFF071952),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        question.questionText,
                        style: GoogleFonts.cairo(
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ...question.options.asMap().entries.map((entry) {
                  int idx = entry.key;
                  String option = entry.value;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          if (idx == question.correctAnswerIndex) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Start_screen();
                              },
                            ).then((_) {
                              questionProvider.nextQuestion();
                            });
                          } else {
                            // Handle incorrect answer logic here
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFF071952).withOpacity(0.90),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text(
                          option,
                          style: GoogleFonts.cairo(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ],
            );
          },
        ),
      ),
    );
  }
}
