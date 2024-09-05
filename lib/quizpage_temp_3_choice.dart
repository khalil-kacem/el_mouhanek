import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/Falseanswer.dart';
import 'package:quizz_app/Successanswer.dart';
import 'package:quizz_app/admob/Ads.dart';
import 'package:quizz_app/globals.dart';
import 'package:quizz_app/quiz%20page.dart';
import 'globals.dart' as globals;

class quizpage_temp_3_choice extends StatefulWidget {
  final List<String> options;
  final String id;
  final String hinte;
  final bool hintlocked;

  final String questionText; // Optional: only if needed for template 1
  const quizpage_temp_3_choice(
      {super.key,
      required this.options,
      required this.hinte,
      required this.questionText,
      required this.hintlocked,
      required this.id});

  @override
  State<quizpage_temp_3_choice> createState() => _quizpage_temp_3_choiceState();
}

class _quizpage_temp_3_choiceState extends State<quizpage_temp_3_choice> {
  final List<String> arabicLetters = [
    'أ',
    'ب',
    'ت',
    'ث',
    'ج',
    'ح',
    'خ',
    'د',
    'ذ',
    'ر',
    'ز',
    'س',
    'ش',
    'ص',
    'ض',
    'ط',
    'ظ',
    'ع',
    'غ',
    'ف',
    'ق',
    'ك',
    'ل',
    'م',
    'ن',
    'ه',
    'و',
    'ي',
    ' ',
    'ا'
  ];

  TextEditingController formController = TextEditingController();
  List<TextEditingController> answerControllers = [];
  Set<String> correctAnswers = Set<String>();
  List<String> guessedWords = [];
  String formText = '';
  final Ads ads = Ads();
  bool ok = true;
  final player = AudioPlayer();
  Future<void> playsound1() async {
    if (isplayed == true) {
      String audiopath = "newsounds/click.mp3";
      await player.play(AssetSource(audiopath));
    }
  }

  Future<void> playsound2() async {
    if (isplayed == true) {
      String audiopath = "newsounds/hunch.mp3";
      await player.play(AssetSource(audiopath));
    }
  }

  Future<void> playsound3() async {
    if (isplayed == true) {
      String audiopath = "newsounds/type.wav";
      await player.play(AssetSource(audiopath));
    }
  }

  Future<void> playsound4() async {
    if (isplayed == true) {
      String audiopath = "newsounds/delete.wav";
      await player.play(AssetSource(audiopath));
    }
  }

  Future<void> playsound5() async {
    if (isplayed == true) {
      String audiopath = "newsounds/wrong_answer.mp3";
      await player.play(AssetSource(audiopath));
    }
  }

  Future<void> playsound6() async {
    if (isplayed == true) {
      String audiopath = "newsounds/coin.wav";
      await player.play(AssetSource(audiopath));
    }
  }

  void showHint() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              widget.hinte,
              style: GoogleFonts.cairo(
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Center(
                child: SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      playsound1();
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFFFFD230),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(
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
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    answerControllers =
        List.generate(widget.options.length, (_) => TextEditingController());
  }

  @override
  void dispose() {
    formController.dispose();
    for (var controller in answerControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void addToForm(String letter) {
    setState(() {
      if (letter == '<') {
        if (formText.isNotEmpty) {
          formText = formText.substring(0, formText.length - 1);
        }
      } else {
        formText += letter;
      }
      formController.text = formText;
    });

    for (int i = 0; i < widget.options.length; i++) {
      if (formText == widget.options[i] && !correctAnswers.contains(formText)) {
        answerControllers[i].text = formText;
        correctAnswers.add(formText);
        guessedWords.add(formText);

        formText = '';
        formController.text = '';

        if (correctAnswers.length == widget.options.length) {
          playsound2();
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Succesanswer(id: widget.id);
              });
        }

        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Determine the number of columns based on screen width
    int crossAxisCount = (screenWidth / 60).floor();
    double containerHeight = MediaQuery.of(context).size.height *
        0.35; // 35% of screen height or adjust as needed
    containerHeight = containerHeight > 280
        ? 280
        : containerHeight; // Ensure height does not exceed 280
    final List<Widget> answerContainers =
        List.generate(guessedWords.length, (index) {
      return SingleChildScrollView(
        child: Container(
          width: 80,
          height: 30,
          margin: EdgeInsets.all(2.0),
          child: TextFormField(
            controller: TextEditingController(text: guessedWords[index]),
            readOnly: true,
            style: GoogleFonts.cairo(
                fontSize: 12, fontWeight: FontWeight.w800, color: Colors.white),
            textAlign: TextAlign.end,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: Color(0xFF071952).withOpacity(0.9),
            ),
          ),
        ),
      );
    });

    return Scaffold(
      backgroundColor: Color(0xFF219C90),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF071952),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "مرحلة ${widget.id}",
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
            child: InkWell(
              onTap: () {
                playsound6();
              },
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
                    globals.coins.toString(),
                    style: GoogleFonts.cairo(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ), // Replace with your image asset path
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF071952),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.questionText,
                      style: GoogleFonts.cairo(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Wrap(
            children: answerContainers,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    playsound5();
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Falseanswer();
                        });
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF37B7C3).withOpacity(0.90),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.spellcheck,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Center(
                child: Container(
                  width: 200,
                  child: TextFormField(
                    controller: formController,
                    readOnly: true,
                    style: GoogleFonts.cairo(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                    textAlign: TextAlign.end,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: Color(0xFF37B7C3).withOpacity(0.9),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              SizedBox(
                width: 60,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    playsound3();
                    addToForm('<');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF37B7C3).withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.backspace_outlined,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            height: containerHeight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0x0037B7C3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: 1.25,
                  ),
                  itemCount: arabicLetters.length,
                  itemBuilder: (BuildContext context, int index) {
                    String arabicLetter = arabicLetters[index];
                    return InkWell(
                      onTap: () {
                        playsound3();
                        addToForm(arabicLetter);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white.withOpacity(0.25),
                          ),
                          alignment: Alignment.center,
                          child: arabicLetter == ' '
                              ? Center(
                                  child: Container(
                                    width: double.infinity,
                                  ),
                                )
                              : Text(
                                  arabicLetter,
                                  style: GoogleFonts.cairo(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.grey.shade900,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 180,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      playsound1();
                      if (!ok) {
                        showHint();
                      }
                      if ((coins >= 20) && (ok == true)) {
                        setState(() {
                          globals.setCoins(globals.coins - 20);
                          ok = false;
                        });
                        print(ok);
                        showHint();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFFFFD230).withOpacity(0.90),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (ok == true)
                          Row(
                            children: [
                              Text(
                                "  تلميح",
                                style: GoogleFonts.cairo(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.right,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "(20 ن)",
                                style: GoogleFonts.cairo(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        if (ok == false)
                          Row(
                            children: [
                              Text(
                                "  تلميح",
                                style: GoogleFonts.cairo(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 90,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      playsound1();
                      ads.showRewardedAd();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFFFFD230).withOpacity(0.90),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Image.asset(
                      "assets/video.png",
                      scale: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ]),
      ),
    );
  }
}
