// globals.dart
library globals;

import 'package:shared_preferences/shared_preferences.dart';

int a = 1;
int coins = 50;
String hint = "";
bool isplayed = true;
bool issound = true;

Future<void> savePreferences() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('a', a);
  await prefs.setInt('coins', coins);
  await prefs.setString('hint', hint);
  await prefs.setBool('isplayed', isplayed);
  await prefs.setBool('issound', issound);
}

Future<void> loadPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  a = prefs.getInt('a') ?? 1;
  coins = prefs.getInt('coins') ?? 50;
  hint = prefs.getString('hint') ?? "";
  isplayed = prefs.getBool('isplayed') ?? true;
  issound = prefs.getBool('issound') ?? true;
}

void setCoins(int value) {
  coins = value;
  savePreferences();
}

void seta(int value) {
  a = value;
  savePreferences();
}

void setIsPlayed(bool value) {
  isplayed = value;
  savePreferences();
}

void setissound(bool value) {
  issound = value;
  savePreferences();
}
