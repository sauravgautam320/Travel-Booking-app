import 'dart:async';

import 'package:flutter/material.dart';
import 'package:travelveapp/homescreen.dart';
import 'package:travelveapp/login.dart';
import 'package:travelveapp/register.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Color.fromRGBO(178, 172, 136, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Travel+ve',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 24.0),
            Image.asset(
              'assets/images/logo.png',
              width: 200.0,
              height: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}