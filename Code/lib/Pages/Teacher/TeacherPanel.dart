import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quiz/Pages/Teacher/TeacherProfile.dart';
import 'package:quiz/Pages/Teacher/Tests/Descriptive/AddTest_Page_1.dart';
import 'package:quiz/Pages/Teacher/Tests/Descriptive/DescriptiveDetails.dart';
import 'package:quiz/Pages/Teacher/Tests/Optional/AddTest_Page_1_Optional.dart';

import '../../main.dart';

class TeacherPanel extends StatefulWidget {

  String FullName, ID, UniversityID, Token;
  TeacherPanel({Key? key,
    required this.FullName,
    required this.ID,
    required this.UniversityID,
    required this.Token
  }) : super(key: key);

  @override
  TeacherPanelPage createState() => TeacherPanelPage();

}

class TeacherPanelPage extends State<TeacherPanel> {

  String EName = "Database";
  String ETime = "1400-10-28 10:00 to 1400-10-28 10:10";

  final List<String> ExamNames = [];
  final List<String> ExamTimes = [];

  @override
  void initState() {
    if(widget.Token == "ManageFinish"){
      ExamNames.insert(0, EName);
      ExamTimes.insert(0, ETime);
    }
  }

  @override
  Widget build(BuildContext context) {

    final double _w = MediaQuery.of(context).size.width;

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
                accountName: Text(widget.FullName, style: TextStyle(fontSize: 20),),
                accountEmail: Text("Teacher Email", style: TextStyle(fontSize: 14),),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(widget.FullName[0], style: TextStyle(fontSize: 30),),
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
                      MaterialPageRoute(builder: (context) => TeacherPanel(FullName: widget.FullName, ID: widget.ID, UniversityID: widget.UniversityID, Token: widget.Token,)),
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
                        MaterialPageRoute(builder: (context) => TeacherProfilePage(FullName: widget.FullName, ID: widget.ID, UniversityID: widget.UniversityID, Token: widget.Token,)));
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
              bottom: 80,
              child: FloatingActionButton(
                backgroundColor: shrinePink300,
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
        body: AnimationLimiter(
          child: ListView.builder(
            padding: EdgeInsets.all(_w / 30),
            physics: BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            itemCount: ExamNames.length,
            itemBuilder: (BuildContext context, int index) {
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
                        onTap: (){
                          Navigator.push(context, 
                          MaterialPageRoute(builder: (context) => DescriptiveDetails()));
                        },
                        title: Text('${ExamNames[index]}',
                          style: TextStyle(color: Colors.black),),
                        //isThreeLine: true,
                        subtitle: Text('${ExamTimes[index]}'),
                        //  leading: Icon(Icons.label),
                        //  trailing: ,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(15)),
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
