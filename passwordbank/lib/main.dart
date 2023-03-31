import 'dart:async';

import 'package:flutter/material.dart';
import 'auth_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Bank',
      home: SplashScreen(),
      routes: {
        '/login': (context) => AuthScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 2500), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xFF32BEA6),
        body: Center(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/lockedcloud.png',
                    width: 200.0,
                  ),
                  SizedBox(height: 50.0),
                  Text(
                    'Password Bank',
                    style: TextStyle(
                      fontSize: 40.0,
                      //fontWeight: FontWeight.normal,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 180.0),
                  SpinKitFoldingCube(
                    color: Colors.white,
                    size: 50.0,
                  ),
                  //CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
