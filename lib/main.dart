import 'package:flutter/material.dart';
import 'package:tabaani/Signup_Screen.dart';
import 'package:tabaani/bottomNavBar.dart';
import 'package:tabaani/signin_Screen.dart';
import 'package:tabaani/home.dart';
import 'package:tabaani/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tabaani App',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: SignUpScreen.id,
      routes: {
        SigninScreen.id: (context) => SigninScreen(
              onLoginPressed: () {
                Navigator.pushReplacementNamed(context, BottomNavBar.id);
              },
            ),
        SignUpScreen.id: (context) => SignUpScreen(),
        BottomNavBar.id: (context) => BottomNavBar(),
        HomeScreen.id: (context) => HomeScreen(),
        ProfileScreen.id: (context) => ProfileScreen(),
      },
      onGenerateRoute: (settings) {
        // Handle unknown routes
        if (settings.name == BottomNavBar.id) {
          return MaterialPageRoute(builder: (context) => BottomNavBar());
        }
        return null;
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => SigninScreen(
            onLoginPressed: () {
              Navigator.pushReplacementNamed(context, BottomNavBar.id);
            },
          ),
        );
      },
    );
  }
}
