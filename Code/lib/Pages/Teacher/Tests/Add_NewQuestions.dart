import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quiz/Pages/Teacher/TeacherProfile.dart';
import 'package:quiz/Pages/Teacher/Tests/AddTest_Page_2.dart';
import 'package:quiz/Pages/Teacher/Tests/Add_NewFile.dart';
import '../../../main.dart';
import '../TeacherPanel.dart';

class Add_NewQuestions extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      ////////////////////////////// APP BAR //////////////////////////////

      appBar: AppBar(
        backgroundColor: shrineBlue900,
        actions: [
          TextButton(
            onPressed: (){},
            child: Text("Finish", style: TextStyle(color: Color(0xFFD4CCCA))),
          ),
        ],
        title: Center(
          child: Text(
            "Quiz Project",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),

      ////////////////////////////// BODY //////////////////////////////

      // Soal
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[

              Container(

                height: MediaQuery.of(context).size.height,
                width: double.infinity,

                child: Column(
                  children: [

                    SizedBox(height: 10,),
                    Text("سوال 1", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: shrineBlue600),),

                    SizedBox(height: 15,),

                    // Inputs
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: Column(
                        children: [

                          // Upload question's picture

                          // question text
                          TextFormField(
                            //controller: ,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'متن سوال',
                              labelStyle: TextStyle(color: shrineBlue900)
                            ),
                          ),

                          SizedBox(height: 10,),

                          // options
                          Text("گزینه ها", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: shrineBlue600),),

                          SizedBox(height: 10,),

                          //
                          InputChip(
                            avatar: Icon(Icons.add),
                            label: Text('Add'),
                            onSelected: (bool value) {},
                          ),

                          SizedBox(height: 5,),

                          InputChip(
                            avatar: Icon(Icons.remove),
                            label: Text('Remove'),
                            onSelected: (bool value) {},
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              )

            ],
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