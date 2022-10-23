import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carousel Slider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CarouselSliderExample(),
    );
  }
}

class CarouselSliderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        CarouselSlider(
          items: [
            Container(
              margin: EdgeInsets.all(8.0),
              child: Image.asset('assets/images/SHO_3048.JPG'),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Image.asset('assets/images/4F9A9777.JPG'),
            ),
          ],
          options: CarouselOptions(
            height: 380.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
      ]),
    );
  }
}
