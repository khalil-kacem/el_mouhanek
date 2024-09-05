import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/Falseanswer.dart';
import 'package:quizz_app/Successanswer.dart';
import 'package:quizz_app/admob/Ads.dart';
import 'package:quizz_app/globals.dart';
import 'package:quizz_app/start_screen.dart';
import 'globals.dart' as globals;

class Guessing extends StatefulWidget {
  final String answer;
  final String id;
  final String imageUrl;
  final String hinte;
  final bool hintlocked;

  const Guessing({
    Key? key,
    required this.answer,
    required this.imageUrl,
    required this.id,
    required this.hinte,
    required this.hintlocked,
  }) : super(key: key);

  @override
  State<Guessing> createState() => _GuessingState();
}

class _GuessingState extends State<Guessing> {
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

  @override
  void dispose() {
    formController.dispose();
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
    if (formText == widget.answer) {
      playsound2();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Succesanswer(id: widget.id);
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
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
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Determine the number of columns based on screen width
    int crossAxisCount = (screenWidth / 60).floor();
    double containerHeight = MediaQuery.of(context).size.height *
        0.35; // 35% of screen height or adjust as needed
    containerHeight = containerHeight > 280
        ? 280
        : containerHeight; // Ensure height does not exceed 280
    return Scaffold(
      backgroundColor: const Color(0xFF219C90),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF071952),
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
                  const SizedBox(
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
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF071952),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Image.asset(
                  widget.imageUrl,
                  height: 200,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
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
                        return const Falseanswer();
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF37B7C3).withOpacity(0.90),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.spellcheck,
                      size: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
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
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: const Color(0xFF37B7C3).withOpacity(0.9),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
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
                    backgroundColor: const Color(0xFF37B7C3).withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Center(
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
                const SizedBox(width: 10),
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
                      backgroundColor:
                          const Color(0xFFFFD230).withOpacity(0.90),
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
        ],
      ),
    );
  }
}
