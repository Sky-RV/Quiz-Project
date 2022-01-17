import 'package:flutter/material.dart';
import 'package:quiz/Pages/Teacher/TeacherProfile.dart';
import 'package:quiz/Pages/Teacher/Tests/Descriptive/AddTest_Page_1.dart';
import 'package:quiz/Pages/Teacher/Tests/Optional/AddTest_Page_1_Optional.dart';

import '../../main.dart';

class TeacherPanel extends StatelessWidget {

  String FullName, ID, UniversityID, Token;
  TeacherPanel({Key? key,
    required this.FullName,
    required this.ID,
    required this.UniversityID,
    required this.Token
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildShrineTheme(),
      title: 'Quiz Project',
      home: Scaffold(
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
              'Quiz Project',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        ////////////////////////////// DRAWER //////////////////////////////

        drawer: Drawer(
          child: ListView(
            children: <Widget>[

              UserAccountsDrawerHeader(
                accountName: Text(FullName, style: TextStyle(fontSize: 20),),
                accountEmail: Text("Teacher Email", style: TextStyle(fontSize: 14),),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(FullName[0], style: TextStyle(fontSize: 30),),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color(0xFF363671),
                  Color(0xFF3E5196),
                  Color(0xFF4E65B8),
                ])),
              ),
              SizedBox(height: 20,),
              ListTile(
                title: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TeacherPanel(FullName: FullName, ID: ID, UniversityID: UniversityID, Token: Token,)),
                    );
                  },
                  child: Text("مدیریت آزمون ها", style: TextStyle(color: Colors.black),),
                ),
                leading: Icon(Icons.article),
              ),
              SizedBox(height: 10,),
              ListTile(
                title: TextButton(
                  onPressed: (){
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TeacherProfilePage(FullName: FullName, ID: ID, UniversityID: UniversityID, Token: Token,)));
                  },
                  child: Text("پروفایل", style: TextStyle(color: Colors.black),),
                ),
                leading: Icon(Icons.account_circle),
              ),

              SizedBox(height: 10,),
              ListTile(
                title: TextButton(
                  onPressed: (){
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => )
                    // );
                  },
                  child: Text("تغییر رمز عبور", style: TextStyle(color: Colors.black),),
                ),
                leading: Icon(Icons.vpn_key),
              ),

              SizedBox(height: 10,),
              ListTile(
                title: TextButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp())
                    );
                  },
                  child: Text("خروج", style: TextStyle(color: Colors.black),),
                ),
                leading: Icon(Icons.exit_to_app),
              ),

            ],
          ),
        ),

        ////////////////////////////// BODY //////////////////////////////

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Stack(
          fit: StackFit.expand,
          children: [

            // Descriptive Exam
            Positioned(
              right: 30,
              bottom: 10,
              child: FloatingActionButton(
                backgroundColor: shrinePink400,
                heroTag: 'Descriptive Exam',
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TestPage_1())
                  );
                },
              ),
            ),

            // Optional Exam
            Positioned(
              right: 30,
              bottom: 40,
              child: FloatingActionButton(
                backgroundColor: shrinePink400,
                heroTag: 'Optional Exam',
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TestPage_1_Optional())
                  );
                },
              ),
            )

          ],
        ),

        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: shrinePink300,
        //   foregroundColor: Colors.black,
        //   onPressed: (){
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => TestPage_1())
        //     );
        //   },
        //   child: Icon(Icons.add),
        // ),

        // in case there is no test list
        body: Center(
          child: IconButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TestPage_1())
              );
            },
            icon: Icon(
              Icons.book,
              color: Colors.black12,
              size: 50,
            ),
          ),
        ),

      ),
    );
  }
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
