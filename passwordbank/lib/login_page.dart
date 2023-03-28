import 'package:flutter/material.dart';
import 'package:resume_view/forgot_password.dart';
import 'auth_screen.dart';
// import 'password_data.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String email = 'enter email here';
  String password = 'enter password here';
  Color buttonColor = Colors.white;
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
          body: Form(
            key: formKey,
            child: Padding(
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
                    SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: SizedBox(height: 50)),
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
                            email = value;
                          });
                          validator:
                          (value) {
                            if (value.isEmpty) {
                              return 'E-mail cannot be empty!';
                            } else if (!RegExp(
                                    r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return 'Invalid e-mail address';
                            }
                            return null;
                          };
                        }),
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
                            password = value;
                          });
                          validator:
                          (value) {
                            if (value.isEmpty) {
                              return 'Password cannot be empty';
                            } else if (value.length < 8) {
                              return 'Password must be at least 8 characters long';
                            }
                            return null;
                          };
                        }),
                    SizedBox(
                      height: 20.0,
                    ),
                    // InkWell(
                    //     // child: Container(
                    //     //     color: Color(0xFFFACB1B),
                    //     //     width: 150,
                    //     //     height: 30,
                    //     child: Center(
                    //         child: Text('Forgot Password?',
                    //             style: TextStyle(
                    //               color: Color(0xFF692E19),
                    //             ))),
                    //     // ),
                    //     onTap: () {
                    //       // setState(() {
                    //       ForgotPasswordPage();
                    //     }),
                    // // },
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
                        if (formKey.currentState != null &&
                            formKey.currentState!.validate()) {
                          SizedBox(
                            height: 30.0,
                          );
                          Text(
                            'Processing Data',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                color: Colors.white),
                          );
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //   content: Text('Processing Data'),
                          //   duration: Duration(seconds: 1),
                          //   action: SnackBarAction(
                          //     label: 'Enter!',
                          //     onPressed: () {},
                          //   ),
                          // ));
                        } else if (formKey.currentState == null ||
                            formKey.toString().isEmpty) {
                          Text(
                            'Email can\'t be empty',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                color: Colors.white),
                          );
                        }

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => PasswordHomePage()),
                        // );
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
                      child: Text("Sign-In",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                          )),
                    ),
                  ]),
            ),
          ),
        ));
  }
}
