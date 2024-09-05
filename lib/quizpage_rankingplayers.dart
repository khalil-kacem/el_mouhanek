import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/Falseanswer.dart';
import 'package:quizz_app/Successanswer.dart';
import 'package:quizz_app/admob/Ads.dart';
import 'package:quizz_app/globals.dart';
import 'package:quizz_app/start_screen.dart';
import 'globals.dart' as globals;

class quizpage_rankingplayers extends StatefulWidget {
  final List<String> options;
  final List<String> options_correct;
  final String hinte;
  final bool hintlocked;

  final String id;
  final String questionText;

  const quizpage_rankingplayers({
    super.key,
    required this.questionText,
    required this.id,
    required this.hinte,
    required this.options,
    required this.hintlocked,
    required this.options_correct,
  });

  @override
  State<quizpage_rankingplayers> createState() =>
      _quizpage_rankingplayersState();
}

class _quizpage_rankingplayersState extends State<quizpage_rankingplayers> {
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
    "ا"
  ];

  TextEditingController formController = TextEditingController();
  String formText = '';
  int currentRank = 1; // Track the current rank to be assigned
  List<String> selectedRanks = []; // Track the selected ranks
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

  void resetRanks() {
    setState(() {
      selectedRanks.clear();
      currentRank = 1;
      formText = '';
      formController.text = '';
    });
  }

  void addToForm(String letter) {
    setState(() {
      if (letter == '<') {
        // Handle backspace logic
        if (formText.isNotEmpty) {
          formText = formText.substring(0, formText.length - 1);
        }
      } else {
        if (!selectedRanks.contains(letter) &&
            currentRank <= widget.options.length) {
          formText += '$currentRank. $letter\n';
          selectedRanks.add(letter);
          currentRank++;
        }
      }
      formController.text = formText;
    });
    if (selectedRanks.length == widget.options.length) {
      if (selectedRanks.join() == widget.options_correct.join()) {
        playsound2();
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Succesanswer(id: widget.id);
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Falseanswer();
          },
        );
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
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF071952),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  widget.questionText,
                  style: GoogleFonts.cairo(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF37B7C3).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: widget.options.length,
                  itemBuilder: (BuildContext context, int index) {
                    String rank_player = widget.options[index];
                    return InkWell(
                      onTap: () {
                        playsound3();
                        addToForm(rank_player);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white.withOpacity(0.25),
                              ),
                              alignment: Alignment.center,
                              child: rank_player == ' '
                                  ? Center(
                                      child: Container(
                                        width: double.infinity,
                                      ),
                                    )
                                  : Text(
                                      rank_player,
                                      style: GoogleFonts.cairo(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.grey.shade900,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                            ),
                            if (selectedRanks.contains(rank_player))
                              Positioned(
                                top: 4,
                                right: 4,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 7, vertical: 3),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF071952),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text(
                                    (selectedRanks.indexOf(rank_player) + 1)
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              playsound3();
              resetRanks();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xFF37B7C3).withOpacity(0.5),
              ),
              padding: EdgeInsets.all(15),
              child: Icon(Icons.refresh),
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 180,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      playsound2();
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
        ],
      ),
    );
  }
}
