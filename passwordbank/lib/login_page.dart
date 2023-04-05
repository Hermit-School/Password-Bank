import 'forgot_password.dart';
import 'auth_screen.dart';
import 'package:flutter/material.dart';

// Define a custom Form widget.
class SSOLogin extends StatefulWidget {
  const SSOLogin({super.key});

  @override
  SSOLoginState createState() {
    return SSOLoginState();
  }
}

bool passwordVisible = true;
String passwordStrength = '';
String usernameLength = '';
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
bool isValidUsername = false;
bool isValidPassword = false;

@override
void initState() {
  passwordVisible = true;
  usernameController.clear();
  passwordController.clear();
}

// String passwordTest = 'passWORD12#\$';
// Define a corresponding State class.
// This class holds data related to the form.

class SSOLoginState extends State<SSOLogin> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<LoginPageState>.

  String username = '';
  String password = '';
  Color buttonColor = Colors.white;
  // TextEditingController controller = TextEditingController();
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
            title: Text(
              "Login",
              style: TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
              key: Key('Login Page Title'),
            ),
            leading: IconButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                usernameController.clear();
                passwordController.clear();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthScreen()),
                );
              },
              icon: Icon(Icons.arrow_back),
              tooltip: 'Home',
              color: Colors.white,
              key: Key('Login Page Back Button'),
            ),
          ),
          resizeToAvoidBottomInset: false,
          body: Center(
            child: SingleChildScrollView(
              key: Key('Login Page Scrollbar'),
              physics: AlwaysScrollableScrollPhysics(),
              child: Form(
                  key: formKey,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome back!',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                          ),
                          key: Key('Login Page Text'),
                        ),
                        SizedBox(height: 50),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            controller: usernameController,
                            key: Key("Login Page Username"),
                            cursorColor: Color(0xFF818284),
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.alternate_email,
                                  color: Colors.white,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFFACB1B))),
                                hintText: 'Enter Username',
                                hintStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Montserrat'),
                                errorText: (!isValidUsername &&
                                        usernameController.text.isNotEmpty)
                                    ? usernameLength
                                    : null,
                                // labelText: "Username",
                                // labelStyle: TextStyle(color: Colors.white),
                                errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF818284)))),
                            // validator: (value) {
                            //   if (value == null || value.isEmpty) {
                            //     return 'Username cannot be blank';
                            //   } else if (!RegExp(
                            //               r"^(?![0-9])[A-Za-z][A-Za-z0-9_]{7,29}$")
                            //           .hasMatch(value)
                            //       //      ||
                            //       // (!RegExp(
                            //       //         r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            //       //     .hasMatch(value))
                            //       ) {
                            //     return 'Invalid Username';
                            //   }
                            //   return null;
                            // },
                            onChanged: (valueUser) {
                              if (valueUser.length < 8 ||
                                  RegExp(r'^[_.]').hasMatch(valueUser)) {
                                setState(() {
                                  isValidUsername = false;
                                  if (RegExp(r'^[!@#\$%\^&\*\(\)\-\+]')
                                      .hasMatch(valueUser[0])) {
                                    usernameLength = 'Invalid character';
                                  } else if (valueUser.length < 8) {
                                    usernameLength = 'Username is too short';
                                  } else {
                                    usernameLength = 'Invalid Username';
                                  }
                                });
                              } else {
                                setState(() {
                                  isValidUsername = true;
                                  usernameLength = '';
                                });
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                              controller: passwordController,
                              key: Key("Login Page Password"),
                              cursorColor: Color(0xFF818284),
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: 20,
                              ),
                              obscureText: passwordVisible,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: Colors.white,
                                  ),
                                  errorText: (!isValidPassword &&
                                          passwordController.text.isNotEmpty)
                                      ? passwordStrength
                                      : null,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFFFACB1B))),
                                  hintText: 'Enter Password',
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat'),
                                  // labelText: "Password",
                                  // labelStyle: TextStyle(color: Colors.white),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                        passwordVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        passwordVisible = !passwordVisible;
                                      });
                                    },
                                  ),
                                  errorStyle: TextStyle(
                                      color: Colors.red,
                                      fontFamily: 'Montserrat',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                  // errorMaxLines: 2,
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xFF818284)))),
                              // validator: (valuePass) {
                              //   // if (!RegExp(
                              //   //         r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$&*~]).{8,}$')
                              //   //     .hasMatch(passwordTest)) {
                              //   //   return 'Weak Password';
                              //   // } else {
                              //   //   return 'Strong Password';
                              //   // }
                              //   // return valuePass;
                              //   if (valuePass!.isEmpty) {
                              //     return 'Password cannot be blank';
                              //   } else if (valuePass.length < 8) {
                              //     return 'Password must be at least 8 characters';
                              //   } else if (!RegExp(
                              //           r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#$&*~]).{8,}$')
                              //       .hasMatch(valuePass)) {
                              //     return 'Weak Password';
                              //   }
                              //   return null;
                              // },
                              onChanged: (valuePass) {
                                if (valuePass.length < 8) {
                                  setState(() {
                                    isValidPassword = false;
                                    passwordStrength = 'Password is too short';
                                  });
                                } else if (RegExp(
                                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$%^&*()_+{}|:<>?~]).{8,}$')
                                    .hasMatch(valuePass)) {
                                  setState(() {
                                    isValidPassword = true;
                                    passwordStrength = '';
                                  });
                                } else {
                                  setState(() {
                                    isValidPassword = false;
                                    passwordStrength = 'Weak Password';
                                  });
                                }
                              }),
                        ),
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
                            Key("Login Page Navigator");
                          },
                          child: const Text(
                            'Forgot Password?',
                            selectionColor: Colors.white,
                            key: Key("Login Page Forgot Password Button"),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Builder(builder: (BuildContext context) {
                          return ElevatedButton(
                            onPressed: () {
                              Key("Login Page Login Button");
                              // Validate returns true if the form is valid, or false otherwise.

                              if (formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    key: Key("Login Page Snackbar"),
                                    content: Text('Signing in ...',
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF692E19))),
                                    duration: Duration(seconds: 2),
                                    backgroundColor: Color(0xFFDBF4F4),
                                  ),
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
                            child: const Text('Login',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                )),
                          );
                        }),
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
