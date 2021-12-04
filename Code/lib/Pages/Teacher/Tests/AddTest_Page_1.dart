import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/Pages/Teacher/ChangePasswordPage.dart';
import 'package:quiz/Pages/Teacher/TeacherProfile.dart';
import '../../../main.dart';
import '../TeacherPanel.dart';

void main() {
  runApp(TestPage_1());
}

class TestPage_1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildShrineTheme(),
      title: 'Quiz Project',
      home: TestPage(),
    );
  }
}

class TestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestPage_1();
}

class _TestPage_1 extends State<TestPage>{

  // CARD 1
  String C1_title = 'Base Information', C1_subtitle = 'Question Type';
  String C1_question1 = 'Pdf', C1_question2 = 'Zip picture Questions';
  int C1_value = -1;

  // CARD 2
  String C2_title = 'Test Settings';
  String C2_Op1 = 'Tests have negative score', C2_Op2 = 'The test shows just for this grade student', C2_Op3 = 'Acceccable for not present student',
          C2_Op4 = "Edit answers from before and results", C2_Op5 = 'Student can see questions and answer after the test done';
  List<bool> C2_list = [false, false, false, false, false];

  // CARD 3
  String C3_title = 'Holding Settings';
  String C3_subtitle = 'Question Type';
  String C3_Op1 = 'Held in the scheduled date and time', C3_Op2 = 'Holding floating',
          C3_Op3 = 'Show question by question and set a time for questions',
          C3_Op4 = 'Show question by question and set a total time for the test';
  int C3_value = -1;

  // CARD 4
  String C4_title = 'Workbook Settings', C4_subtitle = 'Holding Test Type';
  String C4_Op1 = 'Held on the scheduled date and time';
  int C4_value = -1;

  String UsernameTXT = 'teacher', PasswordTXT = 'teacher';

  @override
  Widget build(BuildContext context) {
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

      ////////////////////////////// DRAWER //////////////////////////////

      drawer: Drawer(
        child: ListView(
          children: <Widget>[

            UserAccountsDrawerHeader(
              accountName: Text(UsernameTXT, style: TextStyle(fontSize: 20),),
              accountEmail: Text(PasswordTXT, style: TextStyle(fontSize: 14),),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(UsernameTXT[0], style: TextStyle(fontSize: 30),),
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
                    MaterialPageRoute(builder: (context) => TeacherPanel(
                      USERNAME: UsernameTXT,
                      PASSWORD: PasswordTXT,
                    )),
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
                      MaterialPageRoute(builder: (context) => TeacherProfilePage(UsernameTXT: UsernameTXT, PasswordTXT: PasswordTXT)));
                },
                child: Text("پروفایل", style: TextStyle(color: Colors.black),),
              ),
              leading: Icon(Icons.account_circle),
            ),

            SizedBox(height: 10,),
            ListTile(
              title: TextButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChangePasswordPage(UsernameTXT: UsernameTXT, PasswordTXT: PasswordTXT))
                  );
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

