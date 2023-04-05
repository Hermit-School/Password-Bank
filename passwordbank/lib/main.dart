import 'dart:async';

import 'package:flutter/material.dart';
import 'auth_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() => runApp(MyApp());

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Bank',
      key: Key('Main Page Title'),
      home: SplashScreen(),
      navigatorKey: navigatorKey,
      initialRoute: '/',
      routes: {
        // '/': (context) => SplashScreen(),
        '/AuthScreen': (context) => AuthScreen(),
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
      // Navigator.pushReplacementNamed(context, '/AuthScreen');
      navigatorKey.currentState?.pushNamed('/AuthScreen');
      Key('Main Page Navigator');
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
                    key: Key('Main Page Logo'),
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
                    key: Key('Main Page Text'),
                  ),
                  SizedBox(height: 180.0),
                  SpinKitFoldingCube(
                    color: Colors.white,
                    size: 50.0,
                    key: Key('Main Page Progressbar'),
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
