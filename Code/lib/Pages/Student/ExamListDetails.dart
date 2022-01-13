import 'package:flutter/material.dart';
import 'package:quiz/Pages/Student/Exams/StartExam.dart';
import 'package:quiz/main.dart';

class ExamListDetails extends StatelessWidget {

  String TestID, StudentID, UniversityID;
  ExamListDetails({
    Key? key,
    required this.TestID,
    required this.StudentID,
    required this.UniversityID
}) :super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: _buildShrineTheme(),
      home: Scaffold(

        ////////////////////////////// APP BAR //////////////////////////////
        appBar: AppBar(
          backgroundColor: shrineBlue900,
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
                accountName: Text('Student Name', style: TextStyle(fontSize: 20),),
                accountEmail: Text("Teacher Email", style: TextStyle(fontSize: 14),),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("S", style: TextStyle(fontSize: 30),),
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
                  onPressed: (){},
                  // onPressed: (){
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => TeacherProfilePage(FullName: FullName, ID: ID, UniversityID: UniversityID)));
                  // },
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
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 15),
            child: Column(
              children: [

                // card
                Padding(
                  padding: EdgeInsets.zero,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                    ),
                    elevation: 5,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      // child: Column(
                      //   children: [
                      //     // title
                      //     Text('Exam Title:    Math', style: TextStyle( // 4 spaces
                      //         fontSize: 24,
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.black
                      //     ),),
                      //     SizedBox(height: 15,),
                      //
                      //     // type
                      //     Text('Exam Type:    Typing', style: TextStyle(
                      //         fontSize: 20,
                      //         color: Colors.black54
                      //     ),),
                      //     SizedBox(height: 15,),
                      //
                      //     // number of questions
                      //     Text('Question Numbers:    10', style: TextStyle(
                      //         fontSize: 20,
                      //         color: Colors.black54
                      //     ),),
                      //     SizedBox(height: 15,),
                      //
                      //     // start time
                      //     Text('Start Time:    1400-10-22   16:00', style: TextStyle(
                      //         fontSize: 20,
                      //         color: Colors.black54
                      //     ),),
                      //     SizedBox(height: 15,),
                      //
                      //     // end time
                      //     Text('End Time:    1400-10-22   18:00', style: TextStyle(
                      //         fontSize: 20,
                      //         color: Colors.black54
                      //     ),),
                      //     SizedBox(height: 15,),
                      //   ],
                      // ),
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Table(
                          defaultColumnWidth: FixedColumnWidth(180.0),
                          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                          border: TableBorder.all(
                            color: Colors.black54,
                          ),
                          children: [

                            // title
                            TableRow(
                                children: [
                                  Column(children:[Text('Title', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black))]),
                                  Column(
                                      children:[
                                        Padding(padding: EdgeInsets.symmetric(vertical: 10),
                                        child: Text('Math Exam', style: TextStyle(fontSize: 16, color: Colors.black)),)
                                      ]
                                  ),
                                ]
                            ),

                            // type
                            TableRow( // title
                                children: [
                                  Column(children:[Text('Type', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black))]),
                                  Column(
                                      children:[
                                        Padding(padding: EdgeInsets.symmetric(vertical: 10),
                                          child: Text('Descriptive', style: TextStyle(fontSize: 16, color: Colors.black)),)
                                      ]
                                  ),
                                ]
                            ),

                            // number of question
                            TableRow( // title
                                children: [
                                  Column(children:[Text('Question Number', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black))]),
                                  Column(
                                      children:[
                                        Padding(padding: EdgeInsets.symmetric(vertical: 10),
                                          child: Text('10', style: TextStyle(fontSize: 16, color: Colors.black)),)
                                      ]
                                  ),
                                ]
                            ),

                            // start time
                            TableRow( // title
                                children: [
                                  Column(children:[Text('Start time', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black))]),
                                  Column(
                                      children:[
                                        Padding(padding: EdgeInsets.symmetric(vertical: 10),
                                          child: Text('1400-10-22    16:00', style: TextStyle(fontSize: 16, color: Colors.black)),)
                                      ]
                                  ),
                                ]
                            ),

                            // end time
                            TableRow( // title
                                children: [
                                  Column(children:[Text('End time', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black))]),
                                  Column(
                                      children:[
                                        Padding(padding: EdgeInsets.symmetric(vertical: 10),
                                          child: Text('1400-10-22    18:00', style: TextStyle(fontSize: 16, color: Colors.black)),)
                                      ]
                                  ),
                                ]
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 100,),
               // start button
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StartExam())
                    );
                  },
                  child: Text("Start", style: TextStyle(color: Colors.white, fontSize: 24),),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(65),
                    shape: CircleBorder(),
                    shadowColor: Color(0xFF909090),
                    primary: shrinePink400
                  ),
                ),

              ],
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