import 'package:carbuddy/selection.dart';
import 'package:flutter/material.dart';
// अपनी theme file import करें
// import '../theme.dart';

class MechanicSignupScreen extends StatefulWidget {
  const MechanicSignupScreen({super.key});

  @override
  State<MechanicSignupScreen> createState() => _MechanicSignupScreenState();
}

class _MechanicSignupScreenState extends State<MechanicSignupScreen> {
  // Current Step Tracker
  int _currentStep = 1;
  final int _totalSteps = 3;

  // Form Key for Validation
  final _formKey = GlobalKey<FormState>();

  // Controllers to retrieve text
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  // Step 2 Controllers (Garage Details)
  final TextEditingController _garageNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _rateController = TextEditingController();
  // ... पुराने Controllers के नीचे ...

  // Step 3 Variables (Services & Location)
  String? _locationAddress;

  // सर्विसेज की लिस्ट जो स्क्रीनशॉट में हैं
  final List<String> _availableServices = [
    "Oil Change", "General Service", "Brake Service", "Engine Repair",
    "AC Repair", "Suspension Repair", "Basic Wash", "Full Detailing",
    "Battery Service", "Electrical Repair", "Tyre Change", "Wheel Alignment",
    "Puncture Repair", "Roadside Assistance", "Towing Service"
  ];

  // जो सर्विसेज यूजर सेलेक्ट करेगा
  final List<String> _selectedServices = [];

  // Password Visibility
  bool _obscurePass = true;
  bool _obscureConfirmPass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,

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
          child: Column(
            children: [
              // --- Header Section (Always Visible) ---
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back Button & Title
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (_currentStep > 1) {
                              setState(() => _currentStep--); // Go back one step
                            } else {
                              Navigator.pop(context); // Exit screen
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(color: Colors.white10, shape: BoxShape.circle),
                            child: const Icon(Icons.arrow_back, color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Mechanic Signup",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            Text(
                              "Step $_currentStep of $_totalSteps",
                              style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.6)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Progress Bar (The 3 Orange Lines)
                    Row(
                      children: [
                        _buildProgressLine(isActive: _currentStep >= 1),
                        const SizedBox(width: 8),
                        _buildProgressLine(isActive: _currentStep >= 2),
                        const SizedBox(width: 8),
                        _buildProgressLine(isActive: _currentStep >= 3),
                      ],
                    ),
                  ],
                ),
              ),

              // --- Scrollable Form Content ---
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  physics: const BouncingScrollPhysics(),
                  child: Form(
                    key: _formKey, // Form Key connect kiya
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),

