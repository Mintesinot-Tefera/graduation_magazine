// import 'package:flutter/cupertino.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  String name;
  String department;
  String image1;
  String image2;
  String lastword;
  // String tempo;
  // String choir;
  // late String songlyrics;

  Student({
    required this.name,
    required this.department,
    required this.image1,
    required this.image2,
    required this.lastword,
    // required this.tempo,
    // required this.choir
  });
  // Song2(String songTitle, String songLyrics, String rhythm, String tempo) {
  //   this.songtitle = songTitle;
  //   this.songlyrics = songLyrics;
  //   this.rhythm = rhythm;
  //   this.tempo = tempo;
  // }

  Map<String, dynamic> toJson() => {
        'name': name,
        "department": department,
        "image1": image1,
        "image2": image2,
        "lastword": lastword
      };
}
