import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quiz/Pages/Teacher/TeacherProfile.dart';
import 'package:quiz/Pages/Teacher/Tests/Edit_addNewFile.dart';
import '../../../main.dart';
import '../TeacherPanel.dart';
import 'package:quiz/Pages/Teacher/Tests/Add_NewFile.dart';

import 'ManageQuestions.dart';

class AddTest_Page_2 extends StatelessWidget{

  // CARD 1
  String title_1 = "Upload files";
  String subtitle_1 = "Some definetion";

  String UsernameTXT = 'teacher', PasswordTXT = 'teacher';

  @override
  Widget build(BuildContext context) {

    final double _w = MediaQuery.of(context).size.width;

    return Scaffold(

      ////////////////////////////// APP BAR //////////////////////////////

      appBar: AppBar(
        backgroundColor: shrineBlue900,
        actions: [
          TextButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNewFile())
              );
            },
            child: Text("New File", style: TextStyle(color: Colors.white),),
          )
        ],
        title: Center(
          child: Text(
            title_1,
            style: TextStyle(color: Color(0xFFD4CCCA)),
            textAlign: TextAlign.center,
          ),
        ),
      ),

      ////////////////////////////// BODY //////////////////////////////

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Stack(
        fit: StackFit.expand,
        children: [
          // Back
          Positioned(
            left: 30,
            bottom: 10,
            child: FloatingActionButton(
              backgroundColor: shrinePink300,
              heroTag: 'Back',
              onPressed: (){

              },
              child: Icon(Icons.arrow_back, size: 30,),
            ),
          ),
          // Next
          Positioned(
            right: 30,
            bottom: 10,
            child: FloatingActionButton(
              backgroundColor: shrinePink400,
              heroTag: 'Next',
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ManageQuestions())
                );
              },
              child: Icon(Icons.arrow_forward_rounded, size: 40,)
            ),
          )
        ],
      ),

      body: AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(_w / 30),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemCount: 5,
          itemBuilder: (BuildContext context, int index){
            return AnimationConfiguration.staggeredList(

              position: index,
              delay: Duration(milliseconds: 100),

              child: SlideAnimation(
                duration: Duration(milliseconds: 2500),
                curve: Curves.fastLinearToSlowEaseIn,

                child: FadeInAnimation(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: Duration(milliseconds: 2500),

                  child: Container(
                    margin: EdgeInsets.only(bottom: 10),

                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EditNewFile_Page(FileTitle: "FileTitle", FileType: "FileType", FileTime: "FileTime", FileDescription: "FileDescription", File: "File"))
                          );
                        },
                          title: Text("Math Questions", style: TextStyle(color: Colors.black),),
                          isThreeLine: true,
                          subtitle: Text(
                            "Question\n"
                                "60 Minutes\n"
                                "Access time",
                            style: TextStyle(color: Colors.black54),
                          ),
                          trailing: PopupMenuButton(
                            icon: Icon(Icons.menu),
                            itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                              PopupMenuItem(
                                child: ListTile(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => EditNewFile_Page(FileTitle: "FileTitle", FileType: "Question", FileTime: "FileTime", FileDescription: "FileDescription", File: "File"))
                                    );
                                  },
                                  leading: Icon(Icons.edit),
                                  title: Text("Edit", style: TextStyle(color: Colors.black),),
                                ),
                              ),

                              PopupMenuItem(
                                child: ListTile(
                                  leading: Icon(Icons.delete, color: Colors.red,),
                                  title: Text("Delete", style: TextStyle(color: Colors.red),),
                                ),
                              )
                            ],

                          )
                      ),
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),

      // body: SafeArea(
      //   child: SingleChildScrollView(
      //     child: Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 15),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //
      //           SizedBox(height: 30,),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //
      //               Icon(Icons.class_, color: shrineBlue600,), // replace with specific icon (number 1)
      //               Text('Define new test', style: TextStyle(fontSize: 16, color: Colors.black),)
      //
      //             ],
      //           ),
      //
      //           SizedBox(height: 30,), // card 1
      //
      //
      //           // Buttons
      //           SizedBox(height: 35,),
      //           Card(
      //             shape: RoundedRectangleBorder(
      //                 borderRadius: BorderRadius.circular(10)
      //             ),
      //             semanticContainer: true,
      //             clipBehavior: Clip.antiAliasWithSaveLayer,
      //
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 // myButton(label: 'Cancel', color: shrinePink300, act: actCancel()),
      //                 ElevatedButton(
      //                   onPressed: (){
      //                     // Navigator.push(
      //                     //     context,
      //                     //     MaterialPageRoute(builder: (context) => TeacherPanel(USERNAME: UsernameTXT, PASSWORD: PasswordTXT))
      //                     // );
      //                   },
      //                   style: ElevatedButton.styleFrom(
      //                     padding: EdgeInsets.zero,
      //                     shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(15),
      //                     ),
      //                   ),
      //                   child: Ink(
      //                     decoration: BoxDecoration(
      //                         color: shrinePink300,
      //                         borderRadius: BorderRadius.circular(15)
      //                     ),
      //                     child: Container(
      //                       width: 180,
      //                       height: 35,
      //                       alignment: Alignment.center,
      //                       child: Text('Cancel', style:
      //                       TextStyle(fontSize: 16, color: Colors.white),),
      //                     ),
      //                   ),
      //                 ),
      //                 SizedBox(width: 90,),
      //                 //  myButton(label: 'Save', color: shrinePink400, act: actCancel()),
      //                 ElevatedButton(
      //                   onPressed: (){
      //                     // Navigator.push(
      //                     //     context,
      //                     //     MaterialPageRoute(builder: (context) => TeacherPanel(USERNAME: UsernameTXT, PASSWORD: PasswordTXT))
      //                     // );
      //                   },
      //                   style: ElevatedButton.styleFrom(
      //                     padding: EdgeInsets.zero,
      //                     shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(15),
      //                     ),
      //                   ),
      //                   child: Ink(
      //                     decoration: BoxDecoration(
      //                         color: shrinePink400,
      //                         borderRadius: BorderRadius.circular(15)
      //                     ),
      //                     child: Container(
      //                       width: 180,
      //                       height: 35,
      //                       alignment: Alignment.center,
      //                       child: Text('Save', style:
      //                       TextStyle(fontSize: 16, color: Colors.white),),
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //
      //           SizedBox(height: 10,),
      //
      //         ],
      //       ),
      //     ),
      //   ),
      // ),

    );
  }

}

Widget SimpleInput({label, cnt}) {
  return TextFormField(
    controller: cnt,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      labelStyle: TextStyle(color: shrineBlue600),
    ),
  );
}

Widget preIconInput({label, cnt, icon}) {
  return TextFormField(
    controller: cnt,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: shrineBlue600),
        prefixIcon: icon
    ),
  );
}

Widget trailingIconInput({label, cnt, icon}) {
  return TextFormField(
    controller: cnt,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: shrineBlue600),
        suffixIcon: icon
    ),
  );
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    // colorScheme: _shrineColorScheme,
    textTheme: _buildShrineTextTheme(base.textTheme),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
    caption: base.caption!.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: defaultLetterSpacing,
    ),
    button: base.button!.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: defaultLetterSpacing,
    ),
  )
      .apply(
    fontFamily: 'Rubik',
    displayColor: Color(0xFF363671),
    bodyColor: shrineBackgroundWhite,
  );
}

const Color shrinePink300 = Color(0xFFEB927B);
const Color shrinePink400 = Color(0xFFEE537C);

const Color shrineBlue900 = Color(0xFF363671);
const Color shrineBlue600 = Color(0xFF3E5196);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;