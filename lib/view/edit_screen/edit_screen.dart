import 'dart:ui' as ui;

import 'package:festival_fest_app/uitels/listoffest.dart';
import "package:flutter_hsvcolor_picker/flutter_hsvcolor_picker.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../uitels/colorlist.dart';
import '../../uitels/font.dart';
import '../../uitels/variable_for_globle.dart';
import 'compnets/all_container.dart';

class Edit_screen extends StatefulWidget {
  const Edit_screen({super.key});

  @override
  State<Edit_screen> createState() => _Edit_screenState();
}
GlobalKey imgkey = GlobalKey();
class _Edit_screenState extends State<Edit_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff1c2438),
        centerTitle: true,
        title: Text(
          'Edit',
          style: GoogleFonts.meeraInimai(
            color: Colors.white,
            letterSpacing: 1,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,

        unselectedLabelStyle: TextStyle(color: Colors.white),
        items: [
          BottomNavigationBarItem(
            icon: InkWell(
                onTap: () {
                  setState(() {
                    edit_screenindex = 0;
                  });
                },
                child: Icon(Icons.draw)),
            label: 'Canvas',backgroundColor: Color(0xff1c2438),),
          BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () {
                    setState(() {
                      edit_screenindex = 1;
                    });
                  },
                  child: Icon(Icons.text_fields)),
              label: 'Text'),
          // BottomNavigationBarItem(
          //     icon: InkWell(
          //         onTap: () async{
          //
          //           RenderRepaintBoundary? boundray = imgkey.currentContext!.findRenderObject() as RenderRepaintBoundary;
          //           ui.Image image = await boundray.toImage();
          //           ByteData? bytedata = await image.toByteData(format: ui.ImageByteFormat.png);
          //           imgdata = bytedata!.buffer.asUint8List();
          //           ImageGallerySaver.saveImage(imgdata!,name: 'poster',quality: 100);
          //         },
          //         child: Icon(Icons.share)),
          //     label: 'Share'),
          // BottomNavigationBarItem(
          //     icon: InkWell(
          //         onTap: () async{
          //           final directory =await getApplicationDocumentsDirectory();
          //           File fileImage = await File('${directory.path}/img.png').create();
          //           fileImage.writeAsBytesSync(imgdata!);
          //           await ShareExtend.share(fileImage.path, 'festival');
          //         },
          //         child: Icon(Icons.save_alt)),
          //     label: 'Save'),
        ],
      ),
      body: Column(
          children: [
            Expanded(child: SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                  child:  RepaintBoundary(
                    key: imgkey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                              boxShadow: [
                                const BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 0.5,
                                  spreadRadius: 1,
                                )
                              ],
                              color: (!isImageandColor && backgroundcolorindex == 0)
                                  ? color
                                  : null,
                              gradient:
                              (!isImageandColor && backgroundcolorindex > 0)
                                  ? LinearGradient(
                                colors: colorgrid[backgroundcolorindex],
                              )
                                  : null,
                            ),
                            child: Stack(
                              children: [
                                Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    child: (isImageandColor)
                                        ? Image.asset(
                                      festlist[Index]['images']
                                      [backgroungindex],
                                      fit: BoxFit.cover,
                                    )
                                        : null),
                                Positioned(
                                    top: top,
                                    bottom: bottem,
                                    left: left,
                                    right: right,
                                    child: Container(
                                        height: 300,
                                        width: 300,
                                        child: Text(
                                          txtname.text,
                                          style: TextStyle(
                                              fontSize: fontofsize,
                                              color: Colorlist[textcolorindex]),
                                        )))
                              ],
                            ))
                      ],
                    ),
                  ),
              ),
            ),
            ),
            IndexedStack(
              index: edit_screenindex,
              children: [
                Post(), //0
                font(), //1
                Container(
                  height: 100,
                  color: Colors.green,
                ), //2
                Container(
                  height: 100,
                  color: Colors.blue,
                ), //3
                background(), //4
                //backgroundcolors(), //5
                Container(), //6
                //alignment(), //7
                Container(
                  height: 220,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color(0xff1c2438),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Edit Your Text',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  TextEditingControllerlist.add(txtname.text);
                                  edit_screenindex = 1;
                                });
                              },
                              child: const Icon(
                                Icons.done,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextField(
                        style: TextStyle(color: Colors.white),
                        controller: txtname,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            )),
                      )
                    ],
                  ),
                ), //8
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    color: Color(0xff1c2438),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Edit Your Text color',
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  edit_screenindex = 1;
                                });
                              },
                              child: const Icon(
                                Icons.done,
                                color: Colors.white,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GridView.builder(
                        itemCount: Colorlist.length,
                        physics: PageScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5),
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {
                            setState(() {
                              textcolorindex = index;
                              (index == 0)
                                  ? showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Pick your color'),
                                    content: Container(
                                      height: 500,
                                      width: 300,
                                      child: ColorPicker(
                                        color: color,
                                        onChanged: (value) {
                                          setState(() {
                                            color = value;
                                            backgroundcolorindex = index;
                                            isImageandColor = false;
                                          });
                                        },
                                        initialPicker: Picker.paletteHue,
                                      ),
                                    ),
                                    actions: [
                                      InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("save"))
                                    ],
                                  ))
                                  : null;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colorgrid[index]),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ) //9
              ],
            ),
          ],
      ),
    );
  }
  Container Post()      // 0
  {
    return Container(
      height: 220,
      decoration: const BoxDecoration(
        color: Color(0xff1c2438),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Change Background Image And Color',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    edit_screenindex = 4;
                  });
                },
                child: backgorund_poster_container(),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    edit_screenindex = 5;
                  });
                },
                child: bg_colorcontainer(),
              ),
            ],
          )
        ],
      ),
    );
  }



  Container font() {    //1
    return Container(
      height: 220,
      decoration: const BoxDecoration(
        color: Color(0xff1c2438),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Edit Your Text Here!!',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    edit_screenindex = 8;
                  });
                },
                child: add_text_container(),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    edit_screenindex = 7;
                  });
                },
                child: alignment_container(),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {

                  });
                },
                child: font_family_container(),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    edit_screenindex = 9;
                  });
                },
                child: font_color_container(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container background() {      //4
    return Container(
      height: 220,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color(0xff1c2438),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Choose Background',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      edit_screenindex = 0;
                    });
                  },
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
                  ))
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                festlist[Index]['images'].length,
                    (index) => InkWell(
                  onTap: () {
                    setState(() {
                      isImageandColor = true;
                      backgroungindex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0),
                    child: Container(
                        height: 100,
                        width: 100,
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
                          festlist[Index]['images'][index],
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }









}
