import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quiz/Pages/Teacher/TeacherPanel.dart';
import 'package:quiz/Pages/Teacher/Tests/Descriptive/NewQuestion_MultiText.dart';

class ManageQuestions extends StatefulWidget{

  final String Token;
  const ManageQuestions({
    Key? key,
    required this.Token
}) : super(key: key);

  @override
  ManageQuestionPage createState() => ManageQuestionPage();

}

class ManageQuestionPage extends State<ManageQuestions>{

  String Q1 = "What is ER?", A1 = "Entity–relationship";
  String Q2 = "What is 2 x 2?", A2 = '4';
  String S1 = "2", S2 = "1";

  final List<String> QuestionsList = [];
  final List<String> AnswersList = [];
  final List<String> ScoresList = [];

  @override
  void initState() {
    if(widget.Token == "ManageQuestion"){
      QuestionsList.insert(0, Q1);
      AnswersList.insert(0, A1);
      ScoresList.insert(0, S1);
    }
    if(widget.Token == "Finish"){
      QuestionsList.insert(0, Q1);
      AnswersList.insert(0, A1);
      ScoresList.insert(0, S1);
      QuestionsList.insert(1, Q2);
      AnswersList.insert(1, A2);
      ScoresList.insert(1, S2);
    }
  }

  @override
  Widget build(BuildContext context) {

    final double _w = MediaQuery.of(context).size.width;

    return Scaffold(

      ////////////////////////////// APP BAR //////////////////////////////

      appBar: AppBar(
        backgroundColor: shrineBlue900,
        actions: [
          TextButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TeacherPanel(FullName: "Leo", ID: "1", UniversityID: "1", Token: "ManageFinish"))
              );
            },
            child: Text("Finish", style: TextStyle(color: Color(0xFFD4CCCA))),
          ),
        ],
        title: Center(
          child: Text(
            "Manage Questions",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),

      ////////////////////////////// BODY //////////////////////////////

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewQuestionPage())
          );
        },
        backgroundColor: shrinePink300,
        heroTag: 'Add Question',
        child: Icon(Icons.add),
      ),

      body: AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.all(_w / 30),
          physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemCount: QuestionsList.length,
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
                    margin: EdgeInsets.only(bottom: 10),

                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: ListTile(
                        title: Text("${QuestionsList[index]}", style: TextStyle(color: Colors.black),),
                        subtitle: Text("${AnswersList[index]}\n${ScoresList[index]}", style: TextStyle(color: Colors.black),),
                        trailing: IconButton(
                          onPressed: (){},
                          icon: Icon(Icons.delete, color: Colors.red,),
                        ),
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