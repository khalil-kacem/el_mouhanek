import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingQuestionScreen extends StatefulWidget {
  const LoadingQuestionScreen({super.key});

  @override
  State<LoadingQuestionScreen> createState() => _LoadingQuestionScreenState();
}

class _LoadingQuestionScreenState extends State<LoadingQuestionScreen> {
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.fastLinearToSlowEaseIn,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            Center(
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFF219C90),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        offset: Offset(0, 10),
                      )
                    ]),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "مرحلة 1",
                        style: GoogleFonts.cairo(
                          fontSize: 22, // Text size
                          fontWeight: FontWeight.w800, // Text weight
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SpinKitPouringHourGlassRefined(color: Color(0xFFFFD230))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
