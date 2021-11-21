import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class StudentList extends StatelessWidget {

  String LessonName, LessonID;
  StudentList({Key? key,
    required this.LessonName,
    required this.LessonID}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     theme: _buildShrineTheme(),
  //     title: 'Quiz Project',
  //     home: UniversityPanelPage(),
  //   );
  //}
// }
//
// class _UniversityPanelState extends State<UniversityPanelPage> {

  //int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    double _w = MediaQuery.of(context).size.width;

    return DefaultTabController(

      length: 3,

      child: Scaffold(

        ////////////////////////////// APP BAR //////////////////////////////

        appBar: AppBar(

          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.search),
            ),
          ],

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

        ////////////////////////////// BODY //////////////////////////////

        body: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: shrinePink300,
            foregroundColor: Colors.black,
            onPressed: (){},
            child: Icon(Icons.add),
          ),

          body: AnimationLimiter(
            child: ListView.builder(
              padding: EdgeInsets.all(_w / 30),
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()
              ),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index){
                return AnimationConfiguration.staggeredList(

                  position: index,
                  delay: Duration(milliseconds: 100),

                  child: SlideAnimation(

                    duration: Duration(milliseconds: 2500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    verticalOffset: -250,

                    child: ScaleAnimation(

                      duration: Duration(milliseconds: 1500),
                      curve: Curves.fastLinearToSlowEaseIn,

                      // the shape of cards
                      child: Container(

                        margin: EdgeInsets.only(bottom: 15),

                        child: ListTile(
                          title: Text('Student Name', style: TextStyle(color: Colors.black),),
                          leading: Icon(Icons.account_circle_rounded),
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
        )
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