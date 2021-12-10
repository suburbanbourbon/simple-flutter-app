import 'package:flutter/material.dart';
import 'package:simple_flutter_app/form_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const FormScreen(),
    );
  }
}

// TODO: put all widgets in one file
// TODO: display message at the bottom after a certain operation
// TODO: use unused variables
// TODO: clear all fields after entering data
// TODO: handle errors for delete record and show message
// TODO: handle errors for various other fields