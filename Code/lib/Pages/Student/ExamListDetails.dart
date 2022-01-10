import 'package:flutter/material.dart';
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
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child: Column(
              children: [

                // title
                Text('Exam Title:\tMath', style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),),
                SizedBox(height: 5,),

                // type
                Text('Exam Type:\tTyping', style: TextStyle(
                    fontSize: 20,
                    color: Colors.black38
                ),),
                SizedBox(height: 5,),

                // number of questions
                Text('Question Numbers:\t10', style: TextStyle(
                    fontSize: 20,
                    color: Colors.black38
                ),),
                SizedBox(height: 5,),

                // start time
                Text('Start Time:\t1400-10-22   16:00', style: TextStyle(
                    fontSize: 20,
                    color: Colors.black38
                ),),
                SizedBox(height: 5,),

                // end time
                Text('End Time:\t1400-10-22   18:00', style: TextStyle(
                    fontSize: 20,
                    color: Colors.black38
                ),),
                SizedBox(height: 5,),

                SizedBox(height: 35,),
                // start button
                ElevatedButton(
                  onPressed: (){},
                  child: Ink(
                    decoration: BoxDecoration(
                      color: shrinePink400,
                    ),
                    child: Text("Start", style: TextStyle(color: Colors.white),),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    shadowColor: Color(0xFF909090),
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