                        // Badge (Mechanic Account)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.orange.shade800, // Orange for Mechanic
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: [BoxShadow(color: Colors.orange.withOpacity(0.4), blurRadius: 8)],
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.build_rounded, color: Colors.white, size: 16),
                              SizedBox(width: 8),
                              Text(
                                "Mechanic Account",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 30),

                        // --- STEP 1 ---
                        if (_currentStep == 1) ...[
                          _buildLabel("Full Name"),
                          _buildTextField(
                            controller: _nameController,
                            hint: "Enter your full name",
                            icon: Icons.person_outline,
                            validator: (val) => val!.isEmpty ? "Name is required" : null,
                          ),

                          const SizedBox(height: 20),

                          _buildLabel("Email"),
                          _buildTextField(
                            controller: _emailController,
                            hint: "Enter your email",
                            icon: Icons.email_outlined,
                            keyboardType: TextInputType.emailAddress,
                            validator: (val) => !val!.contains("@") ? "Enter valid email" : null,
                          ),

                          const SizedBox(height: 20),

                          _buildLabel("Phone Number"),
                          _buildTextField(
                            controller: _phoneController,
                            hint: "Enter your phone number",
                            icon: Icons.phone_outlined,
                            keyboardType: TextInputType.phone,
                            validator: (val) => val!.length < 10 ? "Enter valid phone" : null,
                          ),

                          const SizedBox(height: 20),

                          _buildLabel("Password"),
                          _buildTextField(
                            controller: _passController,
                            hint: "Create a password",
                            icon: Icons.lock_outline,
                            isPassword: true,
                            isObscure: _obscurePass,
                            onToggle: () => setState(() => _obscurePass = !_obscurePass),
                            validator: (val) => val!.length < 6 ? "Password too short" : null,
                          ),

                          const SizedBox(height: 20),

                          _buildLabel("Confirm Password"),
                          _buildTextField(
                            controller: _confirmPassController,
                            hint: "Confirm your password",
                            icon: Icons.lock_outline,
                            isPassword: true,
                            isObscure: _obscureConfirmPass,
                            onToggle: () => setState(() => _obscureConfirmPass = !_obscureConfirmPass),
                            validator: (val) {
                              if (val != _passController.text) return "Passwords do not match";
                              return null;
                            },
                          ),
                        ],

                        // --- STEP 2 : Garage Details ---
                        if (_currentStep == 2) ...[

                          // Header for Step 2
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.orange.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  'assets/garage_icon.png', // अगर आइकन इमेज है, वरना नीचे Icon use करें
                                  height: 24,
                                  width: 24,
                                  errorBuilder: (c, o, s) => const Icon(Icons.store_mall_directory_rounded, color: Colors.orange, size: 24),
                                ),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                "Garage Details",
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          Text(
                            "Tell us about your garage/workshop",
                            style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.6)),
                          ),

                          const SizedBox(height: 30),

                          // Garage Name Field
                          _buildLabel("Garage/Workshop Name"),
                          _buildTextField(
                            controller: _garageNameController,
                            hint: "Enter garage name",
                            icon: Icons.store_outlined,
                            validator: (val) => val!.isEmpty ? "Garage name is required" : null,
                          ),

                          const SizedBox(height: 20),

                          // Address Field
                          _buildLabel("Full Address"),
                          _buildTextField(
                            controller: _addressController,
                            hint: "Enter full address",
                            icon: Icons.location_on_outlined,
                            validator: (val) => val!.isEmpty ? "Address is required" : null,
                          ),

                          const SizedBox(height: 20),

                          // Experience Field
                          _buildLabel("Years of Experience"),
                          _buildTextField(
                            controller: _experienceController,
                            hint: "e.g. 5",
                            icon: Icons.work_outline_rounded,
                            keyboardType: TextInputType.number,
                            validator: (val) => val!.isEmpty ? "Experience required" : null,
                          ),

                          const SizedBox(height: 20),

                          // Hourly Rate Field
                          _buildLabel("Hourly Rate (₹)"),
                          _buildTextField(
                            controller: _rateController,
                            hint: "e.g. 500",
                            icon: Icons.currency_rupee_rounded,
                            keyboardType: TextInputType.number,
                            validator: (val) => val!.isEmpty ? "Rate is required" : null,
                          ),
                        ],

                        // --- STEP 3 UI: Location & Services ---
                        if (_currentStep == 3) ...[

                          // Header for Step 3
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.redAccent.withOpacity(0.2), // Red tint for location
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(Icons.location_on_rounded, color: Colors.redAccent, size: 24),
                              ),
                              const SizedBox(width: 12),
                              const Text(
                                "Location & Services",
                                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),
                          Text(
                            "Set your live location and services you offer",
                            style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.6)),
                          ),

                          const SizedBox(height: 30),

                          // Location Card (Button)
                          GestureDetector(
                            onTap: () {
                              // यहाँ बाद में लोकेशन का लॉजिक लगेगा
                              setState(() {
                                _locationAddress = "Ahmedabad, Gujarat (Demo Location)";
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1), // Glassmorphism
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: Colors.white24),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1E3A8A), // Dark Blue Icon Box
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Icon(Icons.my_location, color: Colors.white),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _locationAddress ?? "Tap to Get Live Location",
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          "We need your location to show you on the map",
                                          style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(height: 24),

                          const Text(
                            "Services You Offer",
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                          ),

                          const SizedBox(height: 12),

                          // Services Selection (Wrap Widget)
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: _availableServices.map((service) {
                              final isSelected = _selectedServices.contains(service);
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    if (isSelected) {
                                      _selectedServices.remove(service);
                                    } else {
                                      _selectedServices.add(service);
                                    }
                                  });
                                },
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: isSelected ? Colors.white : Colors.transparent, // Selected = White
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: isSelected ? Colors.white : Colors.white54,
                                    ),
                                  ),
                                  child: Text(
                                    service,
                                    style: TextStyle(
                                      color: isSelected ? const Color(0xFF4A148C) : Colors.white, // Text Purple on White
                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],

                        const SizedBox(height: 40),

                        // --- Continue Button ---
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: _handleContinue,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1E3A8A), // Dark Blue Button (matches screenshot)
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                              elevation: 5,
                            ),
                            child: Text(
                              _currentStep == _totalSteps ? "Submit" : "Continue",
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Logic to handle Steps
  void _handleContinue() {
    // 1. Check Validation
    if (_formKey.currentState!.validate()) {

      // 2. Check if we are on the last step
      if (_currentStep < _totalSteps) {
        // Move to next step
        setState(() {
          _currentStep++;
        });
      } else {
        // --- FINAL SUBMIT LOGIC (Submit Clicked) ---

        // (यहाँ आप भविष्य में Firebase/API का कोड डाल सकते हैं)

        // Success Message दिखाएं
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Account Created Successfully! Redirecting..."),
            backgroundColor: Colors.green,
          ),
        );


        Future.delayed(const Duration(seconds: 2), () {
          Navigator.pushAndRemoveUntil(
            context,
            // 'LoginScreen' को अपने असली लॉगिन पेज के नाम से बदल लें
            MaterialPageRoute(builder: (context) => const WelcomeScreen()),
                (route) => false, // यह पिछले सारे पेजों को हटा देता है
          );
        });
      }
    }
  }

  // Custom Progress Line Widget
  Widget _buildProgressLine({required bool isActive}) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 6,
        decoration: BoxDecoration(
          color: isActive ? Colors.orange : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  // Label Helper
  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
      child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
    );
  }

  // TextField Helper
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
    bool isObscure = false,
    VoidCallback? onToggle,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: TextFormField( // Use TextFormField for validation
        controller: controller,
        validator: validator,
        obscureText: isPassword ? isObscure : false,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white70),
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: Colors.white54),
            onPressed: onToggle,
          )
              : null,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          errorStyle: const TextStyle(color: Colors.orangeAccent), // Error color styled
        ),
      ),
    );
  }
}