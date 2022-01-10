import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quiz/main.dart';

class StudentPanel extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _buildShrineTheme(),
      title: 'Quiz Project',
      home: StudentPanelPage(),
    );
  }
}

class StudentPanelPage extends StatefulWidget{
  @override
  _StudentPanelPage createState() => _StudentPanelPage();
}

class _StudentPanelPage extends State<StudentPanelPage>{
  // String FullName, ID, UniversityID;
  // StudentPanel({Key? key,
  //   required this.FullName,
  //   required this.ID,
  //   required this.UniversityID
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    int _counterIndex = 0;
    const List<Widget> _options = <Widget> [
      Text('Dashboard', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
      Text('Online Exams', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    ];

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: _buildShrineTheme(),
      home: Scaffold(

        ////////////////////////////// APP BAR //////////////////////////////
        appBar: AppBar(
          backgroundColor: shrineBlue900,
          title: Center(
            child: Text(
              'Quiz Project',
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),

        ////////////////////////////// BOTTOM NAVIGATION //////////////////////////////
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _counterIndex,
          backgroundColor: colorScheme.surface,
          selectedItemColor: shrinePink400,
          unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
          selectedLabelStyle: textTheme.caption,
          items: const [
            BottomNavigationBarItem(
              label: 'Dashboard',
              icon: Icon(Icons.dashboard)
            ),

            BottomNavigationBarItem(
              label: 'Online Exams',
              icon: Icon(Icons.class_)
            ),
          ],
          onTap: (value){
            setState((){
              _counterIndex = value;
              if (_counterIndex == 1){
                DashboardPage(context);
              }
            });
          },
        ),

        ////////////////////////////// DRAWER //////////////////////////////
        drawer: Drawer(
          child: ListView(
            children: <Widget>[

              UserAccountsDrawerHeader(
                accountName: Text('Student Name', style: TextStyle(fontSize: 20),),
                accountEmail: Text("Teacher Email", style: TextStyle(fontSize: 14),),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("S", style: TextStyle(fontSize: 30),),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xFF363671),
                      Color(0xFF3E5196),
                      Color(0xFF4E65B8),
                    ])),
              ),
              SizedBox(height: 20,),

              ListTile(
                title: TextButton(
                  onPressed: (){},
                  // onPressed: (){
                  //   Navigator.push(context,
                  //       MaterialPageRoute(builder: (context) => TeacherProfilePage(FullName: FullName, ID: ID, UniversityID: UniversityID)));
                  // },
                  child: Text("پروفایل", style: TextStyle(color: Colors.black),),
                ),
                leading: Icon(Icons.account_circle),
              ),

              SizedBox(height: 10,),
              ListTile(
                title: TextButton(
                  onPressed: (){
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => )
                    // );
                  },
                  child: Text("تغییر رمز عبور", style: TextStyle(color: Colors.black),),
                ),
                leading: Icon(Icons.vpn_key),
              ),

              SizedBox(height: 10,),
              ListTile(
                title: TextButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp())
                    );
                  },
                  child: Text("خروج", style: TextStyle(color: Colors.black),),
                ),
                leading: Icon(Icons.exit_to_app),
              ),

            ],
          ),
        ),

      ),

    );

  }
}

Widget DashboardPage(BuildContext context){

  final double _w = MediaQuery.of(context).size.width;

  return AnimationLimiter(
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
                margin: EdgeInsets.only(bottom: 15),

                child: ListTile(
                  title: Text('List item 1', style: TextStyle(color: Colors.black),),
                  subtitle: Text('Start Time : 1400-10-22  16:00'),
                  // test or text
                  leading: Icon(Icons.article_sharp),
                  // test numbers
                  trailing: Text("10"),
                  onTap: (){
                    // Go for details and start

                  },
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
  );
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