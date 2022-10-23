import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math';

class MyCustomWidget extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => new _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  double _page = 10;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    PageController pageController;
    pageController = PageController(initialPage: 10);
    pageController.addListener(
      () {
        setState(
          () {
            _page = pageController.page!;
          },
        );
      },
    );

    return Scaffold(
      body: Center(
          child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(width / 17, width / 20, 0, width / 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'YOUR APP\'S NAME',
                  style: TextStyle(
                    fontSize: 27,
                    color: Colors.black.withOpacity(.6),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: width / 35),
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
          Stack(
            children: [
              SizedBox(
                height: width,
                width: width * .95,
                child: LayoutBuilder(
                  builder: (context, boxConstraints) {
                    List<Widget> cards = [];

                    for (int i = 0; i <= 11; i++) {
                      double currentPageValue = i - _page;
                      bool pageLocation = currentPageValue > 0;

                      double start = 20 +
                          max(
                              (boxConstraints.maxWidth - width * .75) -
                                  ((boxConstraints.maxWidth - width * .75) /
                                          2) *
                                      -currentPageValue *
                                      (pageLocation ? 9 : 1),
                              0.0);

                      var customizableCard = Positioned.directional(
                        top: 20 + 30 * max(-currentPageValue, 0.0),
                        bottom: 20 + 30 * max(-currentPageValue, 0.0),
                        start: start,
                        textDirection: TextDirection.ltr,
                        child: Container(
                          height: width * .67,
                          width: width * .67,
                          alignment: Alignment.center,
                          child: Image.asset('assets/images/SHO_3048.JPG'),
                          decoration: BoxDecoration(
                              // color: Colors.amber,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.15),
                                    blurRadius: 10)
                              ]),
                        ),
                      );
                      cards.add(customizableCard);
                    }
                    return Stack(children: cards);
                  },
                ),
              ),
              Positioned.fill(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: 2,
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
