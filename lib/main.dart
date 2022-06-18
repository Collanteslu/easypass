import 'package:easypass/pages/PasswordGenerator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easypassword',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PasswordGenerator(title: 'Easypassword'),
    );
  }
}
