import 'package:flutter/material.dart';
import 'package:quiz/Pages/University/UniversityPanel.dart';
import 'package:quiz/Pages/University/LessonManagement/StudentList.dart';

class AddLesson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildShrineTheme(),
      title: 'Quiz Project',
      home: AddLesson_Page(),
    );
  }
}

class AddLesson_Page extends StatefulWidget {
  @override
  State<AddLesson_Page> createState() => _AddLesson_State();
}

class _AddLesson_State extends State<AddLesson_Page>{

  @override
  Widget build(BuildContext context) {

    TextEditingController LessonName = TextEditingController();
    TextEditingController LessonTeacher = TextEditingController();
    TextEditingController LessonUnit = TextEditingController();

    return Scaffold(

      ////////////////////////////// APP BAR //////////////////////////////

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: shrineBlue900,
        title: Center(
          child: Text(
            'Quiz Project',
            style: TextStyle(
                color: Colors.white
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),

      /////////////////////////////////// BODY /////////////////////////////

      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[

              Container(

                height: MediaQuery.of(context).size.height,
                width: double.infinity,

                child: Column(
                  children: [

                    // Title
                    Column(
                      children: [
                        SizedBox(height: 35,),
                        Text("اضافه کردن درس", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: shrineBlue600),),
                        SizedBox(height: 25,)
                      ],
                    ),

                    // Inputs
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: Column(
                        children: [

                          SimpleInput(label: "نام درس"),
                          SizedBox(height: 15,),


                          UsernameInput(label: "نام استاد"),
                          SizedBox(height: 15,),

                          NumberInput(label: "واحد درس"),
                          SizedBox(height: 15,),

                        ],
                      ),
                    ),

                    SizedBox(height: 35,),

                    // Save Button
                    Padding(
                      // padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => StudentList(LessonName: "Lesson Name", LessonID: "Lesson ID",))
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFEE537C),
                                Color(0xFFEB927B)
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            width: 180,
                            height: 35,
                            alignment: Alignment.center,
                            child: Text('ذخیره', style: TextStyle(fontSize: 13, color: Colors.white),),
                          ),
                        ),
                      ),
                      // child: MaterialButton(
                      //   minWidth: double.infinity,
                      //   height: 60,
                      //   onPressed: (){},
                      //
                      // )
                    ),

                    SizedBox(height: 15,),

                    // Cancel Button
                    Padding(
                      // padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                        onPressed: (){
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => UniversityPanel(UsernameTXT: UsernameTXT, PasswordTXT: PasswordTXT, UniversityIDTXT: UniversityIDTXT))
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF555455),
                                Color(0xFFA7A7A7),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            width: 180,
                            height: 35,
                            alignment: Alignment.center,
                            child: Text('لغو', style: TextStyle(fontSize: 13, color: Colors.white),),
                          ),
                        ),
                      ),
                      // child: MaterialButton(
                      //   minWidth: double.infinity,
                      //   height: 60,
                      //   onPressed: (){},
                      //
                      // )
                    ),

                  ],
                ),

              ),

            ],
          ),
        ),
      ),

    );

  }

}

Widget SimpleInput({label}){
  return TextFormField(
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      prefixIcon: Icon(Icons.book),
      focusColor: shrinePink400,
      labelText: label,
      border: OutlineInputBorder(),
      labelStyle: TextStyle(color: Color(0xFF3E5196)),
    ),
  );


}Widget NumberInput({label}){
  return TextFormField(
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      focusColor: shrinePink400,
      labelText: label,
      border: OutlineInputBorder(),
      labelStyle: TextStyle(color: Color(0xFF3E5196)),
    ),
  );
}

Widget UsernameInput({label}){
  return TextFormField(
    keyboardType: TextInputType.number,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Color(0xFF3E5196)),
        prefixIcon: Icon(Icons.account_circle)
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