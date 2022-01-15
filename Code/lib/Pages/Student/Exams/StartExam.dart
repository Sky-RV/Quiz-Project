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

  List<String> Q = ['Q1', 'Q2', 'Q3', 'Q4', 'Q5'];
  List<String> A = ["AnswerCNT", 'A2', 'A3', 'A4', 'A5'];
  int i = 0;
  // int j = 0;
  String question = "Q1"; // the first question
  String answer = "answer"; // the first answer

  changeQuestion(){
    setState(() {
      question = Q[i+1];
      AnswerCNT.text = A[i+1];
      i++;
    });
  }

  changeQuestionBack(){
    setState(() {
      question = Q[i-1];
      AnswerCNT.text = A[i-1];
      i--;
    });
  }

  // changeAnswer(){
  //   setState(() {
  //     AnswerCNT.text = A[j+1];
  //     j++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    TimerState.StateTimerStart();

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
                        '$question',
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
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.multiline,
                          controller: AnswerCNT,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 200),
                            labelText: 'Answer',
                            alignLabelWithHint: true,
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Color(0xFF3E5196)),
                          ),
                        ),
                      ),
                  ),
                ),
              ),

              SizedBox(height: 50,),

              // Buttons
              Container(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            setState(() {
                              changeQuestionBack();
                            });
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
                              child: Text('Back', style:
                              TextStyle(fontSize: 16, color: Colors.white),),
                            ),
                          ),
                        ),

                        SizedBox(width: 75,),

                        ElevatedButton(
                          onPressed: (){
                            changeQuestion();
                            //changeAnswer();
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
                              child: Text('Next', style:
                              TextStyle(fontSize: 16, color: Colors.white),),
                            ),
                          ),
                        ),
                      ],
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