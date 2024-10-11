import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerifyEmailPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: double.infinity,
        child: Column(children: [
          const Text("A verfication link has been sent to your email once you click it, click below to confirm email verification"),
          ElevatedButton(onPressed: (){
              FirebaseAuth.instance.currentUser?.reload().then((value){
                bool emailVerified = FirebaseAuth.instance.currentUser?.emailVerified??false;
                if(emailVerified){
                  Navigator.of(context).pushNamed("/log_in");
                }
              });
          }, child: const Text("Confirm Email Verifcation"))
        ],),
      ),
    );
  }
}