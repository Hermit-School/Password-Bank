import 'package:flutter/material.dart';
import 'login_page.dart';

// class AuthScreen extends StatefulWidget {
//   @override
//   State createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   bool _isLogin = true;
//   String _email = 'email';
//   String _password = 'password';

//   void _submitForm() {
//     // Your authentication code here
//     print("Email: $_email, Password: $_password");
//   }

//   void _switchAuthMode() {
//     setState(() {
//       _isLogin = !_isLogin;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(_isLogin ? "Sign In" : "Sign Up"),
//       ),
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: "Email",
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//                 onChanged: (value) {
//                   setState(() {
//                     _email = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 16.0),
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   labelText: "Password",
//                   border: OutlineInputBorder(),
//                 ),
//                 onChanged: (value) {
//                   setState(() {
//                     _password = value;
//                   });
//                 },
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: _submitForm,
//                 child: Text(_isLogin ? "Sign In" : "Sign Up"),
//               ),
//               TextButton(
//                 onPressed: _switchAuthMode,
//                 child: Txt(_isLogin
//                     ? "Don't have an account? Sign Up"
//                     : "Already have an account? Sign In"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

//import 'dart:html';

// import 'package:flutter/material.dart';
// import 'login_page.dart';

class AuthScreen extends StatefulWidget {
  @override
  State createState() => AuthScreenState();
}

// class MyButton extends StatefulWidget {
//   @override
//   State createState() => AuthScreenState();
// }

class AuthScreenState extends State<AuthScreen> {
  Color buttonColor = Colors.white;
  // Color buttonForeColor = Color(0xFF32BEA6);
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
          title: Text('Account options',
              style: TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
          centerTitle: true,
          foregroundColor: Color(0xFFFFFFFF),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // buttonForeColor = Colors.white;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Color(0xFF32BEA6)),
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
                  // textStyle: MaterialStateProperty.resolveWith((states) {
                  //   if (states.contains(MaterialState.pressed)) {
                  //     return TextStyle(color: Colors.white);
                  //   }
                  //   return TextStyle(color: Color(0xFF32BEA6));
                  // })
                ),
                // style: ElevatedButton.styleFrom(
                //     backgroundColor: Colors.white,
                //     foregroundColor: Color(0xFF32BEA6)),
                child: Text('Access my account',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    )),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // buttonForeColor = Colors.white;
                  // Navigator.push(
                  //     context,// Handle sign-up button press
                  //   );
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Color(0xFF32BEA6)),
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
                  // textStyle: MaterialStateProperty.resolveWith((states) {
                  //   if (states.contains(MaterialState.pressed)) {
                  //     return TextStyle(color: Colors.white);
                  //   }
                  //   return TextStyle(color: Colors.white);
                  // })
                ),
                child: Text('I\'m new here',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
