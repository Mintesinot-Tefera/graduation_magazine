import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/aboutus.dart';
import 'package:myapp/picdinnerfasikagrid.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class PicDinnerFasikaList extends StatefulWidget {
  @override
  _PicDinnerFasikaListState createState() => _PicDinnerFasikaListState();
}

class _PicDinnerFasikaListState extends State<PicDinnerFasikaList> {
  late Stream<QuerySnapshot> stream;

  @override
  void initState() {
    super.initState();

    stream = FirebaseFirestore.instance
        .collection("gcdinnerfasika")
        .orderBy("number", descending: false)
        .snapshots();
  }

  Future<void> _handleRefresh() async {
    return await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      // Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[900],
        brightness: Brightness.dark,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () {
                Navigator.pop(context);
              },
              // tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: const Text(
          'GC Dinner Fasika',
          style: TextStyle(fontSize: 15),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            // tooltip: 'Grid',
            enableFeedback: true,
            icon: const Icon(
              CupertinoIcons.square_list,
            ),
            onPressed: () {
              Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          PicDinnerFasikaGrid()));
              // push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => PicDinnerFasikaGrid(),
              //   ),
              // );
            },
          ),
          IconButton(
            tooltip: 'About Us',
            enableFeedback: true,
            icon: const Icon(
              CupertinoIcons.info_circle,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutUs(),
                ),
              );
            },
          ),
        ],
      ),
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        animSpeedFactor: 1,
        // color: Colors.deepPurple[900],
        color: Colors.black,
        backgroundColor: Colors.white,
        showChildOpacityTransition: false,
        height: 40,
        child: Center(
            child: FutureBuilder(
                future: Firebase.initializeApp(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    print('connection is successfull');
                    return StreamBuilder(
                        stream: stream,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            // return const Text("Something went wrong");
                            print("loading");
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              children: snapshot.data!.docs.map((document) {
                                print("aginchewalehu gn data yelewmko");
                                return Center(
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          bottom: 5, top: 7),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        child: CachedNetworkImage(
                                          imageUrl: document['image'],
                                          placeholder: (context, url) =>
                                              Container(
                                            height: width - 20,
                                            width: width,
                                            decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 209, 196, 233),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(40),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child:
                                                const CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Container(
                                            height: width - 20,
                                            width: width,
                                            decoration: const BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 209, 196, 233),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(40),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: const Icon(Icons.error),
                                          ),
                                        ),
                                      )),
                                );
                              }).toList());
                        });
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                })),
      ),
    );
  }
}
