import 'dart:ffi';

class Question {
  final int id;
  final String questionText;
  final List<String> options;
  final List<String> options_correct;

  final int correctAnswerIndex;
  final String templateType;
  final String imageUrl; // Optional: only if needed for template 1
  final String answer; // Optional: only if needed for template 1
  final String hinte; // Optional: only if needed for template 1
  final bool hintlocked; // Optional: only if needed for template 1

  Question({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    required this.templateType,
    this.options_correct = const [], // Default empty list
    this.imageUrl = '', // Default empty string for template 2
    this.answer = '', // Default empty string for template 2
    this.hinte = '', // Default empty string for template 2
    required this.hintlocked,
  });
}
