import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_screen.dart';
import 'password_data.dart';
//import 'package:flutter_captcha/flutter_captcha.dart';

class SignupPage extends StatefulWidget {
  @override
  State createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final ScrollController firstController = ScrollController();
  final formKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String phoneNumber = '';
  TextEditingController dateInput = TextEditingController();
  bool captchaValidation = false;
  TextEditingController controller = TextEditingController();

  Color buttonColor = Colors.white;

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
      home: Scaffold(
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AuthScreen()),
              );
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            tooltip: 'Home',
          ),
        ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'First Name'),
                    keyboardType: TextInputType.name,

                    // validator: (value) {
                    //   if (value.isEmpty) {
                    //     return 'Please enter a firstname';
                    //   }
                    //   return null;
                    // },
                    onSaved: (value) {
                      firstName = '';
                    },
                  ),

                  TextFormField(
                    decoration: InputDecoration(labelText: 'Last Name'),
                    keyboardType: TextInputType.name,

                    // validator: (value) {
                    //   if (value.isEmpty) {
                    //     return 'Please enter a lastname';
                    //   }
                    //   return null;
                    // },
                    onSaved: (value) {
                      lastName = '';
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    keyboardType: TextInputType.emailAddress,

                    // validator: (value) {
                    //           if (value.isEmpty) {
                    //                         return 'Please enter your email';
                    //                       }
                    //                       return null;
                    //                     },
                    onSaved: (value) {
                      email = 'email';
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    //   validator: (value) {
                    // 	if (value.isEmpty) {
                    // 	   return 'Please enter your password';
                    // 	 }
                    // 	return null;
                    // },
                    onSaved: (value) {
                      password = '';
                    },
                  ),
                  TextField(
                    controller: dateInput,
                    decoration: InputDecoration(
                        icon: Icon(Icons.calendar_today),
                        labelText: 'Enter Date'),
                    readOnly: true,
                  ),
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     return 'Please enter your password';
                  //   }
                  //   return null;
                  // },
                  //onSaved: (value) {
                  //dob = 'dob';
                  //},
                  // ),),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text('CAPTCHA'),
                  SizedBox(
                    height: 100.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Validate'),
                    keyboardType: TextInputType.name,
                    // validator: (value) {
                    //   if (value.isEmpty) {
                    //     return 'Please enter your password';
                    //   }
                    //   return null;
                    // },
                    // onSaved: (value) {
                    //   firstName = 'firstname';
                    // },
                  ),
                  SizedBox(height: 50.0),
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => PasswordHomePage()),
                      // );
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
                    child: Text('Create Account',
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
        ),
      ),
    );
  }
}
