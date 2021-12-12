import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quiz/Pages/Teacher/TeacherProfile.dart';
import 'package:quiz/Pages/Teacher/Tests/AddTest_Page_2.dart';
import 'package:quiz/Pages/Teacher/Tests/Add_NewFile_A.dart';
import '../../../main.dart';
import '../TeacherPanel.dart';

class AddNewFile_Q extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildShrineTheme(),
      title: 'Quiz Project',
      home: LogIn_Page(),
    );
  }
}

class LogIn_Page extends StatefulWidget {
  @override
  State<LogIn_Page> createState() => _LogIn_PageState();
}

class _LogIn_PageState extends State<LogIn_Page> {

  String? selectedValue = null;
  final _dropdownFormKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Questions"),value: "Questions"),
      DropdownMenuItem(child: Text("Answers"),value: "Answers"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      ////////////////////////////// APP BAR //////////////////////////////
      //
      // appBar: AppBar(
      //   backgroundColor: shrineBlue900,
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.search),
      //     ),
      //   ],
      //   title: Center(
      //     child: Text(
      //       "Add New File",
      //       style: TextStyle(color: Colors.white),
      //       textAlign: TextAlign.center,
      //     ),
      //   ),
      // ),

      ////////////////////////////// BODY //////////////////////////////

      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: 10,),
                Text("Record / Edit Test File Question", style: TextStyle(fontSize: 26,
                fontWeight: FontWeight.bold, color: shrineBlue600),),
                SizedBox(height: 50,)
              ],
            ),

            // Inputs
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                children: [

                  // file title
                  TextFormField(
                  //controller: ,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'File Title',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Color(0xFF3E5196)),
                    ),
                  ),

                  SizedBox(height: 30,),

                  // file type
                  DropdownButtonFormField(
                      value: selectedValue,
                      style: TextStyle(color: Colors.black),
                      onChanged: (String? newValue){
                        setState(() {
                          selectedValue = newValue!;
                        });
                      },
                      items: dropdownItems
                  ),

                  SizedBox(height: 30,),

                  // show time (minute)
                  TextFormField(
                    //controller: ,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.timer),
                      labelText: 'Show Time (Minute)',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Color(0xFF3E5196)),
                    ),
                  ),

                  // description
                  TextFormField(
                    //controller: ,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Color(0xFF3E5196)),
                    ),
                  ),

                  // upload file

                  SizedBox(height: 15,),

                  // Buttons
                  SizedBox(height: 35,),
                  Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // myButton(label: 'Cancel', color: shrinePink300, act: actCancel()),
                        ElevatedButton(
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => TeacherPanel(USERNAME: UsernameTXT, PASSWORD: PasswordTXT))
                            // );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                                color: shrinePink300,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Container(
                              width: 180,
                              height: 35,
                              alignment: Alignment.center,
                              child: Text('Cancel', style:
                              TextStyle(fontSize: 16, color: Colors.white),),
                            ),
                          ),
                        ),
                        SizedBox(width: 90,),
                        //  myButton(label: 'Save', color: shrinePink400, act: actCancel()),
                        ElevatedButton(
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddNewFile_A())
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                                color: shrinePink400,
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Container(
                              width: 180,
                              height: 35,
                              alignment: Alignment.center,
                              child: Text('Next', style:
                              TextStyle(fontSize: 16, color: Colors.white),),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),

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