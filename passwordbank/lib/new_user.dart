import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_screen.dart';
import 'password_data.dart';
import 'package:intl/intl.dart';
//import 'package:flutter_captcha/flutter_captcha.dart';

class SignupPage extends StatefulWidget {
  @override
  State createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final ScrollController firstController = ScrollController();
  final formKey = GlobalKey<FormState>();
  String username = '';
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String repeatPassword = '';
  String phoneNumber = '';
  TextEditingController dateInput = TextEditingController();
  // bool captchaValidation = false;
  TextEditingController controller = TextEditingController();
  Color buttonColor = Colors.white;

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
          color: Color(0xFFFACB1B),
        ),
        // scrollbarTheme: ScrollbarThemeData(
        //   interactive: true,
        //   //radius: const Radius.circular(10.0),
        //   thumbColor: MaterialStateProperty.all(Color(0xFFFACB1B)),
        //   // thickness: MaterialStateProperty.all(5.0),
        //   // minThumbLength: 100,
        // ),
        //highlightColor: Color(0xFFFACB1B),
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
            title: Text('New User Registration',
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
            leading: IconButton(
              onPressed: () {
                controller.clear();
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthScreen()),
                );
              },
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              tooltip: 'Home',
            ),
            actions: <Widget>[
              // Padding(padding: EdgeInsets.all(20)),
              IconButton(
                icon: Icon(Icons.refresh),
                tooltip: 'Reset form',
                onPressed: () {
                  controller.clear();
                  formKey.currentState?.reset();
                },
                color: Colors.white,
              ),
              // IconButton(
              //   icon: Icon(Icons.refresh),
              //   tooltip: 'Reset form',
              //   onPressed: () {
              //     controller.clear();
              //     formKey.currentState?.reset();
              //   },
              //   color: Colors.white,
              // ),
            ],
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                                      borderSide: BorderSide(
                                          color: Color(0xFF818284)))),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Username cannot be blank';
                                } else if (!RegExp(
                                        r"^[A-Za-z][A-Za-z0-9_]{7,29}$")
                                    .hasMatch(value)) {
                                  return 'Invalid entry';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  username = value;
                                });
                              }),
                          TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.account_box,
                                    color: Color(0xFFDBF4F4),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFFFACB1B))),
                                  labelText: "First Name",
                                  labelStyle: TextStyle(color: Colors.white),
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
                                  return 'Name cannot be blank';
                                } else if (!RegExp(r"^[a-zA-Z]+$")
                                    .hasMatch(value)) {
                                  return 'Invalid entry';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  firstName = value;
                                });
                              }),
                          TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.account_box,
                                    color: Color(0xFFDBF4F4),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFFFACB1B))),
                                  labelText: "Last Name",
                                  labelStyle: TextStyle(color: Colors.white),
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
                                  return 'Name cannot be blank';
                                } else if (!RegExp(r"^[a-zA-Z]+$")
                                    .hasMatch(value)) {
                                  return 'Invalid entry';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  lastName = value;
                                });
                              }),
                          TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.numbers,
                                    color: Color(0xFFDBF4F4),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFFFACB1B))),
                                  labelText: "Cell Number",
                                  labelStyle: TextStyle(color: Colors.white),
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
                                  return 'Cell number cannot be blank';
                                } else if (!RegExp(
                                        r'(^(?:[+0]9)?[0-9]{10,12}$)')
                                    .hasMatch(value)) {
                                  return 'Invalid entry';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                setState(() {
                                  phoneNumber = value;
                                });
                              }),
                          TextFormField(
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.email_outlined,
                                    color: Color(0xFFDBF4F4),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Color(0xFFFACB1B))),
                                  labelText: "Email",
                                  labelStyle: TextStyle(color: Colors.white),
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
                                  password = value;
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
                                  labelText: "Re-enter Password",
                                  labelStyle: TextStyle(color: Colors.white),
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
                                  repeatPassword = value;
                                });
                              }),
                          SizedBox(
                            height: 10.0,
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            controller: dateInput,
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.white,
                                ),
                                labelText: 'Date of Birth',
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFFACB1B))),
                                labelStyle: TextStyle(color: Colors.white),
                                errorStyle: TextStyle(
                                    color: Colors.red,
                                    fontFamily: 'Montserrat',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFF818284)))),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: Color(0xFFFACB1B),
                                          onPrimary: Color(0xFF692E19),
                                          onSurface: Color(0xFF692E19),
                                        ),
                                        textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
                                          primary: Color(0xFF692E19),
                                        )),
                                      ),
                                      child: child!,
                                    );
                                  },
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2100),
                                  confirmText: "OK",
                                  cancelText: "Cancel");
                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  dateInput.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            },
                          ),
                          // SizedBox(
                          //   height: 20.0,
                          // ),
                          // Text('reCAPTCHA'),
                          SizedBox(
                            height: 30.0,
                          ),
                          // SizedBox(
                          //   height: 100.0,
                          // ),
                          // TextFormField(
                          //     decoration: InputDecoration(
                          //         labelText: 'Validate',
                          //         enabledBorder: UnderlineInputBorder(
                          //             borderSide:
                          //                 BorderSide(color: Color(0xFFFACB1B))),
                          //         labelStyle: TextStyle(color: Colors.white),
                          //         errorStyle: TextStyle(
                          //             color: Colors.red,
                          //             fontFamily: 'Montserrat',
                          //             fontSize: 14,
                          //             fontWeight: FontWeight.w600),
                          //         focusedBorder: OutlineInputBorder(
                          //             borderSide:
                          //                 BorderSide(color: Color(0xFF818284)))),
                          //     keyboardType: TextInputType.name,
                          //     validator: (value) {
                          //       if (value == null || value.isEmpty) {
                          //         return 'Cannot be blank';
                          //       } else if (value != captchaValidation) {
                          //         return 'Incorrect, try again';
                          //       } else {
                          //         Icon(Icons.check_box_outlined);
                          //       }
                          //       return null;
                          //     },
                          //     onChanged: (value) {
                          //       setState(() {
                          //         // captchaValidation = value;
                          //       });
                          //     }),
                          // SizedBox(height: 50.0),
                          ElevatedButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   const SnackBar(
                                //       content: Text('Processing Data')),
                                // );
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
                            child: Text('Create Account',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                )),
                          ),
                        ],
                      ),
                    ))),
          ),
        ),
      ),
    );
  }
}
