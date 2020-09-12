import 'package:flutter/material.dart';
import 'package:testapp/SQLITE.dart';
import 'package:testapp/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SQLITE(),

    );
  }
}
