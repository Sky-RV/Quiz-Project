import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:quiz/Pages/Student/Exams/CounDownTimerState.dart';

class StartExam extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildShrineTheme(),
      title: 'Quiz Project',
      home: StartExamPage(),
    );
  }
}

class StartExamPage extends StatefulWidget{
  @override
  _StartExamPage createState() => _StartExamPage();
}

class _StartExamPage extends State<StartExamPage>{

  final CountDownTimerState TimerState = Get.put(CountDownTimerState());

  TextEditingController AnswerCNT = TextEditingController();
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      ////////////////////////////// APP BAR //////////////////////////////

      appBar: AppBar(
          backgroundColor: shrineBlue900,
          actions: [
            TextButton(
              onPressed: (){},
              child: Text("Finish", style: TextStyle(color: Color(0xDCFFFFFF), fontSize: 18),),
            )
          ],
          title: Center(
            child: GetBuilder<CountDownTimerState>(
                builder: (_) => Text('${TimerState.SCount}')
            ),
          )
      ),

      ////////////////////////////// BODY //////////////////////////////
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              SizedBox(height: 20,),

              // Questions
              Container(
                height: 200,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,

                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        'Explain the Alpha Testing.',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black
                        ),
                      ),
                    )
                  ),
                ),
              ),
              
              SizedBox(height: 10,),
              
              // Answers
              Container(
                height: 200,
                width: double.infinity,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,

                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          controller: AnswerCNT,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            labelText: 'Answer',
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Color(0xFF3E5196)),
                          ),
                        ),
                      ),
                  ),
                ),
              ),

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