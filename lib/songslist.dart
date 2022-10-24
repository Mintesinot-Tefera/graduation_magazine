// import 'package:ae/audioplayer.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';

// import 'addnewsong1.dart';
// import 'displaysong.dart';

// class SongsList extends StatelessWidget {
//   Future<FirebaseApp> _initializeFirebase() async {
//     FirebaseApp firebaseApp = await Firebase.initializeApp();
//     return firebaseApp;
//   }

//   late String documentId;

//   SongsList({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     const numItems = 20;
//     const _biggerFont = TextStyle(fontSize: 18.0);

//     Widget _buildRow(int idx) {
//       return ListTile(
//         leading: CircleAvatar(
//           child: Text('$idx'),
//         ),
//         title: Text(
//           'Item $idx',
//           style: _biggerFont,
//         ),
//         trailing: const Icon(Icons.favorite_outline_rounded),
//       );
//     }

//     return Scaffold(
//         // backgroundColor: const Color.fromRGBO(58, 66, 86, 1.0),
//         appBar: AppBar(
//           elevation: 0.1,
//           backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
//           title: const Text("List of Songs"),
//           actions: <Widget>[
//             IconButton(
//               icon: const Icon(Icons.search),
//               onPressed: () {},
//             )
//           ],
//         ),
//         // backgroundColor: Colors.amber, title: const Text("List of Songs")),
//         // body: ListView.builder(
//         //   itemCount: numItems * 2,
//         //   padding: const EdgeInsets.all(16.0),
//         //   itemBuilder: (BuildContext context, int i) {
//         //     if (i.isOdd) return const Divider();
//         //     final index = i ~/ 2 + 1;
//         //     return _buildRow(index);
//         //   },
//         // ),
//         body: FutureBuilder(
//             future: _initializeFirebase(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 print('connection is successfull');
//                 return StreamBuilder(
//                   stream: FirebaseFirestore.instance
//                       .collection("songs")
//                       .snapshots(),
//                   builder: (BuildContext context,
//                       AsyncSnapshot<QuerySnapshot> snapshot) {
//                     if (!snapshot.hasData) {
//                       return const Text("Something went wrong");
//                       // return const Center(child: CircularProgressIndicator());
//                     }
//                     return ListView(
//                       children: snapshot.data!.docs.map((document) {
//                         return Center(
//                             child: InkWell(
//                                 onTap: () {
//                                   var docId = document.id;
//                                   // passdocumentid(document.id);
//                                   Navigator.of(context).push(MaterialPageRoute(
//                                       builder: (context) =>
//                                           (DisplaySong(docId))));
//                                   // print("Item is clicked");
//                                 },
//                                 // child: Padding(
//                                 //     padding: EdgeInsets.all(12.0),
//                                 //     child: Column(
//                                 //       children: [
//                                 //         Container(
//                                 //           width: MediaQuery.of(context)
//                                 //                   .size
//                                 //                   .width /
//                                 //               1.2,
//                                 //           height: MediaQuery.of(context)
//                                 //                   .size
//                                 //                   .height /
//                                 //               10,
//                                 //           child: Text(
//                                 //               "Title: " + document['title']),
//                                 //         )
//                                 //       ],
//                                 //     ))

//                                 // child: Card(
//                                 //     elevation: 8.0,
//                                 //     margin: const EdgeInsets.symmetric(
//                                 //         horizontal: 10.0, vertical: 6.0),
//                                 //     child: Container(
//                                 //         decoration: const BoxDecoration(
//                                 //             color:
//                                 //                 Color.fromRGBO(64, 75, 96, .9)),
//                                 //         child: ListTile(
//                                 //           contentPadding: EdgeInsets.symmetric(
//                                 //               horizontal: 20.0, vertical: 10.0),
//                                 //           leading: Container(
//                                 //             padding:
//                                 //                 EdgeInsets.only(right: 12.0),
//                                 //             decoration: const BoxDecoration(
//                                 //                 border: Border(
//                                 //                     right: BorderSide(
//                                 //                         width: 1.0,
//                                 //                         color:
//                                 //                             Colors.white24))),
//                                 //             child: const Icon(Icons.autorenew,
//                                 //                 color: Colors.white),
//                                 //           ),
//                                 //           title: Text(
//                                 //             "Title: " + document['title'],
//                                 //             style: const TextStyle(
//                                 //                 color: Colors.white,
//                                 //                 fontWeight: FontWeight.bold),
//                                 //           ),
//                                 //         )))
//                                 child: Card(
//                                   elevation: 8.0,
//                                   margin: const EdgeInsets.symmetric(
//                                       horizontal: 10.0, vertical: 5.0),
//                                   child: Container(
//                                     child: ListTile(
//                                       contentPadding:
//                                           const EdgeInsets.symmetric(
//                                               horizontal: 20.0, vertical: 6.0),
//                                       leading: const Icon(Icons.account_circle),
//                                       title: Text(
//                                         document['title'],
//                                       ),
//                                       trailing:
//                                           const Icon(Icons.favorite_outline),
//                                     ),
//                                   ),
//                                 )));
//                       }).toList(),
//                     );
//                   },
//                 );
//               }
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }));
//   }

//   void passdocumentid(String docid) {
//     documentId = docid;
//   }
// }