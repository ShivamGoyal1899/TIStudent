import 'package:TIStudent/screens/AuthenticationScreens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(TIStudentApp());
}

class TIStudentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'TIStudent',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Quicksand',
        iconTheme: IconThemeData(color: Colors.white),
        appBarTheme: AppBarTheme(color: Colors.white, elevation: 0.0),
      ),
      home: LoginScreen(),
    );
  }
}
