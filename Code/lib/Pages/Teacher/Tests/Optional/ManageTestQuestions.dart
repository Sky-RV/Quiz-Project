import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quiz/Pages/Teacher/Tests/Descriptive/NewQuestion_MultiText.dart';
import 'package:quiz/Pages/Teacher/Tests/Optional/NewQuestion_Optional.dart';

class ManageTestQuestions extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final double _w = MediaQuery.of(context).size.width;

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
              MaterialPageRoute(builder: (context) => NewQuestionPage_Optional())
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
          itemCount: 5,
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
                        title: Text("Questions", style: TextStyle(color: Colors.black),),
                        subtitle: Text("Answers\n5", style: TextStyle(color: Colors.black),),
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