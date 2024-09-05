import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class Enterquestion_temp1 extends StatefulWidget {
  final List<String> options;
  final String imageUrl; // Optional: only if needed for template 1
  final String id;
  final String templateType;

  const Enterquestion_temp1({
    super.key,
    required this.options,
    required this.imageUrl,
    required this.id,
    required this.templateType,
  });

  @override
  State<Enterquestion_temp1> createState() => _Enterquestion_temp1State();
}

class _Enterquestion_temp1State extends State<Enterquestion_temp1> {
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
                        "مرحلة ${widget.id}",
                        style: GoogleFonts.cairo(
                          fontSize: 22, // Text size
                          fontWeight: FontWeight.w800, // Text weight
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if (widget.templateType == "1")
                        Text(
                          "تخمين لاعبي الفريق",
                          style: GoogleFonts.cairo(
                            fontSize: 18,
                            fontWeight: FontWeight.w500, // Text weight
                            color: Colors.white,
                          ),
                        ),
                      if (widget.templateType == "2")
                        Text(
                          "التخمين",
                          style: GoogleFonts.cairo(
                            fontSize: 18,
                            fontWeight: FontWeight.w500, // Text weight
                            color: Colors.white,
                          ),
                        ),
                      if (widget.templateType == "3" ||
                          widget.templateType == "4")
                        Text(
                          "التخمين",
                          style: GoogleFonts.cairo(
                            fontSize: 18,
                            fontWeight: FontWeight.w500, // Text weight
                            color: Colors.white,
                          ),
                        ),
                      if (widget.templateType == "5" ||
                          widget.templateType == "7")
                        Text(
                          "التخمين",
                          style: GoogleFonts.cairo(
                            fontSize: 18,
                            fontWeight: FontWeight.w500, // Text weight
                            color: Colors.white,
                          ),
                        ),
                      if (widget.templateType == "6")
                        Text(
                          "تخمين اللاعب المعتزل",
                          style: GoogleFonts.cairo(
                            fontSize: 18,
                            fontWeight: FontWeight.w500, // Text weight
                            color: Colors.white,
                          ),
                        ),
                      if (widget.templateType == "8")
                        Text(
                          "ترتيب",
                          style: GoogleFonts.cairo(
                            fontSize: 18,
                            fontWeight: FontWeight.w500, // Text weight
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
