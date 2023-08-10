import 'package:flutter/material.dart';
import 'package:news_app/reusable/reusable_widget.dart';
import 'package:news_app/screens/home_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
        padding: const EdgeInsets.only(top: 175,right: 8,left: 8),
        child: Column(
          children: [
            reusableTextField("Enter UserName", Icons.person_outline, false, TextEditingController()),
            SizedBox(height: 20,),
            reusableTextField("Enter Email Id", Icons.person_outline, false, TextEditingController()),
            SizedBox(height: 20,),
            reusableTextField("Enter Password", Icons.lock_outlined, true, TextEditingController()),
            SizedBox(height: 20,),
            firebaseUIButton(context, "Sign Up", () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
            }),
          ],
        ),
      ),
    );
  }
}
