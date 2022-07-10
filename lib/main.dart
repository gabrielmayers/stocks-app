import 'package:flutter/material.dart';
import 'package:stocks_app/screens/home.dart';
import 'package:stocks_app/screens/login.dart';
import 'package:stocks_app/screens/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}