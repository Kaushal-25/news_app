import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_app/reusable/reusable_widget.dart';
import 'package:news_app/screens/home_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text("Sign Up", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.black,
      ),
      
      body: Padding(
        padding: const EdgeInsets.only(top: 80,right: 8,left: 8),
        child: Column(
          children: [
            reusableTextField("Enter UserName", Icons.person_outline, false, _userNameController),
            SizedBox(height: 20,),
            reusableTextField("Enter Email Id", Icons.person_outline, false, _emailController),
            SizedBox(height: 20,),
            reusableTextField("Enter Password", Icons.lock_outlined, true, _passwordController),
            SizedBox(height: 20,),
            firebaseUIButton(context, "Sign Up", () {
              FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _emailController.text, password: _passwordController.text).then((value)  {
                    print("Created New Account");
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => HomeScreen(),));
              }).onError((error, stackTrace) {
                print("Error ${error.toString()}");
              });

              // Navigator.pushReplacement(context,
              //     MaterialPageRoute(builder: (context) => HomeScreen(),));
            }),
          ],
        ),
      ),
    );
  }
}
