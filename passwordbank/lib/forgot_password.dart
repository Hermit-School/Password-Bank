import 'package:flutter/material.dart';
import 'login_page.dart';

//void main() => runApp(ForgotPasswordPage());

class ForgotPasswordPage extends StatefulWidget {
  @override
  State createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  String email = '';
  String otp = '';
  String newPassword = '';
  String repeatNewPassword = '';
  Color buttonColor = Colors.white;
  final formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  bool isEnabledOTP = false;
  bool isEnabledPassword = false;
  bool isEnabledRePassword = false;
  final emailFormKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
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
                  title: Text("Change Password",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold)),
                  leading: IconButton(
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SSOLogin()),
                      );
                    },
                    icon: Icon(Icons.arrow_back),
                    tooltip: 'Home',
                    color: Colors.white,
                  ),
                  actions: <Widget>[
                    // Padding(padding: EdgeInsets.all(20)),
                    IconButton(
                      icon: Icon(Icons.refresh),
                      tooltip: 'Reset form',
                      onPressed: () {
                        controller.clear();
                        setState(() {
                          isEnabledOTP = false;
                          isEnabledPassword = false;
                          isEnabledRePassword = false;
                        });
                        formKey.currentState?.reset();
                      },
                      color: Colors.white,
                    ),
                  ]),
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
                                SizedBox(
                                  width: 300,
                                  child: TextFormField(
                                      key: emailFormKey,
                                      cursorColor: Color(0xFF818284),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Montserrat',
                                        fontSize: 17,
                                      ),
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFFFACB1B))),
                                          labelText: "Email",
                                          labelStyle:
                                              TextStyle(color: Colors.white),
                                          errorStyle: TextStyle(
                                              color: Colors.red,
                                              fontFamily: 'Montserrat',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFF818284)))),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'E-mail cannot be blank';
                                        } else if (!RegExp(
                                                r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value)) {
                                          return 'Invalid e-mail address';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          email = value;
                                        });
                                      }),
                                ),
                                SizedBox(
                                  height: 16.0,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (emailFormKey.currentState!.validate()) {
                                      setState(() {
                                        isEnabledOTP = true;
                                        isEnabledPassword = true;
                                        isEnabledRePassword = true;
                                      });
                                    }
                                  },
                                  style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all(
                                        Color(0xFF32BEA6)),
                                    backgroundColor: MaterialStateProperty
                                        .resolveWith<Color>(
                                      (states) {
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Color(
                                              0xFFFACB1B); // The button color when it's pressed
                                        } else {
                                          return buttonColor; // The button color when it's not pressed
                                        }
                                      },
                                    ),
                                  ),
                                  child: const Text('Send OTP',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 18,
                                          color: Color(0xFF32BEA6),
                                          fontWeight: FontWeight.w600)),
                                ),
                                SizedBox(
                                  height: 16.0,
                                ),
                                SizedBox(
                                  width: 300,
                                  child: TextFormField(
                                      enabled: isEnabledOTP,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Montserrat',
                                        fontSize: 17,
                                      ),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color(0xFFFACB1B))),
                                        labelText: "Enter OTP",
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        errorStyle: TextStyle(
                                            color: Colors.red,
                                            fontFamily: 'Montserrat',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xFF818284)),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'OTP cannot be blank';
                                        } else if (value.length < 6) {
                                          return 'Enter valid OTP';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          otp = value;
                                        });
                                      }),
                                ),
                                SizedBox(
                                  height: 16.0,
                                ),
                                SizedBox(
                                  width: 300,
                                  child: TextFormField(
                                      enabled: isEnabledPassword,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Montserrat',
                                        fontSize: 17,
                                      ),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFFFACB1B))),
                                          labelText: "New Password",
                                          labelStyle:
                                              TextStyle(color: Colors.white),
                                          errorStyle: TextStyle(
                                              color: Colors.red,
                                              fontFamily: 'Montserrat',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFF818284)))),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Password cannot be blank';
                                        } else if (value.length < 8) {
                                          return 'Password must be at least 8 characters long';
                                        } else if (RegExp(
                                                r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#$&*~]).{8,}$')
                                            .hasMatch(value)) {
                                          return 'Password must comply with the requirements';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          newPassword = value;
                                        });
                                      }),
                                ),
                                SizedBox(
                                  height: 16.0,
                                ),
                                SizedBox(
                                  width: 300,
                                  child: TextFormField(
                                      enabled: isEnabledRePassword,
                                      // scrollPadding: EdgeInsets.all(16.0),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Montserrat',
                                        fontSize: 17,
                                      ),
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFFFACB1B))),
                                          labelText: "Re-enter Password",
                                          labelStyle:
                                              TextStyle(color: Colors.white),
                                          errorStyle: TextStyle(
                                              color: Colors.red,
                                              fontFamily: 'Montserrat',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color(0xFF818284)))),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Password cannot be blank';
                                        } else if (value.length < 8) {
                                          return 'Password must be at least 8 characters long';
                                        } else if (RegExp(
                                                r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#$&*~]).{8,}$')
                                            .hasMatch(value)) {
                                          return 'Password must comply with the requirements';
                                        } else if (newPassword !=
                                            repeatNewPassword) {
                                          return 'Passwords do not match!';
                                        }
                                        return null;
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          repeatNewPassword = value;
                                        });
                                      }),
                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                //
                                // else
                                //   Text(''),
                                SizedBox(
                                  height: 50.0,
                                ),
                                Builder(builder: (BuildContext context) {
                                  return ElevatedButton(
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text('Updating ...',
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Montserrat',
                                                    color: Color(0xFF692E19))),
                                            duration: Duration(seconds: 1),
                                            backgroundColor: Color(0xFFDBF4F4),
                                          ),
                                        );
                                        Future.delayed(Duration(seconds: 1),
                                            () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SSOLogin()),
                                          );
                                        });
                                      }
                                    },
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Color(0xFF32BEA6)),
                                      backgroundColor: MaterialStateProperty
                                          .resolveWith<Color>(
                                        (states) {
                                          if (states.contains(
                                              MaterialState.pressed)) {
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
                                  );
                                })
                              ] //children
                              ),
                        )) //singlechild
                    ),
              )),
        ));
  }
}
