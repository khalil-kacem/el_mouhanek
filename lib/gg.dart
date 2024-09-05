import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Gg extends StatefulWidget {
  const Gg({super.key});

  @override
  State<Gg> createState() => _GgState();
}

class _GgState extends State<Gg> {
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          playsound1();
        },
        child: Text("please press me"));
  }

  Future<void> playsound1() async {
    String audiopath = "newsounds/new_mission.mp3";
    await player.play(AssetSource(audiopath));
  }
}
