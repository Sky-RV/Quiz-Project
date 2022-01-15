import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quiz/Pages/Student/ExamListDetails.dart';
import 'package:quiz/main.dart';

class StudentPanel extends StatelessWidget{

  String FullName, ID, UniversityID;
  StudentPanel({
    Key? key,
    required this.FullName,
    required this.ID,
    required this.UniversityID,
}) : super(key: key);

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

  int _counterIndex = 0;
  static const List<Widget> _options = <Widget> [
    Text('Dashboard', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black)),
    Text('Online Exams', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _counterIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

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

        ////////////////////////////// BOTTOM NAVIGATION //////////////////////////////
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _counterIndex,
          backgroundColor: colorScheme.surface,
          selectedItemColor: shrinePink400,
          unselectedItemColor: colorScheme.onSurface.withOpacity(.60),
          selectedLabelStyle: textTheme.caption,
          unselectedLabelStyle: textTheme.caption,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              label: 'Dashboard',
              icon: Icon(Icons.dashboard),
            ),
            BottomNavigationBarItem(
              label: 'Online Exams',
              icon: Icon(Icons.article),
            ),
          ],
        ),

        ////////////////////////////// BODY //////////////////////////////
        body: Center(
         // child: _options.elementAt(_counterIndex),
          child: DashboardPage(context, _options.elementAt(_counterIndex)),
        ),
      ),

    );

  }
}

Widget DashboardPage(BuildContext context, Widget type){

  final double _w = MediaQuery.of(context).size.width;
  Widget dashboard = Text('Dashboard', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black));
  Widget onlineExams = Text('Online Exams', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black));

  // Dashboard -> close exams and exams in process
  // Online Exams -> all of the exams

  if (type.toString() == dashboard.toString()){
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
                    trailing: Text("10", style: TextStyle(color: Colors.black38),),
                    onTap: (){
                      // Go for details and start
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ExamListDetails(StudentID: "1", TestID: "1", UniversityID: "1",))
                      );
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
  else if (type.toString() == onlineExams.toString()){
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: (){},
        backgroundColor: shrinePink300,
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
                    margin: EdgeInsets.only(bottom: 15),

                    child: ListTile(
                      title: Text('List item 1', style: TextStyle(color: shrinePink400),),
                      subtitle: Text('Start Time : 1400-10-22  16:00'),
                      // test or text
                      leading: Icon(Icons.article_sharp),
                      // test numbers
                      trailing: Text("10", style: TextStyle(color: Colors.black38),),
                      onTap: (){
                        // Go for details and start
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ExamListDetails(StudentID: "1", TestID: "1", UniversityID: "1",))
                        );
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
      ),
    );
  }
  return Text("Error");
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