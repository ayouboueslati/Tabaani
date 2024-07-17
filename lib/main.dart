import 'package:flutter/material.dart';
import 'package:tabaani/bottomNavBar.dart';
import 'package:tabaani/home.dart';
import 'package:tabaani/profile.dart';
import 'package:tabaani/signin_Screen.dart';
import 'Signup_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: BottomNavBar.id,
      routes: {
        SignUpScreen.id: (context) => SignUpScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        SigninScreen.id: (context) => SigninScreen(
              onLoginPressed: () {
                Navigator.pushReplacementNamed(context, BottomNavBar.id);
              },
            ),
        ProfileScreen.id: (context) => ProfileScreen(),
      },
    );
  }
}
