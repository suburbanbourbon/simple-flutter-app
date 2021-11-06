import 'package:flutter/material.dart';
import 'package:simple_flutter_app/form_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: FormScreen(),
    );
  }
}

// TODO: put all widgets in one file
// TODO: make new screen for displaying db records
// TODO: delete record
// TODO: learn typecasting
// ElevatedButton(
//   child: Text(
//     'Display',
//     style: TextStyle(
//       color: Colors.white, 
//       fontSize: 16
//     ),
//   ),
//   onPressed: () async {
//     List<Map<String, dynamic>> queryRows = await DatabaseHelper.instance.queryAll();
//     print(queryRows);
//   },
// ),
// ElevatedButton(
//   child: Text(
//     'Delete',
//     style: TextStyle(
//       color: Colors.white, 
//       fontSize: 16
//     ),
//   ),
//   onPressed: () async {
//     List<Map<String, dynamic>> queryRows = await DatabaseHelper.instance.queryAll();
//     print(queryRows);
//   },
// ),