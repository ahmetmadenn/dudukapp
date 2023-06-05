import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String kul_secimi = "Kopek";
  final oynatici = AudioPlayer();

  AudioPlayer audioPlayer = AudioPlayer();

  bool isPlaying = false;

  void toggleAudio() {
    if (isPlaying) {
      oynatici.pause();
    } else {
      if (kul_secimi == "Ambulans") {
        oynatici.play(AssetSource('voices/ambulansvoice.mp3'));
      } else if (kul_secimi == 'Siren') {
        oynatici.play(AssetSource('voices/sirenn.mp3'));
      } else if (kul_secimi == 'Kopek') {
        oynatici.play(AssetSource('voices/dogvoice.mp3'));
      } else if (kul_secimi == 'Duduk') {
        oynatici.play(AssetSource('voices/depremduduksesi.mp3'));
      }
    }

    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
            title: const Text('Acil Durum Düdüğü'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    toggleAudio();
                  },
                  child: Container(
                      height: 180,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          image: DecorationImage(
                              image: AssetImage('assets/images/pictwo.jpg')),
                          borderRadius: BorderRadius.circular(100)),
                      padding: EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'S.O.S',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.white),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Ses için Düdüğe tıklayın.',
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 20,
                              color: Colors.orangeAccent,
                            )),
                        SizedBox(height: 20),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Durdurmak için tekrar tıklayın.',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Colors.orangeAccent,
                            )),
                        SizedBox(height: 50),
                      ],
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Lütfen bir ses tipi seçiniz:',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 40),
                    DropdownButton(
                        value: kul_secimi,
                        items: [
                          DropdownMenuItem(
                              child: Text('Düdük'), value: 'Duduk'),
                          DropdownMenuItem(
                              child: Text('Siren'), value: 'Siren'),
                          DropdownMenuItem(
                              child: Text('Ambulans'), value: 'Ambulans'),
                          DropdownMenuItem(
                              child: Text('Köpek'), value: 'Kopek'),
                        ],
                        onChanged: (value) {
                          setState(() {
                            kul_secimi = value.toString();
                          });
                        }),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
