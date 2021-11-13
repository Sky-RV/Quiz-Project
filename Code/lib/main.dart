import 'package:flutter/material.dart';
import 'package:quiz/Pages/LogInPage.dart';
import 'package:quiz/Pages/SignInPage.dart';
import 'package:quiz/app_icons.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildShrineTheme(),
      title: 'Quiz Project',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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

    final String card1_title = "سامانه آنلاین آزمون ساز";
    final String card2_title = "خدمات سامانه آزمون آنلاین ویژه اساتید";
    final String card3_title = "خدمات سامانه آزمون آنلاین ویژه دانشجویان";
    final String card4_title = "خدمات سامانه آزمون آنلاین ویژه دانشگاه";

    final String card1_sub = "جامع ترین ارائه دهنده خدمات آزمون آنلاین تستی و تشریحی ویژه مدارس، دانشگاه ها و موسسات";
    final String card2_sub = "امکان ساخت آزمون آنلاین تستی\nامکان ساخت آزمون آنلاین تشریحی\nامکان تصحیح آزمون های تشریحی";
    final String card3_sub = "امکان شرکت در آزمون های تستی\nامکان شرکت در آزمون های تشریحی\nامکان مرور آزمون";
    final String card4_sub = "امکان اضافه کردن استاد\nامکان اضافه کردن دانشجو\nامکان اضافه کردن درس ها\nامکان انتساب درس و دانشجو و استاد به همدیگر";

    final String btn_text = "بیشتر بخوانید";


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

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(height: 10,),
                Card(
                  shape:
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,

                  child: Column(
                    children: [

                      Padding(  // title
                        padding: EdgeInsets.all(16),
                        child: Text(
                          card1_title,
                          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),

                      Padding(  // supporting text
                        padding: EdgeInsets.all(16),
                        child: Text(
                          card1_sub,
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      Image.network('https://placeimg.com/640/480/any', fit: BoxFit.contain,),

                      ButtonBar(  // button
                        alignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
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
                                child: Text('رایگانن ثبت نام کنید', style: TextStyle(fontSize: 13, color: Colors.white),),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),

                SizedBox(height: 10,),
                Card(
                  shape:
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,

                  child: Column(
                    children: [

                      Padding(  // title
                        padding: EdgeInsets.all(16),
                        child: Text(
                          card2_title,
                          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),

                      Padding(  // supporting text
                        padding: EdgeInsets.all(16),
                        child: Text(
                          card2_sub,
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      Image.network('https://placeimg.com/640/480/any', fit: BoxFit.contain,),

                      ButtonBar(  // button
                        alignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: (){},
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
                                child: Text(btn_text, style: TextStyle(fontSize: 13, color: Colors.white),),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),

                SizedBox(height: 10,),
                Card(
                  shape:
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,

                  child: Column(
                    children: [

                      Padding(  // title
                        padding: EdgeInsets.all(16),
                        child: Text(
                          card3_title,
                          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),

                      Padding(  // supporting text
                        padding: EdgeInsets.all(16),
                        child: Text(
                          card3_sub,
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      Image.network('https://placeimg.com/640/480/any', fit: BoxFit.contain,),

                      ButtonBar(  // button
                        alignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: (){},
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
                                child: Text(btn_text, style: TextStyle(fontSize: 13, color: Colors.white),),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),

                SizedBox(height: 10,),
                Card(
                  shape:
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 5,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,

                  child: Column(
                    children: [

                      Padding(  // title
                        padding: EdgeInsets.all(16),
                        child: Text(
                          card4_title,
                          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),

                      Padding(  // supporting text
                        padding: EdgeInsets.all(16),
                        child: Text(
                          card4_sub,
                          style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      Image.network('https://placeimg.com/640/480/any', fit: BoxFit.contain,),

                      ButtonBar(  // button
                        alignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: (){},
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
                                child: Text(btn_text, style: TextStyle(fontSize: 13, color: Colors.white),),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),

                SizedBox(height: 10,),
                // computer image
                Image.asset('assets/computer.png'),

                // contact with us
                Column(
                  children: [
                    Text("Follow us on", style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                     // icon: Icon(Icons.apps_outlined), // Facebook
                      icon: Icon(MyFlutterApp.facebook_squared),
                      onPressed: (){},
                    ),

                    IconButton(
                      icon: Icon(Icons.apps_outlined), // Twitter
                      onPressed: (){},
                    ),

                    IconButton(
                      icon: Icon(Icons.apps_outlined), // Instagram
                      onPressed: (){},
                    ),

                    IconButton(
                      icon: Icon(Icons.apps_outlined), // YouTube
                      onPressed: (){},
                    ),
                  ],
                ),

                SizedBox(height: 20,)

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