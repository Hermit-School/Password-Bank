import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar(
      {required this.title,
      required this.name,
      required this.place,
      super.key});

  // Fields in a Widget subclass are always marked "final".

  final Widget title;
  final Widget name;
  final Widget place;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          height: 777.4,
          width: 120.0, // in logical pixels
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          decoration: BoxDecoration(color: Colors.blueGrey),
          child: Column(children: [
            Expanded(
              child: title,
            ),
            // Row(children: [
            //   Expanded(
            name,
            // ),
            // Expanded(
            place,
            // ])
            // ),
          ]))
    ] // Children
        ); //)
    //   ],
    // );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Material(
      child: Row(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          MyAppBar(
            title: Text(
              'Portfolio',
              style: Theme.of(context) //
                  .primaryTextTheme
                  .headlineSmall,
            ),
            name: Text(
              'Rashmi',
              style: Theme.of(context).primaryTextTheme.titleLarge,
            ),
            place: Text('Udupi, IN',
                style: Theme.of(context).primaryTextTheme.titleMedium),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      title: 'Portfolio', // used by the OS task switcher
      home: SafeArea(
        child: MyScaffold(),
      ),
    ),
  );
}
