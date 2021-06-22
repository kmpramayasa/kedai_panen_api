import 'package:flutter/material.dart';
import 'package:layout/screens/login_screen.dart';
import 'package:layout/screens/signup_screen.dart';

class Authentication extends StatefulWidget {  

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {  

  bool showSignIn = true;

  void toogleView(){
    setState(() => showSignIn = !showSignIn);
    print(showSignIn);
  }

  @override
  Widget build(BuildContext context) {    
    if(showSignIn) {
      return LoginScreen(toogleView: toogleView);
    } else {
      return SignUpScreen(toogleView: toogleView);
    }          
  }
}