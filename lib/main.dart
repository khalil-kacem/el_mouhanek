import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app/Questionmodel.dart';
import 'package:quizz_app/dailyquizz.dart';
import 'package:quizz_app/gg.dart';
import 'package:quizz_app/levels_page.dart';
import 'package:quizz_app/quiz%20page.dart';
import 'package:quizz_app/quiz_page-numbers.dart';
import 'package:quizz_app/quiz_page_hidden_p1.dart';
import 'package:quizz_app/start_screen.dart';
import 'question provider.dart'; // Assuming you renamed the file
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'globals.dart' as globals;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await globals.loadPreferences();
  MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QuizProvider()..fetchQuizQuestions(),
      child: MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => Start_screen(),
        ),
      );
    });
    return Scaffold(
      body: Stack(
        children: [
          // Background image with blur effect
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/grit.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
          // Logo in the middle
          Center(
            child: SizedBox(
              width: 400, // Adjust width as needed
              height: 500, // Adjust height as needed
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/grit.png',
                    width: 320,
                    height: 320,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Consumer<QuizProvider>(
        builder: (context, quizProvider, child) {
          if (quizProvider.questions.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          final question =
              quizProvider.questions[quizProvider.currentQuestionIndex];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  question.question,
                  style: TextStyle(fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                ...question.incorrectAnswers.map((answer) => AnswerButton(
                      answer: answer,
                      isCorrect: false,
                      quizProvider: quizProvider,
                    )),
                AnswerButton(
                  answer: question.correctAnswer,
                  isCorrect: true,
                  quizProvider: quizProvider,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class AnswerButton extends StatelessWidget {
  final String answer;
  final bool isCorrect;
  final QuizProvider quizProvider;

  AnswerButton({
    required this.answer,
    required this.isCorrect,
    required this.quizProvider,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (isCorrect) {
          quizProvider.incrementScore();
          quizProvider.nextQuestion();
        }
      },
      child: Text(answer),
    );
  }
}
