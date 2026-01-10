import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'customer_signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //submit form validation

  void _submitForm(){
    if(_formKey.currentState!.validate()){}
  }
  String? _validateEmail(value){
    if(value!.isEmpty){
      return 'Please enter an email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if(!emailRegExp.hasMatch(value)){
      return 'Please enter a valid email';
    }
    return null;
  }
  //Validation password

  String? _validatePassword(value){
    if(value!.isEmpty){
      return 'Please enter an password';
    }
    return null;
  }

  bool isCustomerSelected = true;
  bool hidePassword = true;

  GestureRecognizer? get onPressed => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  /// App Icon
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.build, color: Colors.deepPurple, size: 28),
                  ),

                  const SizedBox(height: 20),

                  /// Welcome Text
                  const Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PoppinsM',
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "Let's get you back to work.",
                    style: TextStyle(color: Colors.grey,fontFamily: 'PoppinsR'),
                  ),

                  const SizedBox(height: 30),

                  /// User / Mechanic Toggle
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        toggleButton("Customer", Icons.person, isCustomerSelected),
                        toggleButton("Mechanic", Icons.build, !isCustomerSelected),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// Email Field
                  const Text("Email Address"),
                  const SizedBox(height: 6),
                  TextFormField(
                    style: TextStyle(fontFamily: 'PoppinsR'),
                    validator: _validateEmail,
                    decoration: InputDecoration(
                      hintText: "Enter Email Address",
                      prefixIcon: const Icon(Icons.email_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Password Field
                  const Text("Password"),
                  const SizedBox(height: 6),
                  TextFormField(
                    validator: _validatePassword,
                    obscureText: hidePassword,
                    style: TextStyle(fontFamily: 'PoppinsR'),
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          hidePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            hidePassword = !hidePassword;
                          });
                        },
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// Forgot Password
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.deepPurple,fontFamily: 'PoppinsM'),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        "Log In",
                        style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'PoppinsM'),

                      ),
                    ),
                  ),

                  //const Spacer(),
                  const SizedBox(height: 165,),

                  /// Sign Up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Text("Don't have an account? ",
                        style: TextStyle(fontFamily: 'PoppinsR'),
                        ),
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return CustomerSignup();
                              }),
                              );
                            },
                            child: Text("Sign Up",
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'
                            ),
                            ),
                          ),
                        ],
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Toggle Button Widget
  Expanded toggleButton(String text, IconData icon, bool selected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isCustomerSelected = text == "Customer";
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon,
                  color: selected ? Colors.deepPurple : Colors.grey),
              const SizedBox(width: 6),
              Text(
                text,
                style: TextStyle(
                  color: selected ? Colors.deepPurple : Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

