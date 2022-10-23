import 'package:flutter/material.dart';
import 'package:myapp/listofcampuses.dart';
import 'package:myapp/personalpagespecials.dart';
import 'package:myapp/picdinner.dart';
import 'package:myapp/picfamily.dart';
import 'package:myapp/picgccommittee.dart';
import 'package:myapp/pictrip.dart';
import 'package:myapp/picyefkrgibzha.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClip(),
              child: Container(
                height: 200.0,
                color: Colors.deepPurple,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "BDU Fellowship 2015 Graduates",
                        style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        height: 45.0,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 34.0, vertical: 30.0),
                        // child: const TextField(
                        //   decoration: InputDecoration(
                        //     border: InputBorder.none,
                        //     enabledBorder: InputBorder.none,
                        //     focusedBorder: InputBorder.none,
                        //     hintText: "Search for the best",
                        //     hintStyle: TextStyle(color: Colors.deepPurple),
                        //     contentPadding: EdgeInsets.symmetric(
                        //         horizontal: 16.0, vertical: 14.0),
                        //     suffixIcon: Icon(
                        //       Icons.search,
                        //       size: 14.0,
                        //       color: Colors.grey,
                        //     ),
                        //   ),
                        // ),
                      ),
                      const SizedBox(height: 10.0)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    "Our Specials",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                        fontSize: 22.0),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey,
                        fontSize: 14.0),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 230.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  getItem(1, PersonalPageSpecials()),
                  getItem(2, PersonalPageSpecials()),
                  getItem(3, PersonalPageSpecials()),
                  getItem(2, PersonalPageSpecials()),
                  // getItem(4),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Text(
                    "Most Popular",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.blueGrey),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Colors.grey),
                  )
                ],
              ),
            ),
            getSmallItem(1, 14, 4, "Magazine", "Strong", ListofCampuses()),
            getSmallItem(2, 16, 7, "Family Pictures", "Medium", PicFamily()),
            getSmallItem(3, 14, 6, "GC Dinner Pictures", "Soft", PicDinner()),
            getSmallItem(3, 14, 6, "Trip Pictures", "Soft", PicTrip()),
            getSmallItem(
                3, 14, 6, "YeFeker gebezha Pictures", "Soft", PicYefkrGibzha()),
            getSmallItem(3, 14, 6, "GC Committee", "Soft", PicGcCommittee()),

            // MyCustomUI2()
          ],
        ),
      ),
    );
  }

  getSmallItem(img, price, time, name, flavor, goto) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          child: Card(
            child: Row(
              children: <Widget>[
                Container(
                  width: 70.0,
                  height: 70.0,
                  decoration: BoxDecoration(
                      // image: const DecorationImage(
                      //   image: AssetImage("assets/9.jpg"),
                      //   fit: BoxFit.cover,
                      // ),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "$name",
                      style: const TextStyle(
                          fontSize: 20.0,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      "$flavor",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14.0,
                      ),
                    )
                  ],
                )),
                const SizedBox(width: 20.0),
                ClipPath(
                  clipper: MyClip2(),
                  child: Container(
                    width: 70.0,
                    height: 70.0,
                    color: Colors.deepPurple,
                    child: Center(
                      child: Text(
                        "$price mb",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => ListofCampuses()))

            Navigator.push(
                context, MaterialPageRoute(builder: (context) => goto));
          },
        ));
  }

  getItem(img, goto) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(2.0),
        width: 165.0,
        decoration: BoxDecoration(
            color: Colors.deepPurple,
            image: const DecorationImage(
              image: AssetImage("assets/images/SHO_3048.JPG"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10.0)),
      ),
      onTap: () {
        // Navigator.of(context).push(MaterialPageRoute(
        //         builder: (context) => ListofCampuses()))

        Navigator.push(context, MaterialPageRoute(builder: (context) => goto));
      },
    );
  }
}

class MyClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 50.0);
    path.quadraticBezierTo(
        size.width - 70.0, size.height, size.width / 2, size.height - 20);
    path.quadraticBezierTo(size.width / 3.0, size.height - 32, 0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class MyClip2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(10, size.height / 2 + 20, 5, size.height / 2);
    path.quadraticBezierTo(0, size.height / 3, 10, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
