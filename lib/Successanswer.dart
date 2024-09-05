import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/levels_page.dart';
import 'package:quizz_app/quiz_page_hidden_p1.dart';
import 'package:quizz_app/start_screen.dart';
import 'globals.dart' as globals;

class Succesanswer extends StatefulWidget {
  final String id;

  const Succesanswer({super.key, required this.id});

  @override
  State<Succesanswer> createState() => _SuccesanswerState();
}

class _SuccesanswerState extends State<Succesanswer> {
  @override
  void initState() {
    super.initState();
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
                height: 250,
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
                        'أحسنت',
                        style: GoogleFonts.cairo(
                          fontSize: 22, // Text size
                          fontWeight: FontWeight.w700, // Text weight
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'لقد أكملت المرحلة ${widget.id} بنجاح',
                        style: GoogleFonts.cairo(
                          fontSize: 22, // Text size
                          fontWeight: FontWeight.w400, // Text weight
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Center(
                          child: SizedBox(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => Level_page(),
                                  ),
                                  (Route<dynamic> route) => false,
                                );
                                if (widget.id == globals.a.toString()) {
                                  globals.seta(globals.a + 1);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Color(0xFFFFD230),
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 10,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "تقدم",
                                    style: GoogleFonts.cairo(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
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
