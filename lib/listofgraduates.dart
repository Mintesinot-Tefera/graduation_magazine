import 'package:flutter/material.dart';
import 'package:myapp/personalpage.dart';
import 'package:myapp/personalpage1.dart';
import 'package:myapp/student.dart';

class ListofGraduates extends StatefulWidget {
  const ListofGraduates({super.key});

  @override
  _ListofGraduatesState createState() => _ListofGraduatesState();
}

class _ListofGraduatesState extends State<ListofGraduates>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Student student1 = Student(
      name: "Mintesinot Tefera",
      department: "Software Engineering",
      image1: "imageminte1",
      image2: "imageminte1",
      lastword: "lastword");

  Student student2 = Student(
      name: "Beimnet Samuel",
      department: "Chemical Engineering",
      image1: "imageminte1",
      image2: "imageminte1",
      lastword: "lastword");

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      body: Stack(
        children: [
          ListView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(_w / 17, _w / 20, 0, _w / 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Poly Campus',
                      style: TextStyle(
                        fontSize: 27,
                        color: Colors.black.withOpacity(.6),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    // SizedBox(height: _w / 35),
                    Text(
                      'Here you can write something\nabout your app.',
                      style: TextStyle(
                        fontSize: 19,
                        color: Colors.black.withOpacity(.5),
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
              // searchBar(),
              // SizedBox(height: _w / 20),
              // groupOfCards(
              //     student1.name,
              //     'Example Text',
              //     student1.image1,
              //     PersonalPage1(),
              //     student2.name,
              //     'Example Text',
              //     student2.image1,
              //     PersonalPage1()),
              // Padding(
              //   padding: EdgeInsets.fromLTRB(_w / 20, 0, _w / 20, _w / 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       card(student1.name, 'Example Text', student1.image1,
              //           PersonalPage1()),
              //       card(student1.name, 'Example Text', student1.image1,
              //           PersonalPage1()),
              //     ],
              //   ),
              // ),
              Padding(
                //   padding: EdgeInsets.fromLTRB(_w / 20, 0, _w / 20, _w / 20),

                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(30, (index) {
                      return Center(
                          child: card(student1.name, 'Example Text',
                              student1.image1, PersonalPage1()));
                    })),
              ),
            ],
          ),
          //   settingIcon(),
        ],
      ),
    );
  }

  Widget settingIcon() {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(0, _w / 10, _w / 20, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: _w / 8.5,
            width: _w / 8.5,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 30,
                  offset: Offset(0, 15),
                ),
              ],
              shape: BoxShape.circle,
            ),
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              tooltip: 'Settings',
              icon: Icon(Icons.settings,
                  size: _w / 17, color: Colors.black.withOpacity(.6)),
              onPressed: () {
                Navigator.of(context).push(
                  MyFadeRoute(
                    route: PersonalPage(),
                    page: PersonalPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    double _w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.fromLTRB(_w / 20, _w / 25, _w / 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: _w / 8.5,
            width: _w / 1.36,
            padding: EdgeInsets.symmetric(horizontal: _w / 60),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(99),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  blurRadius: 30,
                  offset: Offset(0, 15),
                ),
              ],
            ),
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                filled: true,
                hintStyle: TextStyle(
                    color: Colors.black.withOpacity(.4),
                    fontWeight: FontWeight.w600,
                    fontSize: _w / 22),
                prefixIcon:
                    Icon(Icons.search, color: Colors.black.withOpacity(.6)),
                hintText: 'Search anything.....',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          SizedBox(height: _w / 14),
          Container(
            width: _w / 1.15,
            child: Text(
              'Example Text',
              textScaleFactor: 1.4,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black.withOpacity(.7),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget groupOfCards(
  //     String title1,
  //     String subtitle1,
  //     String image1,
  //     Widget route1,
  //     String title2,
  //     String subtitle2,
  //     String image2,
  //     Widget route2) {
  //   double _w = MediaQuery.of(context).size.width;
  //   return Padding(
  //     padding: EdgeInsets.fromLTRB(_w / 20, 0, _w / 20, _w / 20),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         card(title1, subtitle1, image1, route1),
  //         card(title2, subtitle2, image2, route2),
  //       ],
  //     ),
  //   );
  // }

  Widget card(String title, String subtitle, String image, Widget route) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation.value,
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          Navigator.of(context).push(MyFadeRoute(route: route, page: route));
        },
        child: Container(
          width: _w / 2.36,
          height: _w / 1.8,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.05), blurRadius: 50),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: _w / 2.36,
                height: _w / 2.5,
                decoration: const BoxDecoration(
                  color: Color(0xff5C71F3),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/images/SHO_3048.JPG',
                  // width: 170,
                  // fit: BoxFit.fitHeight,
                  // fit: BoxFit.fitWidth,
                ),

                // child: const Text(
                //   'Add image here',
                //   textScaleFactor: 1.2,
                //   style: TextStyle(color: Colors.white),
                // ),
              ),
              // Image.asset(
              //   image,
              //   fit: BoxFit.cover,
              //   width: _w / 2.36,
              //   height: _w / 2.6),
              Container(
                height: _w / 14,
                width: _w / 2.36,
                padding: EdgeInsets.symmetric(horizontal: _w / 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      textScaleFactor: 1.2,
                      maxLines: 1,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black.withOpacity(.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyFadeRoute extends PageRouteBuilder {
  final Widget page;
  final Widget route;

  MyFadeRoute({required this.page, required this.route})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: route,
          ),
        );
}
