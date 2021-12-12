import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quiz/Pages/Teacher/TeacherProfile.dart';
import '../../../main.dart';
import '../TeacherPanel.dart';
import 'package:quiz/Pages/Teacher/Tests/Add_NewFile_Q.dart';

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
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          ),
        ],
        title: Center(
          child: Text(
            title_1,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),

      ////////////////////////////// BODY //////////////////////////////

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNewFile_Q())
          );
        },
        backgroundColor: shrinePink300,
        child: Icon(Icons.add),
      ),

        body: AnimationLimiter(
          child: ListView.builder(
            padding: EdgeInsets.all(_w / 30),
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemCount: 20,
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
                      margin: EdgeInsets.only(bottom: 15),
                      child: ListTile(
                        title: Text('List item 1', style: TextStyle(color: Colors.black),),
                        isThreeLine: true,
                        subtitle: Text('Secondary text\nTertiary text'),
                        //  leading: Icon(Icons.label),
                        //  trailing: ,
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

// actCancel() {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (context) => TeacherPanel(USERNAME: UsernameTXT, PASSWORD: PasswordTXT))
//   );
// }

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