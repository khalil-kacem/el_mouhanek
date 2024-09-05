import 'package:flutter/material.dart';
import 'Questionmodel.dart';

class QuestionProvider with ChangeNotifier {
  List<Question> _questions = [
    Question(
      hintlocked: false,
      id: 1,
      questionText: 'Who is this famous football player?',
      options: [
        "ميسي",
        "رونالدو",
        "نيمار",
        "مبابي",
        "هازارد",
        "كوتينيو",
        "سواريس",
        "ديبالا",
        "صلاح",
        "اوزيل",
        "راموس"
      ],
      correctAnswerIndex: 0, // Index of the correct answer in the options list
      templateType: '1',
      imageUrl: 'assets/images/italy 2022.png',
    ),
    // Add more questions as needed
  ];

  int _currentQuestionIndex = 0;

  Question get currentQuestion => _questions[_currentQuestionIndex];

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }
}
