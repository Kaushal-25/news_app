

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/reusable/reusable_widget.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  // TextEditingController _passwordTextController = _passwordTextController;
  // TextEditingController _emailTextController = _emailTextController;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _passwordTextController = TextEditingController();
    _emailTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Padding(
          padding: const EdgeInsets.only(top: 200,right: 8,left: 8),
          child: Column(
            children: [
              reusableTextField("Enter Username", Icons.person_outlined, false, _emailTextController),
              SizedBox(height: 25,),
              reusableTextField("Password", Icons.lock_outlined, true, _passwordTextController),
              SizedBox(height: 25,),
              firebaseUIButton(context, "Log In", () {
                FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: _emailTextController.text, password:_passwordTextController.text ).then((value) =>
                Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => HomeScreen(),)));
              }),

              signUpOption(),
            ],

          ),
        ),
      ),
    );
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have account?",
            style: TextStyle(color: Colors.amber)),
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
          },
          child: const Text(
            " Sign Up",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

}


