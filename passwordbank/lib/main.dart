import 'dart:async';

import 'package:flutter/material.dart';
import 'auth_screen.dart';
// import './showcase.dart';
// import './workspace.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// import 'package:flutter/material.dart';
// //import 'package:flurry/flurry.dart';

// class MyAppBar extends StatelessWidget {
//   const MyAppBar(
//       {required this.title,
//       required this.name,
//       required this.place,
//       super.key});

//   final Widget title;
//   final Widget name;
//   final Widget place;

//   @override
//   Widget build(BuildContext context) {
//     return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//       Container(
//           height: 777.4,
//           width: 120.0, // in logical pixels
//           padding: const EdgeInsets.symmetric(vertical: 30.0),
//           decoration: BoxDecoration(color: Colors.blueGrey),
//           child: Column(
//               //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 //Expanded(flex: 4, child:
//                 title,
//                 //),
//                 //Expanded(
//                 //flex: 4,
//                 //child:
//                 Image.asset('assets/images/42770_crop.jpg'), //),
//                 name,
//                 place
//               ]))
//     ]);
//   }
// }

// class MyScaffold extends StatelessWidget {
//   const MyScaffold({super.key});

//   static const appTitle = 'Login';

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: appTitle,
//       home: MyHomePage(title1: appTitle),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key, required this.title1});

//   final String title1;

//   @override
//   Widget build(BuildContext context) {
//     // Material is a conceptual piece
//     // of paper on which the UI appears.
//     // return Material(
//     return Scaffold(
//       appBar: AppBar(title: Text(title1)),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             const DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blueGrey,
//               ),
//               child: Text('Navigation'),
//             ),
//             ListTile(
//               title: const Text('Home'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: const Text('Back'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               title: const Text('Next'),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// //crossAxisAlignment: CrossAxisAlignment.center,
// //mainAxisAlignment: MainAxisAlignment.end,
// // children: [
// //   MyAppBar(
// //     title: Text(
// //       'Portfolio',
// //       style: Theme.of(context) //
// //           .primaryTextTheme
// //           .headlineSmall,
// //     ),
// //     name: Text(
// //       'Rashmi',
// //       style: Theme.of(context).primaryTextTheme.titleLarge,
// //     ),
// //     place: Text('Udupi, IN',
// //         style: Theme.of(context).primaryTextTheme.titleMedium),
// //   ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// void main() {
//   runApp(
//     const MaterialApp(
//       title: 'Portfolio', // used by the OS task switcher
//       home: SafeArea(
//         child: MyScaffold(),
//       ),
//     ),
//   );
// }

// // // preload images
// // class AppImages {
// //  static const String imagesPath = “assets/images/”;
// //  static const String gal = imagesPath + “42770_crop.jpg”;
// // }

// // Image myImage;
// // @override
// // void initState() {
// //  super.initState();
// //  myImage = Image.asset(AppImages.gal);
// // }

// // @override
// // void didChangeDependencies() {
// //   super.didChangeDependencies();
// //   precacheImage(myImage.image, context); // <-- SEE HERE
// // }

// import 'package:flutter/material.dart';
// import 'login_page.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Welcome to Flutter',
//       home: WelcomeScreen(),
//     );
//   }
// }

// class WelcomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Welcome to Flutter'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Welcome to my app!',
//               style: TextStyle(
//                 fontSize: 30.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               child: Text('Log In'),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => LoginPage()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class LoginPage extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Log In'),
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'Log in to my app',
//             style: TextStyle(
//               fontSize: 30.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 20.0),
//           ElevatedButton(
//             child: Text('Go back'),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//     ),
//   );
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Bank',
      home: SplashScreen(),
      routes: {
        '/login': (context) => AuthScreen(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 8), () {
      Navigator.pushReplacementNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF32BEA6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //Expanded(
            //flex: 10,
            //child:
            Image.asset('assets/images/lockedcloud.png'),
            //),
            SizedBox(height: 50.0),
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
            SizedBox(height: 80.0),
            SpinKitFoldingCube(
              color: Colors.white,
              size: 70.0,
            ),
            //CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

// //class MyScaffold extends StatelessWidget {
//   const MyScaffold({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Material is a conceptual piece
//     // of paper on which the UI appears.
//     return Material(
//       child: Row(
//         //crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           MyAppBar(
//             title: Text(
//               'Portfolio',
//               style: Theme.of(context) //
//                   .primaryTextTheme
//                   .headlineSmall,
//             ),
//             name: Text(
//               'Rashmi',
//               style: Theme.of(context).primaryTextTheme.titleLarge,
//             ),
//             place: Text('Udupi, IN',
//                 style: Theme.of(context).primaryTextTheme.titleMedium),
//           ),
//         ],
//       ),
//     );
//   }
// }

// void main() {
//   runApp(
//     const MaterialApp(
//       title: 'Portfolio', // used by the OS task switcher
//       home: SafeArea(
//         child: MyScaffold(),
//       ),
//     ),
//   );
// }

// // preload images
// class AppImages {
//  static const String imagesPath = “assets/images/”;
//  static const String gal = imagesPath + “42770_crop.jpg”;
// }

// Image myImage;
// @override
// void initState() {
//  super.initState();
//  myImage = Image.asset(AppImages.gal);
// }

// @override
// void didChangeDependencies() {
//   super.didChangeDependencies();
//   precacheImage(myImage.image, context); // <-- SEE HERE
// }
