import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(MemePlayer());

class MemePlayer extends StatefulWidget {
  //track number integer variable to follow up a meme's track position in the list
  @override
  _MemePlayerState createState() => _MemePlayerState();
}

class _MemePlayerState extends State<MemePlayer> {
  int trackNumber = 0;
  //instantiate an audio player variable
  final audioPlayer = AudioPlayer();

  List<String> memeTracks = [
    'Kama_hakuna',
    'Iriz war iriz',
    'Bure kabisa',
    'Keep walking',
    'Tununulie shai',
    'That won\'t happen',
    'Niko pekee yangu',
  ];

  void playMeme(int trackNumber) {
    final memePlayer = AudioCache(fixedPlayer: audioPlayer);
    //Add meme and text
    memePlayer.play(memeTracks.elementAt(trackNumber) + '.wav');
  }

  void stopMeme() {
    audioPlayer.stop();
  }
  //change UI components from buttons to list elements

  Card buildButtons(int trackNumber) {
    return Card(
      child: ListTile(
        // style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
        leading: Icon(Icons.music_note_rounded,
        color: Colors.deepPurple,),
        title: Text(
          memeTracks.elementAt(trackNumber),
          style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
              fontSize: 20),
        ),
        onTap: () {
          setState(() {
            //check if the audio player instance is null, if so play the track, otherwise stop it
            audioPlayer != null ? playMeme(trackNumber) : stopMeme();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Meme Player'),
          backgroundColor: Colors.deepPurple,
        ),
        body: ListView(
          // child: Center(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.stretch,
          //     children: [
          //       //build UI
          //       buildButtons(0),
          //       buildButtons(1),
          //       buildButtons(2),
          //       buildButtons(3),
          //       buildButtons(4),
          //       buildButtons(5),
          //       buildButtons(6),
          //     ],
          //   ),
          // ),
          children: [
            buildButtons(0),
            buildButtons(1),
            buildButtons(2),
            buildButtons(3),
            buildButtons(4),
            buildButtons(5),
            buildButtons(6),
          ],
        ),
      ),
    );
  }
}

//TODO Set the UI to be scrollable
//TODO: Change the buttons to list tile with music player icons
