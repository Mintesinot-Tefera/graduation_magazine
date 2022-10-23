import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class PicDinner extends StatefulWidget {
  const PicDinner({super.key});

  @override
  _PicDinnerState createState() => _PicDinnerState();
}

class _PicDinnerState extends State<PicDinner> {
  @override
  Widget build(BuildContext c) {
    double _w = MediaQuery.of(c).size.width;
    int columnCount = 3;
    return Scaffold(
      appBar: AppBar(
          title: const Text("GC Dinner"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          brightness: Brightness.dark),
      body: AnimationLimiter(
        child: GridView.count(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          padding: EdgeInsets.all(_w / 60),
          crossAxisCount: columnCount,
          children: List.generate(
            50,
            (int index) {
              return AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: Duration(milliseconds: 500),
                  columnCount: columnCount,
                  child: ScaleAnimation(
                    duration: Duration(milliseconds: 900),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: FadeInAnimation(
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: _w / 30, left: _w / 60, right: _w / 60),
                        // decoration: BoxDecoration(
                        //   color: Colors.white,
                        //   borderRadius: BorderRadius.all(Radius.circular(20)),
                        //   boxShadow: [
                        //     BoxShadow(
                        //       color: Colors.black.withOpacity(0.1),
                        //       blurRadius: 40,
                        //       spreadRadius: 10,
                        //     ),
                        //   ],
                        // ),
                        child: InkWell(
                          child: Container(
                            margin: const EdgeInsets.all(2.0),
                            width: 165.0,
                            decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                image: const DecorationImage(
                                  image:
                                      AssetImage("assets/images/_MG_3466.JPG"),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(10.0)),
                          ),
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //         builder: (context) => ListofCampuses()))

                            // Navigator.push(context, MaterialPageRoute(builder: (context) => goto));
                          },
                        ),
                      ),
                    ),
                  ));
            },
          ),
        ),
      ),
    );
  }
}

// class GridView1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     double _w = MediaQuery.of(context).size.width;
//     int columnCount = 3;

//     return Scaffold(
//       appBar: AppBar(
//           title: Text("Go Back"),
//           centerTitle: true,
//           brightness: Brightness.dark),
//       body: AnimationLimiter(
//         child: GridView.count(
//           physics:
//               BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
//           padding: EdgeInsets.all(_w / 60),
//           crossAxisCount: columnCount,
//           children: List.generate(
//             50,
//             (int index) {
//               return AnimationConfiguration.staggeredGrid(
//                 position: index,
//                 duration: Duration(milliseconds: 500),
//                 columnCount: columnCount,
//                 child: ScaleAnimation(
//                   duration: Duration(milliseconds: 900),
//                   curve: Curves.fastLinearToSlowEaseIn,
//                   child: FadeInAnimation(
//                     child: Container(
//                       margin: EdgeInsets.only(
//                           bottom: _w / 30, left: _w / 60, right: _w / 60),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 40,
//                             spreadRadius: 10,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

