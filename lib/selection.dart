import 'package:carbuddy/customer_signup.dart';
import 'package:carbuddy/login_page.dart';
import 'package:carbuddy/mechanic//mechanic_signup.dart';
import 'package:carbuddy/mechanic/mechanic.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CarBuddyApp());
}

class CarBuddyApp extends StatelessWidget {
  const CarBuddyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto', // आप Google Fonts का भी use कर सकते हैं
      ),
      home: const WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // ** Deep Purple Gradient Background **
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF1A0B2E), // Very Dark Purple
              Color(0xFF4A148C), // Deep Purple
              Color(0xFF6A1B9A), // Purple Accent
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(flex: 1),

                // Logo Icon
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade700,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.withOpacity(0.5),
                        blurRadius: 20,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.directions_car_filled_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                ),

                const SizedBox(height: 30),

                // Title
                const Text(
                  "Welcome to\nCarBuddy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),

                const SizedBox(height: 12),

                // Subtitle
                Text(
                  "How would you like to use the app?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ),

                const SizedBox(height: 40),

                // Card 1: Vehicle Owner (Blue-ish tone to contrast purple)
                _buildSelectionCard(
                  context,
                  title: "I'm a Vehicle Owner",
                  subtitle: "Find trusted mechanics, book services, and manage your vehicles",
                  icon: Icons.person_rounded,
                  gradientColors: [
                    const Color(0xFF42A5F5),
                    const Color(0xFF1976D2)
                  ],
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) => CustomerSignup()));
                    // Navigate to Owner Login
                  },
                ),

                const SizedBox(height: 20),

                // Card 2: Mechanic (Orange tone)
                _buildSelectionCard(
                  context,
                  title: "I'm a Mechanic",
                  subtitle: "Grow your business, connect with customers, and earn more",
                  icon: Icons.build_rounded,
                  gradientColors: [
                    const Color(0xFFFFA726),
                    const Color(0xFFF57C00)
                  ],
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context) => MechanicSignupScreen()));
                    // Navigate to Mechanic Login
                  },
                ),

                const Spacer(flex: 2),

                // Footer: Sign In
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: 15,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder:(context) => LoginPage()));
                        // Navigate to Sign In
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.orangeAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper Widget for the Selection Cards
  Widget _buildSelectionCard(
      BuildContext context, {
        required String title,
        required String subtitle,
        required IconData icon,
        required List<Color> gradientColors,
        required VoidCallback onTap,
      }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradientColors,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: gradientColors.last.withOpacity(0.4),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              // Icon Box
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 16),

              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.9),
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),

              // Arrow Icon
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}