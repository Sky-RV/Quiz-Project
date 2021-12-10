import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quiz/Pages/Teacher/TeacherProfile.dart';
import '../../../main.dart';
import '../TeacherPanel.dart';
import 'AddTest_Page_1.dart';

void main() {
  runApp(TestPage_2());
}

class TestPage_2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildShrineTheme(),
      title: 'Quiz Project',
      home: TestPage2(),
    );
  }
}

class TestPage2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestPage_2();
}

class _TestPage_2 extends State<TestPage2>{


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
            'Quiz Project',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),

      ////////////////////////////// BODY //////////////////////////////

      floatingActionButton: FloatingActionButton(
        backgroundColor: shrinePink300,
        foregroundColor: Colors.black,
        onPressed: (){
          // add new file
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(builder: (context) => StudentList(LessonName: "Lesson Name", LessonID: "Lesson ID",))
          // );
        },
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Icon(Icons.class_, color: shrineBlue600,), // replace with specific icon (number 2)
                    Text('Upload question', style: TextStyle(fontSize: 16, color: Colors.black),)

                  ],
                ),

                SizedBox(height: 30,), // card 1

                AnimationLimiter(
                  child: ListView.builder(
                    padding: EdgeInsets.all(_w / 30),
                    physics: BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    itemCount: 2,
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

                                title: Text('File title 1', style: TextStyle(color: Colors.black),),
                                isThreeLine: true,
                                subtitle: Text('File type\nShow time\nAccess date'),
                                onTap: (){
                                  // view file
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(builder: (context) => StudentList(LessonName: "Lesson Name", LessonID: "Lesson ID",))
                                  // );
                                },
                                trailing: PopupMenuButton(
                                  icon: Icon(Icons.menu),
                                  itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                                    const PopupMenuItem(
                                      child: ListTile(
                                        leading: Icon(Icons.edit),
                                        title: Text('Edit'),
                                      ),
                                    ),
                                    const PopupMenuItem(
                                      child: ListTile(
                                        leading: Icon(Icons.delete),
                                        title: Text('Delete'),
                                      ),
                                    ),
                                  ],
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

                // Buttons
                SizedBox(height: 35,),
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // myButton(label: 'Cancel', color: shrinePink300, act: actCancel()),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TestPage_1())
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
                              color: shrinePink300,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Container(
                            width: 100,
                            height: 35,
                            alignment: Alignment.center,
                            child: Text('Back', style:
                            TextStyle(fontSize: 16, color: Colors.white),),
                          ),
                        ),
                      ),
                      SizedBox(width: 30,),
                      ElevatedButton(
                        onPressed: (){
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => TeacherPanel(USERNAME: UsernameTXT, PASSWORD: PasswordTXT))
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
                              color: Colors.yellowAccent,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Container(
                            width: 100,
                            height: 35,
                            alignment: Alignment.center,
                            child: Text('Cancel', style:
                            TextStyle(fontSize: 16, color: Colors.white),),
                          ),
                        ),
                      ),
                      SizedBox(width: 30,),
                      //  myButton(label: 'Save', color: shrinePink400, act: actCancel()),
                      ElevatedButton(
                        onPressed: (){
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => TeacherPanel(USERNAME: UsernameTXT, PASSWORD: PasswordTXT))
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
                              color: shrinePink400,
                              borderRadius: BorderRadius.circular(15)
                          ),
                          child: Container(
                            width: 100,
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

                SizedBox(height: 10,),

              ],
            ),
          ),
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