                    Icon(Icons.class_, color: shrineBlue600,), // replace with specific icon (number 1)
                    Text('Define new test', style: TextStyle(fontSize: 16, color: Colors.black),)

                  ],
                ),

                SizedBox(height: 30,), // card 1
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 5,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,

                  child: Column(
                    children: [

                      Padding( // title
                        padding: EdgeInsets.all(16),
                        child: Text(C1_title,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            SimpleInput(label: 'Test title'),
                            SizedBox(height: 15,),

                            trailingIconInput(label: 'Course Name', icon: Icon(Icons.arrow_downward),),
                            SizedBox(height: 15,),
                          ],
                        ),
                      ),

                      Text(C1_subtitle,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                      SizedBox(height: 10,),

                      ListTile(
                        title: Text(C1_question1,
                            style: TextStyle(color: Colors.black, fontSize: 14),),
                        leading: Radio(
                          value: 1,
                          groupValue: C1_value,
                          activeColor: shrineBlue600,
                          onChanged: (value){
                            setState(() {
                              C1_value = int.parse(value.toString());
                            });
                          },
                        ),
                      ),

                      ListTile(
                        title: Text(C1_question2,
                          style: TextStyle(color: Colors.black, fontSize: 14),),
                        leading: Radio(
                          value: 2,
                          groupValue: C1_value,
                          activeColor: shrineBlue600,
                          onChanged: (value){
                            setState(() {
                              C1_value = int.parse(value.toString());
                            });
                          },
                        ),
                      ),

                      SizedBox(height: 15,)

                    ],
                  ),
                ),

                SizedBox(height: 15,), // card 2
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 5,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,

                  child: Column(
                    children: [

                      Padding( // title
                        padding: EdgeInsets.all(16),
                        child: Text(C2_title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),),
                      ),

                      SizedBox(height: 10,),
                      ListTile( // check list 1/5
                        title: Text(C2_Op1,
                        style: TextStyle(color: Colors.black, fontSize: 14),),
                        leading: Checkbox(
                          activeColor: shrineBlue600,
                          value: C2_list[0],
                          onChanged: (value){
                            setState(() {
                              C2_list[0] = value!;
                            });
                          },
                        ),
                      ),
                      ListTile( // check list 2/5
                        title: Text(C2_Op2,
                        style: TextStyle(color: Colors.black, fontSize: 14),),
                        leading: Checkbox(
                          activeColor: shrineBlue600,
                          value: C2_list[1],
                          onChanged: (value){
                            setState(() {
                              C2_list[1] = value!;
                            });
                          },
                        ),
                      ),
                      ListTile( // check list 3/5
                        title: Text(C2_Op3,
                          style: TextStyle(color: Colors.black, fontSize: 14),),
                          leading: Checkbox(
                            activeColor: shrineBlue600,
                            value: C2_list[2],
                            onChanged: (value){
                              setState(() {
                                C2_list[2] = value!;
                              });
                            },
                          ),
                      ),
                      ListTile( // check list 4/5
                        title: Text(C2_Op4,
                          style: TextStyle(color: Colors.black, fontSize: 14),),
                        leading: Checkbox(
                          activeColor: shrineBlue600,
                          value: C2_list[3],
                          onChanged: (value){
                            setState(() {
                              C2_list[3] = value!;
                            });
                          },
                        ),
                      ),
                      ListTile( // check list 5/5
                        title: Text(C2_Op5,
                          style: TextStyle(color: Colors.black, fontSize: 14),),
                        leading: Checkbox(
                          activeColor: shrineBlue600,
                          value: C2_list[4],
                          onChanged: (value){
                            setState(() {
                              C2_list[4] = value!;
                            });
                          },
                        ),
                      ),

                      SizedBox(height: 15,)
                    ],
                  ),
                ),

                SizedBox(height: 15,), // card 3
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 5,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,

                  child: Column(
                    children: [

                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(C3_title,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            preIconInput(label: 'Start Date and Time', icon: Icon(Icons.calendar_today_rounded)),
                            SizedBox(height: 15,),
                            preIconInput(label: 'End Date and Time', icon: Icon(Icons.calendar_today_rounded)),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(C3_subtitle,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),

                      SizedBox(height: 10,),
                      ListTile( // radio 1/4
                        title: Text(C3_Op1,
                        style: TextStyle(color: Colors.black, fontSize: 14),),
                        leading: Radio(
                          value: 1,
                          groupValue: C3_value,
                          activeColor: shrineBlue600,
                          onChanged: (value){
                            setState(() {
                              C3_value = int.parse(value.toString());
                            });
                          },
                        ),
                      ),
                      ListTile( // radio 2/4
                        title: Text(C3_Op2,
                          style: TextStyle(color: Colors.black, fontSize: 14),),
                        leading: Radio(
                          value: 2,
                          groupValue: C3_value,
                          activeColor: shrineBlue600,
                          onChanged: (value){
                            setState(() {
                              C3_value = int.parse(value.toString());
                            });
                          },
                        ),
                      ),
                      ListTile( // radio 3/4
                        title: Text(C3_Op3,
                          style: TextStyle(color: Colors.black, fontSize: 14),),
                        leading: Radio(
                          value: 3,
                          groupValue: C3_value,
                          activeColor: shrineBlue600,
                          onChanged: (value){
                            setState(() {
                              C3_value = int.parse(value.toString());
                            });
                          },
                        ),
                      ),
                      ListTile( // radio 4/4
                        title: Text(C3_Op4,
                          style: TextStyle(color: Colors.black, fontSize: 14),),
                        leading: Radio(
                          value: 4,
                          groupValue: C3_value,
                          activeColor: shrineBlue600,
                          onChanged: (value){
                            setState(() {
                              C3_value = int.parse(value.toString());
                            });
                          },
                        ),
                      ),

                      SizedBox(height: 15,)

                    ],
                  ),
                ),

                SizedBox(height: 15,), // card 4
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 5,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,

                  child: Column(
                    children: [

                      Padding( // title
                        padding: EdgeInsets.all(16),
                        child: Text(C4_title,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),

                      SizedBox(height: 10,),
                      Padding( // title
                        padding: EdgeInsets.all(16),
                        child: Text(C4_subtitle,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),

                      SizedBox(height: 5,),
                      ListTile(
                        title: Text(C4_Op1,
                          style: TextStyle(color: Colors.black, fontSize: 14),),
                        leading: Radio(
                          value: 1,
                          groupValue: C4_value,
                          activeColor: shrineBlue600,
                          onChanged: (value){
                            setState(() {
                              C4_value = int.parse(value.toString());
                            });
                          },
                        ),
                      ),

                      ListTile(
                        title: Text(C4_Op1,
                          style: TextStyle(color: Colors.black, fontSize: 14),),
                        leading: Radio(
                          value: 2,
                          groupValue: C4_value,
                          activeColor: shrineBlue600,
                          onChanged: (value){
                            setState(() {
                              C4_value = int.parse(value.toString());
                            });
                          },
                        ),
                      ),

                      SizedBox(height: 10,),
                      Padding( // title
                        padding: EdgeInsets.all(16),
                        child: Text(C4_subtitle,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),

                      SizedBox(height: 5,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [

                            preIconInput(label: 'Start Date and Time', icon: Icon(Icons.calendar_today_rounded)),

                          ],
                        ),
                      ),

                      SizedBox(height: 15,)

                    ],
                  ),
                ),

                // Buttons
                SizedBox(height: 35,),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     // myButton(label: 'Cancel', color: shrinePink300, act: actCancel()),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TeacherPanel(USERNAME: UsernameTXT, PASSWORD: PasswordTXT))
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
                            MaterialPageRoute(builder: (context) => TeacherPanel(USERNAME: UsernameTXT, PASSWORD: PasswordTXT))
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
                            child: Text('Save', style:
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

// Widget myButton({label, color, act}){
//   return ElevatedButton(
//     onPressed: act,
//     style: ElevatedButton.styleFrom(
//       padding: EdgeInsets.zero,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//     ),
//     child: Ink(
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(15)
//       ),
//       child: Container(
//         width: 180,
//         height: 35,
//         alignment: Alignment.center,
//         child: Text(label, style:
//           TextStyle(fontSize: 16, color: Colors.white),),
//       ),
//     ),
//   );
// }

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