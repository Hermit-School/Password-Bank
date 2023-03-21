import 'package:flutter/material.dart';
import 'authscreen.dart';
//import 'login_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String _email = 'enter email here';
  String _password = 'enter password here';
  Color buttonColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
            color: Color(0xFFFACB1B),
          ),
        ),
        home: Scaffold(
          backgroundColor: Color(0xFF32BEA6),
          appBar: AppBar(
            centerTitle: true,
            foregroundColor: Color(0xFFFFFFFF),
            title: Text("Sign-in",
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthScreen()),
                );
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Welcome back!',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                      )),
                  SizedBox(height: 30),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFACB1B))),
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF818284)),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFFACB1B))),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF818284)),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Your login code here
                    },
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all(Color(0xFF32BEA6)),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Color(
                                0xFFFACB1B); // The button color when it's pressed
                          } else {
                            return buttonColor; // The button color when it's not pressed
                          }
                        },
                      ),
                    ),
                    child: Text("Submit",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Montserrat',
                        )),
                  ),
                ]),
          ),
        ));
  }
}
