//this lists all the saved password data and provides an appbar back arrow button to go back to password_entry.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_screen.dart'; //for sign-out
import 'login_page.dart';

void main() => runApp(const PasswordHomePage());

class PasswordHomePage extends StatelessWidget {
  const PasswordHomePage({super.key});

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
        backgroundColor:
            // Colors.white,
            Color(0xFF32BEA6),
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Color(0xFFFFFFFF),
          title: Text('Password Data',
              style: TextStyle(
                  fontFamily: 'Montserrat', fontWeight: FontWeight.bold)),
          leading: IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => AuthScreen()),
              // );
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            tooltip: 'Home',
          ),
        ),
        body: const PasswordData(),
      ),
    );
  }
}

class PasswordData extends StatefulWidget {
  const PasswordData({super.key});

  @override
  State createState() => PasswordDataState();
}

class PasswordDataState extends State<PasswordData> {
  final List<int> items = List<int>.generate(50, (int index) => index);

  final ScrollController firstController = ScrollController();
  final formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  final List<String> entries = <String>[
    'fb',
    'ig',
    'linkedin',
    'twitter',
    'indeed'
  ];
  final List<int> colorCodes = <int>[700, 600, 500, 400, 300];

  @override
  Widget build(BuildContext context) {
    // final ColorScheme colorScheme = Theme.of(context).colorScheme;
    // final Color oddItemColor = Color(0xFFF0F1F1).withOpacity(0.10);
    // final Color evenItemColor = Color(0xFFFFFFFF).withOpacity(0.20);
    // SizedBox(height: 50, width: 50);
    return Container(
      child: Scrollbar(
        child: ListView.separated(
          // padding: EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.blueGrey[colorCodes[index]],
              child: Center(
                  child: Text('Account ${entries[index]}',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          color: Colors.white))),
            );
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}
    
    // Container(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Scrollbar(
    //         child: ListView(
    //           padding: EdgeInsets.all(10),
    //           children: <Widget>[
    //             Container(
    //               height: 100,
    //               child: Center(
    //                   child: Text('facebook',
    //                       style: TextStyle(color: Colors.white))),
    //             ),
    //             Container(
    //               height: 100,
    //               child: Center(
    //                   child: Text('instagram',
    //                       style: TextStyle(color: Colors.white))),
    //             ),
    //             Container(
    //               height: 100,
    //               child: Center(
    //                   child: Text('linkedin',
    //                       style: TextStyle(color: Colors.white))),
    //             ),
    //           ],
      //       ),
      //     ),
      //   ],
      // ),

      // child: ReorderableListView(
      //     padding: const EdgeInsets.symmetric(horizontal: 40),
      //     children: <Widget>[            // Text('Welcome back,')+firstName+(' !');
      //       for (int index = 0; index < items.length; index += 1)
      //         ListTile(
      //           key: Key('$index'),
      //           tileColor: items[index].isOdd ? oddItemColor : evenItemColor,
      //           title: Text('Item ${items[index]}'),
      //         ),
      //     ],
      //     onReorder: (int oldIndex, int newIndex) {
      //       setState(() {
      //         if (oldIndex < newIndex) {
      //           newIndex -= 1;
      //         }
      //         final int item = items.removeAt(oldIndex);
      //         items.insert(newIndex, item);
      //       });
      //     }),
//     );
//   }
// }
