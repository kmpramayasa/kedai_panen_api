import 'package:flutter/material.dart';
import 'package:layout/constants.dart';
import 'package:layout/services/authentication_services.dart';
import 'package:layout/widget/bottom_navigation_widget.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

class SignUpScreen extends StatefulWidget {  

  final Function toogleView;

  SignUpScreen({this.toogleView});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  String _email, _pass;

  String validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      Toast.show("Harap Masukkan Email", context);      
      return "Harap Masukkan Email";
    } else if (!regExp.hasMatch(value)) {
      Toast.show("Email Tidak Valid", context);
      return "Email TIdak Valid";
    } else {
      return null;
    }
  }

  _signUp() async {

    if(_formKey.currentState.validate()){
      _formKey.currentState.save();

      _email =  emailCtrl.text.trim();
      _pass = passwordCtrl.text.trim();

      if(validateEmail(_email) == null) {

        dynamic result = await context.read<AuthenticationService>().registerWithEmailAndPassword(_email, _pass);

        if(result == null) {
          Toast.show("Daftar Gagal", context);
        } else {         
          Toast.show("Daftar Berhasil", context);     
          return BottomNavigation();
        }

      }
            
    }    
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 66.0),
                Text("Daftar Akun,", style: titleTextStyle),
                SizedBox(height: 8.0,),
                Text("Mulai Bergabung Sekarang", style: titleTextStyle,),
                SizedBox(height: 46.0,),
                

                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Email", style: labelTextStyle,),
                      SizedBox(height: 8.0,),
                      TextFormField(
                        style: TextStyle(fontSize: 14.0),
                        decoration: InputDecoration(                                                            
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                        ),
                        validator: (input) => input.trim().isEmpty? 'Mohon masukkan email': null,                          
                        controller: emailCtrl,                  
                      ),
                      SizedBox(height: 24.0),

                      Text("Password", style: labelTextStyle,),
                      SizedBox(height: 8.0,),
                      TextFormField(
                        style: TextStyle(fontSize: 14.0),
                        decoration: InputDecoration(                                                            
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                        ),                  
                        obscureText: true,
                        validator: (input) => input.length < 6 
                        ? 'Password harus lebih dari 6 karakter' : null,                       
                        controller: passwordCtrl,                  
                      ),                          
                      
                      SizedBox(height: 44.0),

                      Container(
                        height: 50.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFF389048),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: FlatButton(
                          child: Text(
                            "Daftar Akun",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0
                            ),
                          ),
                          onPressed: _signUp,
                        ),
                      ),   
                    ],
                  )

                ),

                SizedBox(height: 14.0),

                Center(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Sudah Terdaftar? ",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Roboto',
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => widget.toogleView(),                       
                        child: Text(
                          "Login Sekarang",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                            color: Color(0xFF389048),
                          ),
                        ),
                      )
                    ],
                  ),
                )             
              ],
            ),
          ),
        )
      ),
    );
  }
}