import 'package:carbuddy/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MechanicSignup(),
    );
  }
}

class MechanicSignup extends StatefulWidget {
  const MechanicSignup({super.key});

  @override
  State<MechanicSignup> createState() => _MechanicSignupState();
}

class _MechanicSignupState extends State<MechanicSignup> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //confirm password controller
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  //email validation
  String? _validateEmail(value){
    if(value!.isEmpty){
      return 'Please enter email address';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if(!emailRegExp.hasMatch(value)){
      return 'Please enter a valid email';
    }
    return null;
  }

  //password validation
  String? _validatePassword(value){
    if(value!.isEmpty){
      return 'Please enter password';
    }
    if(value.length < 6){
      return 'Enter grater than 6 digit password';
    }
    return null;
  }

  //confirm password validation
  String? _validateConfirmPassword(value){
    if(value!.isEmpty){
      return 'Please enter confirm password';
    }
    if(value!=passwordController.text){
      return 'Password dose not match';
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
                    child: const Icon(Icons.car_repair, color: Colors.deepPurple, size: 28),
                  ),

                  const SizedBox(height: 20),

                  /// Welcome Text
                  const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'PoppinsM',
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    "Create your mechanic account",
                    style: TextStyle(color: Colors.grey,fontFamily: 'PoppinsR'),
                  ),

                  const SizedBox(height: 50),

                  /// Name Field
                  TextFormField(
                    style: TextStyle(fontFamily: 'PoppinsR'),
                    decoration: InputDecoration(
                      hintText: "Full Name",
                      prefixIcon: const Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Please enter name';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  /// email Field
                  TextFormField(
                    style: TextStyle(fontFamily: 'PoppinsR'),
                    decoration: InputDecoration(
                      hintText: "Enter Email Address",
                      prefixIcon: const Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: _validateEmail,
                  ),

                  const SizedBox(height: 20),

                  /// Password Field
                  TextFormField(
                    controller: passwordController,
                    obscureText: hidePassword,
                    style: TextStyle(fontFamily: 'PoppinsR'),
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      prefixIcon: const Icon(Icons.lock),
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
                    validator: _validatePassword,
                  ),

                  const SizedBox(height: 20),

                  /// Confirm password Field
                  TextFormField(
                    controller: confirmPasswordController,
                    style: TextStyle(fontFamily: 'PoppinsR'),
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      prefixIcon: const Icon(Icons.lock),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    validator: _validateConfirmPassword,
                  ),

                  const SizedBox(height: 30),


                  const SizedBox(height: 20),

                  /// Sign up Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {
                        if(_formKey.currentState!.validate()){}
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerSignup()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 18,color: Colors.white,fontFamily: 'PoppinsM'),

                      ),
                    ),
                  ),

                  //const Spacer(),
                  const SizedBox(height: 155,),

                  /// Sign Up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account? ",
                        style: TextStyle(fontFamily: 'PoppinsR'),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return LoginPage();
                          }),
                          );
                        },
                        child: Text("Login",
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


