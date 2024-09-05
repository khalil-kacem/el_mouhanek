import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizz_app/Enterquestion_temp1.dart';
import 'package:quizz_app/Questionmodel.dart';
import 'package:quizz_app/quiz%20page.dart';
import 'package:quizz_app/quiz_page-numbers.dart';
import 'package:quizz_app/quiz_page_hidden_p1.dart';
import 'package:quizz_app/quizpage_rankingplayers.dart';
import 'package:quizz_app/quizpage_temp_3_choice.dart';
import 'package:quizz_app/quizpage_temp_9adechmnwehedtsemi.dart';
import 'package:quizz_app/quiztemplate_guessing.dart';
import 'package:quizz_app/start_screen.dart';
import 'globals.dart' as globals;

class Level_page extends StatefulWidget {
  const Level_page({super.key});

  @override
  State<Level_page> createState() => _Level_pageState();
}

class _Level_pageState extends State<Level_page> {
  @override
  Widget build(BuildContext context) {
    final player = AudioPlayer();
    Future<void> playsound1() async {
      if (globals.isplayed == true) {
        String audiopath = "newsounds/click.mp3";
        await player.play(AssetSource(audiopath));
      }
    }

    List<Question> _questions = [
      Question(
        id: 1,
        questionText: 'من هو بطل الدوري الانجليزي 2020 ؟',
        hinte: 'نادي يلقب بالريدز',
        hintlocked: false,
        options: [],
        answer: "ليفربول",
        correctAnswerIndex: 0,
        templateType: '3',
        imageUrl: 'assets/italy 2022.png',
      ),
      Question(
        id: 2,
        questionText: 'من هو النادي الذي فاز بدوري أبطال أوروبا 2024 ؟',
        hinte: 'نادي حصل على 15 دوري ابطال اوروبا',
        hintlocked: false,
        options: [
          "ميسي",
          "رونالدو",
          "نيمار",
          "مبابي",
          "هازارد",
          "كوتينيو",
          "سواريس",
          "ديبالا",
          "صلاح",
          "اوزيل",
          "راموس"
        ],
        answer: "ريال مدريد",
        correctAnswerIndex: 0,
        templateType: '3',
        imageUrl: 'assets/italy 2022.png',
      ),
      Question(
        id: 3,
        questionText: '',
        hinte: '',
        hintlocked: false,
        options: [
          "نافاس",
          "كوفاسيتش",
          "بايل",
          "ايسكو",
          "ناتشو",
          "كاسيميرو",
          "كارفخال",
          "مارسيلو",
          "رونالدو",
          "راموس",
          "مودريتش"
        ],
        correctAnswerIndex: 0,
        templateType: '1',
        imageUrl: 'assets/realmadrid2017.jpg',
      ),
      Question(
        id: 4,
        questionText: '',
        hintlocked: false,
        hinte: 'كرواتي يتكون اسمه من 7 حروف و يبدأ بحرف الميم',
        options: ["مودريتش"],
        answer: "مودريتش",
        correctAnswerIndex: 0,
        templateType: '2',
        imageUrl: 'assets/modric.jpg',
      ),
      Question(
        id: 5,
        questionText: 'ماهو اول رقم ارتداه ميسي؟',
        hintlocked: false,
        hinte: '3*10',
        options: ["ميسي", "رونالدو", "راموس"],
        answer: "30",
        correctAnswerIndex: 0,
        templateType: '4',
        imageUrl: 'assets/italy 2022.jpg',
      ),
      Question(
        id: 6,
        questionText: '',
        hintlocked: false,
        hinte: 'برتغالي يتكون اسمه من 4 حروف و يبدأ بحرف اللام',
        options: ["مودريتش"],
        answer: "لياو",
        correctAnswerIndex: 0,
        templateType: '2',
        imageUrl: 'assets/leao2.jpg',
      ),
      Question(
        id: 7,
        questionText: 'من يرتدي رقم 5 في ريال مدريد حاليا ؟',
        hintlocked: false,
        hinte: 'انجليزي كان يلعب في دورتموند',
        options: [
          "ميسي",
          "رونالدو",
          "نيمار",
          "مبابي",
          "هازارد",
          "كوتينيو",
          "سواريس",
          "ديبالا",
          "صلاح",
          "اوزيل",
          "راموس"
        ],
        answer: "بيلينجهام",
        correctAnswerIndex: 0,
        templateType: '3',
        imageUrl: 'assets/italy 2022.png',
      ),
      Question(
        id: 8,
        questionText: '',
        hintlocked: false,
        options: ["ماجواير"],
        hinte: ' انجليزي يتكون اسمه من 7 حروف و يبدأ بحرف الميم',
        answer: "ماجواير",
        correctAnswerIndex: 0,
        templateType: '2',
        imageUrl: 'assets/maguire.jpg',
      ),
      Question(
        id: 9,
        questionText: '',
        hintlocked: false,
        options: ["ماجواير"],
        answer: "مبابي",
        hinte: 'سلحفاة',
        correctAnswerIndex: 0,
        templateType: '2',
        imageUrl: 'assets/mbappehair.png',
      ),
      Question(
        id: 10,
        questionText: 'ما هو رقم دي يونج مع برشلونة حاليا؟',
        hintlocked: false,
        options: ["ميسي", "رونالدو", "راموس"],
        answer: "21",
        hinte: '15*2-9',
        correctAnswerIndex: 0,
        templateType: '4',
        imageUrl: 'assets/italy 2022.jpg',
      ),
      Question(
        id: 11,
        questionText: 'في اي عام اعتزل اوزيل؟',
        hintlocked: false,
        options: ["ميسي", "رونالدو", "راموس"],
        hinte: 'السنة التي فاز ريال مدريد بدوري ابطال اوروبا',
        answer: "2018",
        correctAnswerIndex: 0,
        templateType: '4',
        imageUrl: 'assets/italy 2022.jpg',
      ),
      Question(
        id: 12,
        questionText: 'من الذي فاز بالحذاء الذهبي 2021؟',
        hintlocked: false,
        hinte: 'اوروبي يتكون اسمه من 11 حرف',
        options: [
          "ميسي",
          "رونالدو",
          "نيمار",
          "مبابي",
          "هازارد",
          "كوتينيو",
          "سواريس",
          "ديبالا",
          "صلاح",
          "اوزيل",
          "راموس"
        ],
        answer: "ليفاندوفسكي",
        correctAnswerIndex: 0,
        templateType: '3',
        imageUrl: 'assets/italy 2022.png',
      ),
      Question(
        id: 13,
        questionText: '',
        hintlocked: false,
        hinte: 'ارتكاز اسباني يتكون اسمه من 5 حروف و يبدأ بحرف الراء',
        options: ["مودريتش"],
        answer: "رودري",
        correctAnswerIndex: 0,
        templateType: '2',
        imageUrl: 'assets/rodri.jpg',
      ),
      Question(
        id: 14,
        questionText:
            'احزر 5 لاعبين من قائمة منتخب الارجنتين في كاس العالم 2022',
        hintlocked: false,
        options: [
          "اميليانو",
          "أرماني",
          "رولي",
          "مولينا",
          "مونتيل",
          "روميرو",
          "جيرمان",
          "أوتاميندي",
          "مارتينيز",
          "أكونا",
          "تاجليافيكو",
          "فويث",
          "ديبول",
          "باريديس",
          "ماكاليستر",
          "جوميز",
          "رودريجيز",
          "انزو",
          "بالاسيوس",
          "ميسي",
          "لاوتارو",
          "دي ماريا",
          "جونزاليس",
          "الفاريز",
          "كوريا",
          "ديبالا",
        ],
        answer: "",
        correctAnswerIndex: 0,
        templateType: '5',
        imageUrl: 'assets/italy 2022.png',
      ),
      Question(
        id: 15,
        questionText: '',
        hintlocked: false,
        hinte: 'لاعب وسط في برشلونة',
        options: ["ماجواير"],
        answer: "بيدري",
        correctAnswerIndex: 0,
        templateType: '2',
        imageUrl: 'assets/pedrihaircut.png',
      ),
      Question(
        id: 16,
        questionText: '',
        options: ["ماجواير"],
        hintlocked: false,
        answer: "تشابي ألونسو",
        hinte: 'اسباني',
        correctAnswerIndex: 0,
        templateType: '6',
        imageUrl: 'assets/xabialons.png',
      ),
      Question(
        id: 17,
        questionText: 'ماهو رقم جيريمي دوكو مع مانشستر سيتي؟',
        hinte: '5*2+1',
        options: ["ميسي", "رونالدو", "راموس"],
        hintlocked: false,
        answer: "11",
        correctAnswerIndex: 0,
        templateType: '4',
        imageUrl: 'assets/italy 2022.jpg',
      ),
      Question(
        id: 18,
        questionText: 'من هم المرشحون 3  للكرة الذهبية 2019 ؟',
        hinte: 'منهم مدافع هولندي',
        hintlocked: false,
        options: [
          "ميسي",
          "فان دايك",
          "رونالدو",
        ],
        answer: "",
        correctAnswerIndex: 0,
        templateType: '7',
        imageUrl: 'assets/italy 2022.png',
      ),
      Question(
        id: 19,
        questionText: '',
        hintlocked: false,
        hinte: 'مدافع سويسري',
        options: ["مودريتش"],
        answer: "أكانجي",
        correctAnswerIndex: 0,
        templateType: '2',
        imageUrl: 'assets/akanji.jpg',
      ),
      Question(
        id: 20,
        questionText: '',
        options: ["ماجواير"],
        hintlocked: false,
        answer: "أوسيمين",
        hinte: 'افريقي نيجيري',
        correctAnswerIndex: 0,
        templateType: '2',
        imageUrl: 'assets/osimhen.png',
      ),
      Question(
        id: 21,
        questionText: 'ماهي جنسية اللاعب سابيتزر؟',
        options: [],
        hintlocked: false,
        hinte: 'منتخب يلعب فيه دافيد ألابا',
        answer: "نمساوي",
        correctAnswerIndex: 0,
        templateType: '3',
        imageUrl: 'assets/italy 2022.png',
      ),
      Question(
        id: 22,
        questionText: '',
        hintlocked: false,
        options: ["مودريتش"],
        answer: "كريستال بالاس",
        hinte: 'كريستال',
        correctAnswerIndex: 0,
        templateType: '2',
        imageUrl: 'assets/crystal_palace.jpg',
      ),
      Question(
        id: 23,
        questionText: 'رتب اللاعبين حسب الأكثر تسجيلا للاهداف',
        hinte: 'رونالدو اولا ميسي ثانيا و ليفاندوفسكي ثالثا',
        hintlocked: false,
        options: [
          "ميسي",
          "ليفاندوفسكي",
          "بنزيما",
          "ابراهيموفيتش",
          "كافاني",
          "دي بروين",
          "رونالدو",
          "سواريز",
        ],
        options_correct: [
          "رونالدو",
          "ميسي",
          "ليفاندوفسكي",
          "ابراهيموفيتش",
          "سواريز",
          "كافاني",
          "بنزيما",
          "دي بروين",
        ],
        answer: "",
        correctAnswerIndex: 0,
        templateType: '8',
        imageUrl: 'assets/italy 2022.png',
      ),
      Question(
        id: 24,
        questionText: 'رتب اللاعبين حسب الاكبر سنا',
        hinte: 'راشفورد اولا مبابي ثانيا ',
        hintlocked: false,
        options: [
          "راشفورد",
          "فودين",
          "يامال",
          "مبابي",
          "ساكا",
          "بيدري",
        ],
        options_correct: [
          "راشفورد",
          "مبابي",
          "فودين",
          "ساكا",
          "بيدري",
          "يامال",
        ],
        answer: "",
        correctAnswerIndex: 0,
        templateType: '8',
        imageUrl: 'assets/italy 2022.png',
      ),
      Question(
        id: 25,
        questionText: 'ماهو رقم كول بالمر مع تشيلسي ؟',
        hinte: '5*4',
        options: ["ميسي", "رونالدو", "راموس"],
        hintlocked: false,
        answer: "20",
        correctAnswerIndex: 0,
        templateType: '4',
        imageUrl: 'assets/italy 2022.jpg',
      ),
      Question(
        id: 26,
        questionText: '',
        options: ["مودريتش"],
        answer: "كوبو",
        hintlocked: false,
        hinte: 'اسمه يتكون من اربع حروف ',
        correctAnswerIndex: 0,
        templateType: '2',
        imageUrl: 'assets/kubo.jpg',
      ),
      Question(
        id: 27,
        questionText: '',
        options: ["مودريتش"],
        answer: "فالنسيا",
        hintlocked: false,
        hinte: 'نادي على اسم لاعب جناح لعب في مانشستر يونايتد',
        correctAnswerIndex: 0,
        templateType: '2',
        imageUrl: 'assets/valencia.jpg',
      ),
      Question(
        id: 28,
        questionText: 'من هم طرفي نهائي دوري ابطال اوروبا 2010؟',
        hinte: 'الروسونيري و البافاري ',
        hintlocked: false,
        options: [
          "بايرن ميونخ",
          "انتر",
        ],
        answer: "",
        correctAnswerIndex: 0,
        templateType: '7',
        imageUrl: 'assets/italy 2022.png',
      ),
      Question(
        id: 29,
        questionText: '',
        hinte: 'برازيلي',
        options: ["ماجواير"],
        hintlocked: false,
        answer: "كاكا",
        correctAnswerIndex: 0,
        templateType: '6',
        imageUrl: 'assets/kaka-removebg-preview.png',
      ),
      Question(
        id: 30,
        questionText: '',
        options: ["مودريتش"],
        answer: "موراتا",
        hintlocked: false,
        hinte: 'مهاجم اسباني',
        correctAnswerIndex: 0,
        templateType: '2',
        imageUrl: 'assets/morata.png',
      ),
      Question(
        id: 31,
        questionText: 'ماهو آخر رقم ارتداه بنزيما مع ليون؟',
        options: ["ميسي", "رونالدو", "راموس"],
        answer: "10",
        hinte: 'رقم اشتهر به ميسي',
        hintlocked: false,
        correctAnswerIndex: 0,
        templateType: '4',
        imageUrl: 'assets/italy 2022.jpg',
      ),
      Question(
        id: 32,
        questionText: 'من هو المنتخب الذي أقصى المنتخب الفرنسي في يورو 2020؟',
        hinte: 'دولة معروفة بالشكلاطة',
        hintlocked: false,
        options: [],
        answer: "سويسرا",
        correctAnswerIndex: 0,
        templateType: '3',
        imageUrl: 'assets/italy 2022.png',
      ),
      Question(
        id: 33,
        questionText: 'ماهي جنسية اللاعب سكرينيار؟',
        hintlocked: false,
        hinte: 'دولة تقع في وسط أوروبا محاذية لبولندا',
        options: [],
        answer: "سلوفاكي",
        correctAnswerIndex: 0,
        templateType: '3',
        imageUrl: 'assets/italy 2022.png',
      ),
      Question(
        id: 34,
        questionText: '',
        hinte: 'لاعب جورجي',
        hintlocked: false,
        options: ["مودريتش"],
        answer: "كفاراتسخيليا",
        correctAnswerIndex: 0,
        templateType: '2',
        imageUrl: 'assets/kvara.jpg',
      ),
      Question(
        id: 35,
        questionText: 'رتب اللاعبين حسب الطول',
        hintlocked: false,
        hinte: 'ابراهيموفيتش اولا هالاند ثانيا ',
        options: [
          "ابراهيموفيتش",
          "رونالدو",
          "كين",
          "هالاند",
          "فلاهوفيتش",
          "لوكاكو",
          "جيرو",
        ],
        options_correct: [
          "ابراهيموفيتش",
          "هالاند",
          "جيرو",
          "لوكاكو",
          "فلاهوفيتش",
          "كين",
          "رونالدو",
        ],
        answer: "",
        correctAnswerIndex: 0,
        templateType: '8',
        imageUrl: 'assets/italy 2022.png',
      ),
      Question(
        id: 36,
        questionText: '',
        hinte: "اسطورة برازيليه",
        options: ["ماجواير"],
        answer: "رونالدينيو",
        correctAnswerIndex: 0,
        hintlocked: false,
        templateType: '6',
        imageUrl: 'assets/ronaldinho1.png',
      ),
      Question(
        id: 37,
        questionText: 'رتب اللاعبين حسب الأكثر تتويجا بالبطولات',
        hinte: 'ميسي اولا ألفيش ثانيا ',
        hintlocked: false,
        options: [
          "إنييستا",
          "ميسي",
          "نوير",
          "فيراتي",
          "ألفيش",
          "رونالدو",
          "بوفون",
        ],
        options_correct: [
          "ميسي",
          "ألفيش",
          "إنييستا",
          "رونالدو",
          "نوير",
          "بوفون",
          "فيراتي",
        ],
        answer: "",
        correctAnswerIndex: 0,
        templateType: '8',
        imageUrl: 'assets/italy 2022.png',
      ),
      Question(
        id: 38,
        questionText: '',
        hinte: 'نادي الماني يتكون من 8 حروف ويبدا بحرف الشين',
        options: ["مودريتش"],
        hintlocked: false,
        answer: "شتوتغارت",
        correctAnswerIndex: 0,
        templateType: '2',
        imageUrl: 'assets/stutgart.jpg',
      ),
      Question(
        id: 39,
        questionText: 'من هو صاحب أسرع هاترك في الدوري الإنجليزي الممتاز؟',
        hinte: 'سنغالي لعب في ليفربول',
        options: [],
        answer: "ماني",
        hintlocked: false,
        correctAnswerIndex: 0,
        templateType: '3',
        imageUrl: 'assets/italy 2022.png',
      ),
      Question(
        id: 40,
        questionText: '',
        hinte: 'انجليزي و اسطورة من اساطير مانشستر يونايتد',
        options: ["ماجواير"],
        hintlocked: false,
        answer: "بيكهام",
        correctAnswerIndex: 0,
        templateType: '6',
        imageUrl: 'assets/bekham2.png',
      ),
      Question(
        id: 41,
        questionText: '',
        options: ["مودريتش"],
        answer: "مارتينيلي",
        hintlocked: false,
        hinte: 'يبدا اسمه بحرف الميم واسمه يتكون من 9 حروف',
        correctAnswerIndex: 0,
        templateType: '2',
        imageUrl: 'assets/martinelli.jpg',
      ),
      Question(
        id: 42,
        questionText: '',
        hintlocked: false,
        options: ["ماجواير"],
        answer: "سون",
        hinte: 'يتكون اسمه من 3 حروف',
        correctAnswerIndex: 0,
        templateType: '2',
        imageUrl: 'assets/son.png',
      ),
      Question(
        id: 43,
        questionText: 'رتب الأندية حسب الأكثر تتويجا بالبطولات',
        hinte: 'ريال مدريد اولا برشلونة ثانيا ',
        hintlocked: false,
        options: [
          "أياكس",
          "برشلونة",
          "بنفيكا",
          "ريال مدريد",
          "بورتو",
          "بايرن ميونخ",
          "مانشستر يونايتد",
        ],
        options_correct: [
          "ريال مدريد",
          "برشلونة",
          "بنفيكا",
          "بورتو",
          "بايرن ميونخ",
          "مانشستر يونايتد",
          "أياكس",
        ],
        answer: "",
        correctAnswerIndex: 0,
        templateType: '8',
        imageUrl: 'assets/italy 2022.png',
      ),
      Question(
        id: 44,
        questionText: 'في أي عام فاز رونالدو مع البرتغال بالبطولة الأوروبية ؟',
        options: ["ميسي", "رونالدو", "راموس"],
        hintlocked: false,
        hinte: 'سنة العاشرة لريال مدريد',
        answer: "2016",
        correctAnswerIndex: 0,
        templateType: '4',
        imageUrl: 'assets/italy 2022.jpg',
      ),
      Question(
        id: 45,
        questionText: 'أي نادٍ مرتبط بمصطلح "جالاكتيكوس"؟',
        options: [],
        hintlocked: false,
        answer: "ريال مدريد",
        hinte: 'نادي حامل 15 لقب دوري ابطال اوروبا',
        correctAnswerIndex: 0,
        templateType: '3',
        imageUrl: 'assets/italy 2022.png',
      ),
      Question(
        id: 46,
        questionText: '',
        hintlocked: false,
        options: ["مودريتش"],
        answer: "بولونيا",
        hinte: 'نادي ايطالي يتكون من 7 حروف',
        correctAnswerIndex: 0,
        templateType: '2',
        imageUrl: 'assets/bologne.jpg',
      ),
      Question(
        id: 47,
        questionText: 'ماهو رقم اللاعب أليخاندرو جارناتشو في مانشستر يونايتد؟',
        hintlocked: false,
        hinte: '4*3+5',
        options: ["ميسي", "رونالدو", "راموس"],
        answer: "17",
        correctAnswerIndex: 0,
        templateType: '4',
        imageUrl: 'assets/italy 2022.jpg',
      ),
      Question(
        id: 48,
        questionText: 'ماهي جنسية اللاعب أكسيل فيتسل؟',
        hinte: 'نفس جنسية كيفن دي بروين',
        hintlocked: false,
        options: [],
        answer: "بلجيكي",
        correctAnswerIndex: 0,
        templateType: '3',
        imageUrl: 'assets/italy 2022.png',
      ),
      Question(
        id: 49,
        questionText: '',
        hintlocked: false,
        options: ["ماجواير"],
        answer: "كيميتش",
        hinte: 'الماني يبدأ اسمه بحرف الكاف ',
        correctAnswerIndex: 0,
        templateType: '2',
        imageUrl: 'assets/kimich.png',
      ),
      Question(
        id: 50,
        questionText: '',
        options: ["ماجواير"],
        hintlocked: false,
        answer: "باستوني",
        hinte: 'ايطالي يبدأ اسمه بحرف الباء',
        correctAnswerIndex: 0,
        templateType: '2',
        imageUrl: 'assets/bastoni.jpg',
      ),
      // Add more questions as needed
    ];

    void showundisponibility() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
              child: Text(
                'هذه المرحلة مغلقة',
                style: GoogleFonts.cairo(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  playsound1();
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
                            "عودة",
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

    return Scaffold(
      backgroundColor: const Color(0xFF05ABC4),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                ),
                itemCount: _questions.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      playsound1();
                      if (index >= globals.a) return showundisponibility();

                      if (_questions[index].templateType == '1') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => quiz_page_hidden_p1(
                                      imageUrl: _questions[index].imageUrl,
                                      options: _questions[index].options,
                                      id: _questions[index].id.toString(),
                                    )));
                      }
                      if (_questions[index].templateType == '2') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Guessing(
                                      imageUrl: _questions[index].imageUrl,
                                      answer: _questions[index].answer,
                                      hinte: _questions[index].hinte,
                                      hintlocked: _questions[index].hintlocked,
                                      id: _questions[index].id.toString(),
                                    )));
                      }
                      if (_questions[index].templateType == '3') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuizPage(
                                      answer:
                                          _questions[index].answer.toString(),
                                      hinte: _questions[index].hinte,
                                      hintlocked: _questions[index].hintlocked,
                                      questionText: _questions[index]
                                          .questionText
                                          .toString(),
                                      id: _questions[index].id.toString(),
                                    )));
                      }
                      if (_questions[index].templateType == '4') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => quiz_page_numbers(
                                      answer:
                                          _questions[index].answer.toString(),
                                      questionText: _questions[index]
                                          .questionText
                                          .toString(),
                                      hinte: _questions[index].hinte,
                                      hintlocked: _questions[index].hintlocked,
                                      id: _questions[index].id.toString(),
                                    )));
                      }
                      if (_questions[index].templateType == '5') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    quizpage_temp_9adechmnwehedtsemi(
                                      options: _questions[index].options,
                                      questionText: _questions[index]
                                          .questionText
                                          .toString(),
                                      id: _questions[index].id.toString(),
                                    )));
                      }
                      if (_questions[index].templateType == '6') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Guessing(
                                      imageUrl: _questions[index].imageUrl,
                                      answer: _questions[index].answer,
                                      id: _questions[index].id.toString(),
                                      hinte: _questions[index].hinte,
                                      hintlocked: _questions[index].hintlocked,
                                    )));
                      }
                      if (_questions[index].templateType == '7') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => quizpage_temp_3_choice(
                                      options: _questions[index].options,
                                      questionText: _questions[index]
                                          .questionText
                                          .toString(),
                                      hinte: _questions[index].hinte,
                                      hintlocked: _questions[index].hintlocked,
                                      id: _questions[index].id.toString(),
                                    )));
                      }
                      if (_questions[index].templateType == '8') {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => quizpage_rankingplayers(
                                      options: _questions[index].options,
                                      options_correct:
                                          _questions[index].options_correct,
                                      questionText: _questions[index]
                                          .questionText
                                          .toString(),
                                      hinte: _questions[index].hinte,
                                      hintlocked: _questions[index].hintlocked,
                                      id: _questions[index].id.toString(),
                                    )));
                      }
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Enterquestion_temp1(
                                imageUrl: _questions[index].imageUrl,
                                options: _questions[index].options,
                                id: _questions[index].id.toString(),
                                templateType: _questions[index].templateType);
                          });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: (index >= globals.a)
                              ? Container(
                                  alignment: Alignment.center,
                                  child: Icon(
                                    Icons.lock,
                                    size: 40.0,
                                    color: Colors.grey,
                                  ),
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 8.0),
                                    Text(
                                      "المرحلة",
                                      style: GoogleFonts.cairo(
                                        fontSize: 22, // Text size
                                        fontWeight:
                                            FontWeight.w800, // Text weight
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      _questions[index].id.toString(),
                                      style: GoogleFonts.cairo(
                                        fontSize: 22, // Text size
                                        fontWeight:
                                            FontWeight.w800, // Text weight
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Image.asset(
                                      'assets/crown.png',
                                      scale: 15,
                                    ),
                                  ],
                                )),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
