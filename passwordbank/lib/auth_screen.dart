import 'package:flutter/material.dart';
import 'login_page.dart';
import 'new_user.dart';

// class AuthScreen extends StatefulWidget {
//   @override
//   State createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   bool _isLogin = true;
//   String email = 'email';
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
//                     email = value;
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
void main() => runApp(AuthScreen());

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
        // theme: ThemeData(
        //   appBarTheme: AppBarTheme(
        //     iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
        //     color: Color(0xFFFACB1B),
        //   ),
        // ),
        home: GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Color(0xFF32BEA6),
        // appBar: AppBar(
        //   title: Text('Account options',
        //       style: TextStyle(
        //           fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
        //   centerTitle: true,
        //   foregroundColor: Color(0xFFFFFFFF),
        // ),
        body: Center(
            child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(20),
                  child: Image(
                    width: 200,
                    image: AssetImage('assets/images/lockedcloud.png'),
                  ),
                ),
                SizedBox(height: 30.0),
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
                SizedBox(height: 200.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Color(0xFF32BEA6)),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
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
                      child: Text('Sign-in',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          )),
                    ),
                    SizedBox(width: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage()),
                        );
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Color(0xFF32BEA6)),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
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
                      child: Text('Sign-up',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          )),
                    ),
                  ],
                ),
              ]),
        )),
      ),
    ));
  }
}
