import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/Pages/Teacher/TeacherPanel.dart';

class Scoring extends StatefulWidget{


  @override
  ScorePage createState() => ScorePage();

}

class ScorePage extends State<Scoring>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      ////////////////////////////// APP BAR //////////////////////////////

      appBar: AppBar(
        backgroundColor: shrineBlue900,
        title: Text("Quiz Project", style: TextStyle(color: Colors.white),),
      ),

      ////////////////////////////// BODY //////////////////////////////

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // Titles
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Database Exam', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                    SizedBox(width: 10,),
                    Text('1400-10-28 10:00', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                    SizedBox(width: 10,),
                    Text('1400-10-28 10:10', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),)
                  ],
                ),

                // Divider
                SizedBox(height: 10,),
                Divider(
                  color: Colors.red,
                  thickness: 3,
                ),

                // Question 1 with Answer
                SizedBox(height: 10,),
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: Color(0xFFDBA1A1),
                    elevation: 5,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text("QUESTION : What is ER?", style: TextStyle(color: Colors.black, fontSize: 20),),
                          SizedBox(height: 25,),
                          Text("ANSWER : Entity–relationship", style: TextStyle(color: Colors.red, fontSize: 18),),
                          SizedBox(height: 25,),
                          Text("SCORE : 2", style: TextStyle(color: Colors.red, fontSize: 18),),
                        ],
                      ),
                    ),
                  ),
                ),

                // Divider
                Divider(
                  color: Colors.black,
                ),

                // Question 2 with Answer
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: Color(0xFFB2DBA1),
                    elevation: 5,
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text("QUESTION : What is 2 x 2?", style: TextStyle(color: Colors.black, fontSize: 20),),
                          SizedBox(height: 25,),
                          Text("ANSWER : 4", style: TextStyle(color: Colors.green, fontSize: 18),),
                          SizedBox(height: 25,),
                          Text("SCORE : +1", style: TextStyle(color: Colors.green, fontSize: 18),),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20,),

                Container(
                  child: Center(
                    child: Text(
                      'Score : 1\n\nTotal : 3',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20,),

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