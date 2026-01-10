import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final myitem = [
    Image.asset('assets/images/B1.jpeg'),
    Image.asset('assets/images/B2.jpeg'),
    Image.asset('assets/images/B3.jpeg'),
    Image.asset('assets/images/B4.jpeg'),
  ];
  int myCurrentIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Home Page',style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.deepPurple[300],
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [
              CarouselSlider(options: CarouselOptions(
                autoPlay: true,
                height: 200,
                onPageChanged: (index,reason){
                  setState(() {
                    myCurrentIndex = index;
                  });
                }
              ),
                items: myitem,
              ),
          ],
        ),
      ) ,

    );
  }
}

