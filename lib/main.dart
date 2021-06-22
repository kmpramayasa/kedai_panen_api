import 'package:flutter/material.dart';
import 'package:layout/services/authentication_services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:layout/widget/authentication_widget.dart';
import 'package:layout/widget/bottom_navigation_widget.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';


Future<void> main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),

        StreamProvider(
          create: (context) => context.read<AuthenticationService>().authStateChanges,
        )
      ],
      child: MaterialApp(
        title: 'Kedai Panen',
        debugShowCheckedModeBanner: false,
        home: AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    // print(firebaseUser);      

    if(firebaseUser != null){
      print(firebaseUser);
      return BottomNavigation();      
    } else {
      return Authentication();   
    }
  }  
}
