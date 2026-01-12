import 'package:carbuddy/login_page.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  final Color primaryColor = const Color(0xFF5B2D8B); // 🟣 Deep Purple

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // 🔹 TOP PROFILE HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryColor,
                    primaryColor.withOpacity(0.85),
                  ],
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,
                    child: Text(
                      "P",
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    "prem",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 4),

                  const Text(
                    "premchachcha199@gmail.com",
                    style: TextStyle(color: Colors.white70),
                  ),

                  const SizedBox(height: 16),

                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.edit),
                    label: const Text("Edit Profile"),
                    onPressed: () {
                      print("Edit Profile clicked");
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // 🔹 ACCOUNT
            _sectionTitle("Account"),
            _tile(Icons.person, "Personal Information", "Update your details"),
            _tile(Icons.location_on, "Saved Addresses", "Manage your addresses"),
            _tile(Icons.credit_card, "Payment Methods", "Cards and UPI"),

            const SizedBox(height: 16),

            // 🔹 APP SETTINGS
            _sectionTitle("App Settings"),
            _tile(Icons.notifications, "Notifications", "Manage notifications"),
            _tile(Icons.dark_mode, "Appearance", "Dark mode, theme"),
            _tile(Icons.language, "Language", "English"),

            const SizedBox(height: 16),

            // 🔹 SUPPORT
            _sectionTitle("Support"),
            _tile(Icons.help_outline, "Help & Support", "FAQs, contact us"),
            _tile(Icons.privacy_tip, "Privacy Policy", ""),
            _tile(Icons.description, "Terms of Service", ""),

            const SizedBox(height: 20),

            // 🔹 LOGOUT BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.red),
                  foregroundColor: Colors.red,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                icon: const Icon(Icons.logout),
                label: const Text("Logout"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  print("Logout clicked");
                },
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              "CarBuddy v1.0.0",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // 🔹 REUSABLE WIDGETS

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _tile(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () {
          print("$title clicked");
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFEDE7F6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: const Color(0xFF5B2D8B)),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (subtitle.isNotEmpty)
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              ),

              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}