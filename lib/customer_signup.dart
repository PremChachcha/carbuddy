import 'package:flutter/material.dart';

class CustomerSignup extends StatefulWidget {
  const CustomerSignup({super.key});

  @override
  State<CustomerSignup> createState() => _CustomerSignupState();
}

class _CustomerSignupState extends State<CustomerSignup> {
  // 1. Form Key aur Controllers
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // Password Visibility Toggles
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

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
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
            child: Form(
              key: _formKey, // Form connect kiya
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Icon (User Badge from screenshot)
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.person, color: Colors.white, size: 28),
                  ),

                  const SizedBox(height: 20),

                  // Title
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Subtitle
                  Text(
                    "Create your customer account",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.7)
                    ),
                  ),

                  const SizedBox(height: 40),

                  // -- Full Name Field --
                  _buildLabel("Full Name"),
                  _buildTextFormField(
                    controller: _nameController,
                    hintText: "Full Name",
                    icon: Icons.person_outline,
                    validator: (val) {
                      if (val == null || val.isEmpty) return "Full Name is required";
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // -- Email Field --
                  _buildLabel("Email Address"),
                  _buildTextFormField(
                    controller: _emailController,
                    hintText: "Enter Email Address",
                    icon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (val) {
                      if (val == null || !val.contains('@')) return "Enter a valid email";
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // -- Password Field --
                  _buildLabel("Password"),
                  _buildTextFormField(
                    controller: _passwordController,
                    hintText: "Enter Password",
                    icon: Icons.lock_outline,
                    isPassword: true,
                    isObscure: _obscurePassword,
                    onVisibilityToggle: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                    validator: (val) {
                      if (val == null || val.length < 6) return "Min 6 characters required";
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // -- Confirm Password Field --
                  _buildLabel("Confirm Password"),
                  _buildTextFormField(
                    controller: _confirmPasswordController,
                    hintText: "Confirm Password",
                    icon: Icons.lock_outline,
                    isPassword: true,
                    isObscure: _obscureConfirmPassword,
                    onVisibilityToggle: () {
                      setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
                    },
                    validator: (val) {
                      if (val != _passwordController.text) return "Passwords do not match";
                      return null;
                    },
                  ),

                  const SizedBox(height: 40),

                  // -- Sign Up Button --
                  Container(
                    width: double.infinity,
                    height: 55,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6C63FF), Color(0xFF512DA8)], // Purple Button Gradient
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            color: const Color(0xFF6C63FF).withOpacity(0.4),
                            blurRadius: 10,
                            offset: const Offset(0, 5)
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        // 3. Validation Logic Trigger
                        if (_formKey.currentState!.validate()) {
                          // Agar sab sahi hai
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Account Created Successfully!"),
                              backgroundColor: Colors.green,
                            ),
                          );
                          // TODO: Yahan API call karein ya agle page par bhejein
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Footer: Already have an account? Login
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.white.withOpacity(0.7)),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Login Screen par wapas jane ke liye
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
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
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 4.0),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool isPassword = false,
    bool isObscure = false,
    VoidCallback? onVisibilityToggle,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.08), // Glassmorphism Style
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: isPassword ? isObscure : false,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.white70),
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(
              isObscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              color: Colors.white54,
            ),
            onPressed: onVisibilityToggle,
          )
              : null,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          errorStyle: const TextStyle(color: Colors.orangeAccent, fontSize: 12),
        ),
      ),
    );
  }
}