import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quizz_app/questions.dart';

class QuizProvider with ChangeNotifier {
  List<QuizQuestion> _questions = [];
  int _currentQuestionIndex = 0;
  int _score = 0;

  List<QuizQuestion> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  int get score => _score;

  Future<void> fetchQuizQuestions() async {
    final response = await http.get(Uri.parse(
        'https://opentdb.com/api.php?amount=48&category=31&difficulty=easy&type=multiple'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _questions = (data['results'] as List)
          .map((questionData) => QuizQuestion.fromJson(questionData))
          .toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load quiz questions');
    }
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }

  void incrementScore() {
    _score++;
    notifyListeners();
  }
}
