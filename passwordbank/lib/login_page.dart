import 'forgot_password.dart';
import 'auth_screen.dart';
import 'package:flutter/material.dart';

// Define a custom Form widget.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.

class LoginPageState extends State<LoginPage> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<LoginPageState>.

  String username = '';
  String password = '';
  Color buttonColor = Colors.white;
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the formKey created above.
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
          color: Color(0xFFFACB1B),
        ),
      ),
      home: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: Color(0xFF32BEA6),
          appBar: AppBar(
            centerTitle: true,
            foregroundColor: Color(0xFFFFFFFF),
            title: Text("Sign-in",
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
            leading: IconButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                controller.clear();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthScreen()),
                );
              },
              icon: Icon(Icons.arrow_back),
              tooltip: 'Home',
              color: Colors.white,
            ),
          ),
          resizeToAvoidBottomInset: false,
          body: Center(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Form(
                  key: formKey,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Welcome back!',
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat',
                              color: Colors.white,
                            )),
                        SizedBox(height: 50),
                        TextFormField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.alternate_email,
                                  color: Color(0xFFDBF4F4),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFFACB1B))),
                                labelText: "Username",
                                labelStyle: TextStyle(color: Colors.white),
                                errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF818284)))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Username cannot be blank';
                              } else if (!RegExp(
                                          r"^(?![0-9])[A-Za-z][A-Za-z0-9_]{7,29}$")
                                      .hasMatch(value)
                                  //      ||
                                  // (!RegExp(
                                  //         r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  //     .hasMatch(value))
                                  ) {
                                return 'Invalid Username';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                username = value;
                              });
                            }),
                        TextFormField(
                            // scrollPadding: EdgeInsets.all(16.0),
                            style: TextStyle(color: Colors.white),
                            obscureText: true,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock_outline,
                                  color: Color(0xFFDBF4F4),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFFACB1B))),
                                labelText: "Password",
                                labelStyle: TextStyle(color: Colors.white),
                                errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF818284)))),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password cannot be blank';
                              } else if (value.length < 8) {
                                return 'Password must be at least 8 characters long';
                              } else if (RegExp(
                                      r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#$&*~]).{8,}$')
                                  .hasMatch(value)) {
                                return 'Password must comply with requirements';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                password = value;
                              });
                            }),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              textStyle: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.underline),
                              foregroundColor: Color(0xFF8F4024)),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPasswordPage()),
                            );
                          },
                          child: const Text(
                            'Forgot Password?',
                            selectionColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.

                            if (formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
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
                          child: const Text('Sign-in',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                              )),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
