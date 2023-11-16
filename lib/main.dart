import 'package:flutter/material.dart';
import 'package:flutter_test_targetsistemas/Models/HomePage/HomePage.dart';
import 'package:flutter_test_targetsistemas/Models/LoginPage/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/login": (context) => LoginPage(),
        "/home": (context) => HomePage(),
      },
      debugShowCheckedModeBanner: false,
        title: "Target Sistemas",
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginPage(),
    );
  }
}
