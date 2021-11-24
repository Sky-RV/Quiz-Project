import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:fluttertoast/fluttertoast.dart';

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

  TextEditingController NAME = TextEditingController();

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
            onPressed: (){
              displayDialofInput(context);
            },
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

  void showAlertDialog(BuildContext context, String NAME) {
    // Create Button
    Widget ADD = FlatButton(
      child: Text("بله", style: TextStyle(color: shrinePink400),),
      // onPressed: (){
      //   Fluttertoast.showToast(
      //       msg: "دانشجو اضافه شد.",
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER,
      //       fontSize: 16.0
      //   );
      // },
      onPressed: (){
        //Navigator.of(context).pop();
        final scaffold = ScaffoldMessenger.of(context);
        scaffold.showSnackBar(
          SnackBar(
            content: const Text('دانشجو اضافه شد.'),
            action: SnackBarAction(label: 'بازگشت', onPressed: scaffold.hideCurrentSnackBar),
          ),
        );
      },
    );

    Widget CANCEL = FlatButton(
      child: Text("خیر", style: TextStyle(color: shrinePink300),),
      onPressed: (){
        Navigator.pop(context);
      },
    );

    // Create Alert Dialog
    String message = " آیا میخواهید " + NAME + " را اضافه کنید؟ ";
    // NAME must be the name of student

    AlertDialog alert = AlertDialog(
      title: Text('اضافه کردن دانشجو', style: TextStyle(color: Colors.black),),
      content: Text(message,  style: TextStyle(color: Colors.black),),
      actions: [
        ADD,
        CANCEL
      ],
    );

    // Show the Dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  displayDialofInput(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("اضافه کردن دانشجو",  style: TextStyle(color: Colors.black),),
          content: TextField(
            style: TextStyle(color: Colors.black),
            controller: NAME,
            textInputAction: TextInputAction.go,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "شماره دانشجویی",
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: Text("اضافه کردن", style: TextStyle(color: shrinePink400),),
              onPressed: (){
                //Navigator.of(context).pop();
                showAlertDialog(context, NAME.text);
              },
            ),

            new FlatButton(
              child: Text("کنسل", style: TextStyle(color: shrinePink300),),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
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