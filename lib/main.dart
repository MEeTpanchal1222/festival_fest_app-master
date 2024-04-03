import 'package:festival_fest_app/view/edit_screen/edit_screen.dart';
import 'package:festival_fest_app/view/gotoedit_screen/gotoedit_screen.dart';
import 'package:festival_fest_app/view/home_screen/home_screen.dart';
import 'package:festival_fest_app/view/slashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => splesh_screen(),
        '/home':(context) => Home_screen(),
         '/gotoedit':(context) => gotoedit_screen(),
        '/edit':(context) => Edit_screen(),
      },
    );
  }
}