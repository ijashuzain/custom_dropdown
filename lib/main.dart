import 'package:custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String title = "Select Item";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: CustomDropdown(
              iconSize: 20,
              itemSize: 10,
              iconColor: Colors.black,
              iconList: [
                Icons.person,
                Icons.access_alarm_sharp,
                Icons.ac_unit_rounded,
              ],
              withIcon: true,
              items: ["dsfs", "sdfsd", "sdfsdf"],
              width: 100,
              height: 30,
              // backgroundColor: Colors.purple,
              backgroundGradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xffbe06a62), Color(0xffbe2639d)]),
              listBackgroundColor: Colors.grey[200],
              title: title,
              borderRadius: 16,
              titleColor: Colors.white,
              titleSize: 12,
              onChange: (value) {
                setState(() {
                  title = value;
                  print(title);
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
