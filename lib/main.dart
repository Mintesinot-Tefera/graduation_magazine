import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:myapp/carousel.dart';
import 'package:myapp/gallery.dart';
import 'package:myapp/homepage.dart';
// import 'package:myapp/homepage.dart';
import 'package:myapp/listofcampuses.dart';
import 'package:myapp/listofgraduates2.dart';
import 'package:myapp/mainlist3.dart';
import 'package:myapp/mycustomui.dart';
// import 'package:myapp/mainlist3.dart';
// import 'package:myapp/mainlist.dart';
// import 'package:myapp/mainlist3.dart';
import 'package:myapp/personalpage.dart';
import 'package:myapp/personalpage1.dart';
import 'package:myapp/picgccommittee.dart';
import 'package:myapp/pictrip.dart';
import 'package:myapp/slidablecard.dart';
// import 'package:myapp/mainlist.dart';
// import 'package:myapp/mainlist2.dart';
// import 'package:myapp/splashscreen.dart';
// import 'package:myapp/splashscreen2.dart';
// import 'package:myapp/slidablecard.dart';
import 'package:myapp/ui1.dart';
// import 'package:firebase_core/firebase_core.dart';

void main() {
  // Firebase.initializeApp();

  runApp(const MyApp());
}

//
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
//     return MaterialApp(
//         home: FutureBuilder(
//             // Initialize FlutterFire
//             future: Firebase.initializeApp(),
//             builder: (context, snapshot) {
//               // Check for errors
//               if (snapshot.hasError) {
//                 print("has error");
//               }

//               // Once complete, show your application
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return HomePage();
//               }
//               return PersonalPage();
//             }));
//   }
// }

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        // home: MyCustomUI(),

        // home: MyApp1(),
        // home: PersonalPage1()
        home: HomePage()
        // home: ListofGraduates(),
        // home: Gallery(),
        // home: PicTrip(),
        // home: PicGcCommittee(),

        // home: MyCustomWidget(),
        // home: ui(),
        // home: PersonalPage(),
        // home: MainList3()
        // home: MyCustomUI()
        // home: MyCustomUI()
        );
  }
}
