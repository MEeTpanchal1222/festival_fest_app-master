import 'dart:async';

import 'package:flutter/material.dart';

class splesh_screen extends StatefulWidget {
  const splesh_screen({super.key});

  @override
  State<splesh_screen> createState() => _splesh_screenState();
}

class _splesh_screenState extends State<splesh_screen> {

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
    return Scaffold(
      body: Center(
        child: Container(
          height: 1000,
            child: Image.asset('assets/slashscreen.jpg',fit: BoxFit.fitHeight,)),
      ),
    );
  }
}