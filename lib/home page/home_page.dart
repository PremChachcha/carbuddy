import 'package:carbuddy/home page/garage/garage.dart';
import 'package:flutter/material.dart';
import 'package:carbuddy/home page/Bookings.dart';
import 'package:carbuddy/home page/profile/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FC),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        currentIndex: currentIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,

        onTap: (index){
          setState(() {
            currentIndex = index;
          });

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Garage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Bookings()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Profile()),
            );
          }
        },



        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.garage), label: "Garage"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: "Bookings"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// 🔹 Header
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundColor: Colors.deepPurple,
                      child: Text("P",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hey, prem!",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        Text("What do you need today?",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.notifications_none),
                  ],
                ),

                const SizedBox(height: 20),

                /// 🔹 Search Bar
                TextField(
                  decoration: InputDecoration(
                    hintText: "Search services, mechanics...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                /// 🔹 Banner
                Container(
                  height: 170,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF5C6BC0), Color(0xFF8E7CC3)],
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Your Car Needs Care?",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            const Text(
                              "Book a service with trusted mechanics near you",
                              style: TextStyle(color: Colors.white70),
                            ),
                            const SizedBox(height: 15),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.indigo,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              child: const Text("Book Now →"),
                            )
                          ],
                        ),
                      ),
                      const Icon(Icons.directions_car,
                          size: 80, color: Colors.white70),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                /// 🔹 Our Services
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("Our Services",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("See All",
                        style: TextStyle(color: Colors.indigo)),
                  ],
                ),

                const SizedBox(height: 15),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 15,
                    children: const [
                      ServiceCard(
                          icon: Icons.build, title: "Maintenance", color: Colors.blue),
                      ServiceCard(
                          icon: Icons.handyman, title: "Repair", color: Colors.red),
                      ServiceCard(
                          icon: Icons.local_car_wash,
                          title: "Washing",
                          color: Colors.green),
                      ServiceCard(
                          icon: Icons.format_paint_sharp, title: "Body Work", color: Colors.deepPurple),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                /// 🔹 Nearby Mechanics
                Row(
                  children: const [
                    Text("Nearby Mechanics",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(width: 8),
                    Chip(
                      label: Text("LIVE",
                          style: TextStyle(color: Colors.green)),
                      backgroundColor: Color(0xFFE8F5E9),
                    )
                  ],
                ),

                const SizedBox(height: 10),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.my_location, color: Colors.white),
                      SizedBox(width: 10),
                      Text("Find Nearby Garages",
                          style: TextStyle(
                              color: Colors.white, fontSize: 16)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// 🔹 Service Card Widget
class ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const ServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: color.withOpacity(0.15),
            child: Icon(icon, color: color),
          ),
          const SizedBox(height: 10),
          Text(title, textAlign: TextAlign.center,style: TextStyle(fontSize: 13),),
        ],
      ),
    );
  }
}