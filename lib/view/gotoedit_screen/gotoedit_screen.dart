import 'package:festival_fest_app/uitels/listoffest.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../uitels/variable_for_globle.dart';


class gotoedit_screen extends StatefulWidget {
  const gotoedit_screen({super.key});

  @override
  State<gotoedit_screen> createState() => _gotoedit_screenState();
}

class _gotoedit_screenState extends State<gotoedit_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(
          image: AssetImage('assets/logo.png'),
          height: 50,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff1c2438),
      ),
      body: Stack(
        children: [
           Container(
              height: 180,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Color(0xff1d243b),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(250, 250),
                    bottomRight: Radius.elliptical(250, 250),
                  )),),
          Column(
            children: [
              Expanded(
                child:
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: 300,
                        width: 300,
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 0.5,
                              spreadRadius: 1,
                            )
                          ],
                          color: Colors.black,
                        ),
                        child: Image.asset(
                          festlist[Index]['Image'],
                          fit: BoxFit.contain,
                        )),
                    const SizedBox(height: 20,),
                    InkWell(
                      onTap: () {
                        setState(() {
                          edit_screenindex = 6;
                        });
                        Navigator.of(context).pushNamed('/edit');
                      },
                      child: Container(
                        height: 60,
                        width: 300,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text('Edit Template',style: TextStyle(color: Colors.white,fontSize: 20),),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 220,
                alignment: Alignment.bottomRight,
                decoration: const BoxDecoration(
                    color: Color(0xfffcbd05),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(250, 250),
                        topRight: Radius.elliptical(200, 200))),
                child: Container(
                  height: 180,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: Color(0xff1d243b),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(250, 250),
                          topRight: Radius.elliptical(250, 250),
                      )),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 35,
                      ),
                      Text(
                        'FestiVals',
                        style: GoogleFonts.lobster(
                          fontSize: 35,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Create Your Template With us!!',
                        style: GoogleFonts.lobster(
                          fontSize: 15,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}