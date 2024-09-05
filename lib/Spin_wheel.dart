import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/globals.dart';
import 'package:quizz_app/globals.dart' as globals;
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class SpinWheel extends StatefulWidget {
  const SpinWheel({super.key});

  @override
  State<SpinWheel> createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel> {
  final List<int> items = [10, 20, 30];
  final selected = BehaviorSubject<int>();
  int rewards = 0;
  bool isSpinning = false;
  bool isButtonEnabled = true;
  DateTime? lastSpinTime;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    _checkLastSpinTime();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => _updateTime());
  }

  @override
  void dispose() {
    selected.close();
    timer?.cancel();
    super.dispose();
  }

  Future<void> _checkLastSpinTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? lastSpinTimestamp = prefs.getInt('lastSpinTimestamp');
    if (lastSpinTimestamp != null) {
      lastSpinTime = DateTime.fromMillisecondsSinceEpoch(lastSpinTimestamp);
      if (DateTime.now().difference(lastSpinTime!).inHours < 24) {
        setState(() {
          isButtonEnabled = false;
        });
      }
    }
  }

  Future<void> _setLastSpinTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(
        'lastSpinTimestamp', DateTime.now().millisecondsSinceEpoch);
  }

  void _updateTime() {
    if (lastSpinTime != null) {
      if (DateTime.now().difference(lastSpinTime!).inHours >= 24) {
        setState(() {
          isButtonEnabled = true;
          lastSpinTime = null;
        });
      }
    }
  }

  String _getRemainingTime() {
    if (lastSpinTime == null) return '24:00:00';
    Duration difference = DateTime.now().difference(lastSpinTime!);
    Duration remaining = Duration(hours: 24) - difference;
    return '${remaining.inHours.toString().padLeft(2, '0')}:${(remaining.inMinutes % 60).toString().padLeft(2, '0')}:${(remaining.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  Color _getColor(int index) {
    if (index % 3 == 0) {
      return Color(0xFF059212); // First color
    } else if (index % 3 == 1) {
      return Color(0xFFFFD230); // Second color
    } else {
      return Colors.blue; // Third color
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF088395),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF088395),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/coin.png',
                  scale: 15,
                ),
                SizedBox(width: 5),
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
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              child: FortuneWheel(
                selected: selected.stream,
                animateFirst: false,
                items: [
                  for (int item in items)
                    FortuneItem(
                      child: Text(
                        item.toString(),
                        style: GoogleFonts.cairo(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: FortuneItemStyle(
                        color: _getColor(item),
                        borderColor: Colors.black,
                        borderWidth: 2.0,
                      ),
                    ),
                ],
                onAnimationEnd: () {
                  setState(() {
                    rewards = items[selected.value];
                    isSpinning = false;
                    globals.setCoins(globals.coins + rewards);
                    isButtonEnabled = false;
                  });
                  _setLastSpinTime();
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Center(
                          child: Text(
                            "مبروك",
                            style: GoogleFonts.cairo(
                              fontSize: 22,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        content: Text(
                          "لقد تحصلت على $rewards نقطة ",
                          style: GoogleFonts.cairo(
                            fontSize: 22,
                            fontWeight: FontWeight.w400,
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
                },
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: isSpinning || !isButtonEnabled
                    ? () {
                        if (!isButtonEnabled) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text(
                                  " الوقت المتبقي ${_getRemainingTime()}",
                                  style: GoogleFonts.cairo(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.right,
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
                                            backgroundColor: Color(0xFFFFD230),
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              vertical: 15,
                                              horizontal: 10,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "إغلاق",
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
                      }
                    : () {
                        setState(() {
                          isSpinning = true;
                          selected.add(Fortune.randomInt(0, items.length));
                        });
                      },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFFFFD230),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal: 10,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isButtonEnabled ? "تدوير" : "تدوير",
                      style: GoogleFonts.cairo(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
