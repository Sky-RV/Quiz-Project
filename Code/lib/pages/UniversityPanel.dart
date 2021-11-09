import 'package:flutter/material.dart';
import 'package:quiz/pages/SignInPage.dart';
import 'package:quiz/pages/LogInPage.dart';

void main() {
  runApp(UniversityPanel());
}

class UniversityPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildShrineTheme(),
      title: 'Quiz Project',
      home: UniversityPanelPage(),
    );
  }
}

class UniversityPanelPage extends StatefulWidget {
  @override
  State<UniversityPanelPage> createState() => _UniversityPanelState();
}

class _UniversityPanelState extends State<UniversityPanelPage> {

  int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(

      ////////////////////////////// APP BAR //////////////////////////////

        appBar: AppBar(
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

        ////////////////////////////// DRAWER //////////////////////////////

        drawer: Drawer(
          child: Container(

            color: shrineBlue600,

            child: ListView(
              children: <Widget>[

                SizedBox(height: 20,),
                ListTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignIn())
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
                              shrinePink400,
                              shrinePink300,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          width: 180,
                          height: 35,
                          alignment: Alignment.center,
                          child: Text('ثبت نام', style: TextStyle(fontSize: 13, color: Colors.white),),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 5,),
                ListTile(
                  title: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LogIn())
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
                              shrinePink400,
                              shrinePink300,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          width: 180,
                          height: 35,
                          alignment: Alignment.center,
                          child: Text('ورود', style: TextStyle(fontSize: 13, color: Colors.white),),
                        ),
                      ),
                    ),
                  ),
                ),


                SizedBox(height: 20,),
                ListTile(
                  title: TextButton(
                    onPressed: (){},
                    child: Text("خانه", style: TextStyle(color: Colors.white),),
                  ),
                  leading: Icon(Icons.home),
                ),

                SizedBox(height: 10,),
                ListTile(
                  title: TextButton(
                    onPressed: (){},
                    child: Text("ورود کاربران", style: TextStyle(color: Colors.white),),
                  ),
                  leading: Icon(Icons.account_circle),
                ),

                SizedBox(height: 10,),
                ListTile(
                  title: TextButton(
                    onPressed: (){},
                    child: Text("درباره ما", style: TextStyle(color: Colors.white),),
                  ),
                  leading: Icon(Icons.announcement),
                ),

                SizedBox(height: 10,),
                ListTile(
                  title: TextButton(
                    onPressed: (){},
                    child: Text("ارتباط با ما", style: TextStyle(color: Colors.white),),
                  ),
                  leading: Icon(Icons.share),
                ),

              ],
            ),
          ),
        ),

        ////////////////////////////// BODY //////////////////////////////

        

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