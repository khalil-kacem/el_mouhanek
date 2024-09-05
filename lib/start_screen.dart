import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:quizz_app/Loading-question_screen.dart';
import 'package:quizz_app/Loadingtogotolevel.dart';
import 'package:quizz_app/Questionmodel.dart';
import 'package:quizz_app/Spin_wheel.dart';
import 'package:quizz_app/admob/Ads.dart';
import 'package:quizz_app/levels_page.dart';
import 'package:quizz_app/quiz%20page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/quiz_page-numbers.dart';
import 'package:quizz_app/quiz_page_hidden_p1.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'globals.dart' as globals;

class Start_screen extends StatefulWidget {
  @override
  State<Start_screen> createState() => _Start_screenState();
}

class _Start_screenState extends State<Start_screen> {
  FlutterSoundPlayer _soundPlayer = FlutterSoundPlayer();
  BannerAd? bannerAd;
  bool isLoaded = false;
  final player = AudioPlayer();
  Future<void> playsound() async {
    if (globals.isplayed == true) {
      String audiopath = "newsounds/click.mp3";
      await player.play(AssetSource(audiopath));
    }
  }

  void load() {
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: "ca-app-pub-6180915705872902/4206081460",
        listener: BannerAdListener(onAdLoaded: (ad) {
          setState(() {
            isLoaded = true;
          });
        }, onAdFailedToLoad: (ad, error) {
          ad.dispose();
        }),
        request: AdRequest())
      ..load();
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  void dispose() {
    bannerAd!.dispose();
    super.dispose();
  }

  bool _isSoundOn = true;

  Future<void> _launchURL() async {
    const url = 'https://grits.services/';
    await launch(url);
  }

  Future<void> _launchURLfb() async {
    const urlfb = 'https://www.facebook.com/profile.php?id=61551372089361';
    await launch(urlfb);
  }

  Future<void> _launchURLinsta() async {
    const urlinsta = 'https://www.instagram.com/grit.agency_/?next=%2F';
    await launch(urlinsta);
  }

  Future<void> _launchURLx() async {
    const urlx = 'https://x.com/grit631984';
    await launch(urlx);
  }

  void _toggleSound() {
    setState(() {
      _isSoundOn = !_isSoundOn;
    });
  }

  void _playSound() async {
    try {} catch (e) {
      print('Error playing sound: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    void _showCongratulationDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xFF05ABC4),
            actions: <Widget>[
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          playsound();
                          setState(() {
                            globals
                                .setissound(globals.issound = !globals.issound);
                          });
                          if (globals.issound == false) {
                            setState(() {
                              globals.setIsPlayed(globals.isplayed = false);
                            });
                          }
                          if (globals.issound == true) {
                            setState(() {
                              globals.setIsPlayed(globals.isplayed = true);
                            });
                          }
                          print('mrigel');
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFF059212),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            globals.issound
                                ? Image.asset(
                                    'assets/speak.png',
                                    scale: 15,
                                  )
                                : Image.asset(
                                    'assets/mute.png',
                                    scale: 15,
                                  ),
                            Text(
                              "الصوت",
                              style: GoogleFonts.cairo(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          playsound();
                          _launchURLfb();
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFF4267B2),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/facebookkk.png',
                              scale: 15,
                            ),
                            Text(
                              "تابعنا",
                              style: GoogleFonts.cairo(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          playsound();
                          _launchURLinsta();
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFFC13584),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/social.png',
                              scale: 15,
                            ),
                            Text(
                              "تابعنا",
                              style: GoogleFonts.cairo(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          playsound();
                          _launchURLx();
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.black,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/twitterr.png',
                              scale: 15,
                            ),
                            Text(
                              "تابعنا",
                              style: GoogleFonts.cairo(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          playsound();

                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFFC40C0C),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.home,
                              size: 35,
                            ),
                            Text(
                              "خروج",
                              style: GoogleFonts.cairo(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        playsound();
                      },
                      child: Text.rich(
                        TextSpan(
                          text: "سياسة الخصوصية",
                          style: GoogleFonts.cairo(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }

    final setting = AlertDialog(
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
        "لقد تحصلت على  نقطة ",
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
    return Scaffold(
      backgroundColor: Color(0xFF05ABC4),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Image.asset(
                    "assets/mouhanek_gif.gif",
                    height: 320,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      playsound();
                      Ads().showAd();

                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            context = context;
                            return Level_page();
                          });
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            context = context;
                            return Loadingtogotolevel();
                          });
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF059212), // Text color
                      elevation: 5, // Elevation
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // BorderRadius
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10), // Padding
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "إبدأ",
                          style: GoogleFonts.cairo(
                            fontSize: 22, // Text size
                            fontWeight: FontWeight.w800, // Text weight
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      playsound();
                      _showCongratulationDialog();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color(0xFFFFD230),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "الاعدادات",
                          style: GoogleFonts.cairo(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "ألعاب",
                          style: GoogleFonts.cairo(
                              fontSize: 22, // Text size
                              fontWeight: FontWeight.w800, // Text weight
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: _launchURL,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Container(
                              height: 80,
                              child: Image.asset("assets/grit.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    InkWell(
                      onTap: () {
                        playsound();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SpinWheel()));
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              context = context;
                              return Loadingtogotolevel();
                            });
                      },
                      child: Column(
                        children: [
                          Text(
                            "عجلة الحظ",
                            style: GoogleFonts.cairo(
                                fontSize: 22, // Text size
                                fontWeight: FontWeight.w800, // Text weight
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Container(
                              height: 80,
                              child: Image.asset("assets/wheel.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Center(
                      child: isLoaded
                          ? SizedBox(
                              width: bannerAd!.size.width.toDouble(),
                              height: bannerAd!.size.height.toDouble(),
                              child: AdWidget(
                                ad: bannerAd!,
                              ),
                            )
                          : SizedBox(),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
