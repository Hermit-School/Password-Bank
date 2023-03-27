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
            title: Text("Change Password",
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              icon: Icon(Icons.arrow_back),
              tooltip: 'Home',
              color: Colors.white,
            ),
          ),
          body: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Text('Change Password',
                    //     style: TextStyle(
                    //       fontSize: 30.0,
                    //       fontWeight: FontWeight.bold,
                    //       fontFamily: 'Montserrat',
                    //       color: Colors.white,
                    //     )),
                    // SizedBox(height: 50),
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
                        labelText: "Enter OTP",
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF818284)),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          otp = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFACB1B))),
                        labelText: "New Password",
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF818284)),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          newPassword = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFACB1B))),
                        labelText: "Re-enter New Password",
                        labelStyle: TextStyle(color: Colors.white),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF818284)),
                        ),
                      ),
                      onChanged: (value) {
                        // code to verify newPassword == repeatNewPassword else error
                        setState(() {
                          repeatNewPassword = value;
                        });
                      },
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    if (newPassword == '' || repeatNewPassword == '')
                      Text('')
                    else if (newPassword == repeatNewPassword)
                      Text(
                        'Passwords match',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Color(0xFF05594A),
                        ),
                      )
                    else if (newPassword != '' || repeatNewPassword != '')
                      Text(
                        'Passwords do not match!',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          color: Colors.red,
                        ),
                      ),
                    // else
                    //   Text(''),
                    SizedBox(
                      height: 50.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Code to display snackbar Password changed successfully! with button to route back to LoginPage()
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
                      child: Text("Submit",
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
