import 'package:flutter/material.dart';
import 'package:quizz_app/Successanswer.dart';

class DialogPage extends StatelessWidget {
  final String id;

  DialogPage({required this.id});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Succesanswer(id: id);
        },
      ).then((_) {});
    });

    return Scaffold(
      body: Center(
        child: Text('Navigated to Dialog Page'),
      ),
    );
  }
}
