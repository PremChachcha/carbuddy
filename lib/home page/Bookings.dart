import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Bookings(),
    );
  }
}
class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('My Bookings',style: TextStyle(fontFamily: 'Poppins'),),
          centerTitle: true,
          automaticallyImplyLeading: false,

          bottom: TabBar(
            indicatorColor: Color(0xFF7E57C2),
            indicatorWeight: 3,
            labelColor: Color(0xFF7E57C2),
            unselectedLabelColor: Colors.black54,
            tabs: [
              Tab(text: "Active"),
              Tab(text: "Completed"),
              Tab(text: "All"),
            ],
          ),
        ),

      ),
    );
  }
}


