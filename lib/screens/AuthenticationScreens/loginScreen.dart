import 'package:TIStudent/global.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../DrawerScreens/navigationHomeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/login_bg.jpg"),
              fit: BoxFit.cover),
        ),
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width * 0.8,
              width: MediaQuery.of(context).size.width * 0.8,
              child: Image.asset(
                "assets/images/ti_logo.png",
                scale: 0.25,
              ),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              elevation: 4.0,
              onPressed: () {
                signInWithGoogle().whenComplete(() {
                  if (myEmailID != '') {
                    if (myEmailID.endsWith('@thapar.edu')) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) {
                            return NavigationHomeScreen();
                          },
                        ),
                      );
                    } else {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text(
                              "Invalid Email. Please try again with @thapar.edu Email ID.")));
                      signOutGoogle();
                    }
                  } else {
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text("Login failed. Please try again.")));
                  }
                });
              },
              child: Container(
                alignment: Alignment.center,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      FontAwesomeIcons.google,
                      size: 18.0,
                      color: Colors.white,
                    ),
                    Text(
                      "  Sign In with @thapar.edu",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0),
                    ),
                  ],
                ),
              ),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
