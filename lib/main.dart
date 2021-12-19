import 'dart:async';
import 'package:flutter/material.dart';
import 'package:simple_flutter_app/form_screen.dart';

void main() => runApp(const FirstApp());

class FirstApp extends StatelessWidget {
  const FirstApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3),
          ()=>Navigator.pushReplacement(context, 
                                        MaterialPageRoute(builder:
                                                          (context) => 
                                                           const FormScreen()
                                                         )
                                       )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}

// TODO: if possible put all widgets in file form_screen.dart from line 27 to 140 in a separate file
// TODO: use unused variables to display message at the bottom after a certain operation
// TODO: handle errors for delete record and show message
// TODO: handle errors for various other fields
// TODO: display records in a table
// TODO: display message when there are no records to display
// TODO: find any descrepencies and correct them (eg strings, filename, variable name, etc.)