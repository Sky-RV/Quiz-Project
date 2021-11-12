import 'package:flutter/material.dart';
import 'package:quiz/pages/University/ChangePasswordPage.dart';
import 'package:quiz/pages/University/UniversityProfilePage.dart';
import 'package:quiz/main.dart';
import 'package:quiz/pages/University/AddTeacher.dart';
import 'package:quiz/pages/University/AddStudent.dart';
import 'package:quiz/pages/University/AddLesson.dart';

class UniversityPanel extends StatelessWidget {

  String UsernameTXT, PasswordTXT;
  UniversityPanel({Key? key,
    required this.UsernameTXT,
    required this.PasswordTXT}) : super(key: key);

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

  Map<int, bool> countToValue = <int, bool>{};

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return DefaultTabController(

      length: 3,

      child: Scaffold(

        ////////////////////////////// APP BAR //////////////////////////////

        appBar: AppBar(

          backgroundColor: shrineBlue900,

          ////////////////////////////// TAB BAR //////////////////////////////

          bottom: TabBar(

            indicatorColor: shrinePink400,
            labelColor: shrinePink300,
            unselectedLabelColor: Colors.white70,

            tabs: [
              Tab(text: 'استاد',),
              Tab(text: 'دانشجو',),
              Tab(text: 'درس',),
            ],
          ),

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
          child: ListView(
            children: <Widget>[

              UserAccountsDrawerHeader(
                accountName: Text(UsernameTXT, style: TextStyle(fontSize: 20),),
                accountEmail: Text(PasswordTXT, style: TextStyle(fontSize: 14),),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(UsernameTXT[0], style: TextStyle(fontSize: 30),),
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF363671),
                      Color(0xFF3E5196),
                      Color(0xFF4E65B8),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20,),
              ListTile(
                title: TextButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UniversityPanel(UsernameTXT: UsernameTXT, PasswordTXT: PasswordTXT,))
                    );
                  },
                  child: Text("داشبورد", style: TextStyle(color: Colors.black),),
                ),
                leading: Icon(Icons.dashboard),
              ),

              SizedBox(height: 10,),
              ListTile(
                title: TextButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UniversityProfilePage(UsernameTXT: UsernameTXT, PasswordTXT: PasswordTXT,))
                    );
                  },
                  child: Text("پروفایل", style: TextStyle(color: Colors.black),),
                ),
                leading: Icon(Icons.account_circle),
              ),

              SizedBox(height: 10,),
              ListTile(
                title: TextButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ChangePasswordPage(UsernameTXT: UsernameTXT, PasswordTXT: PasswordTXT,))
                    );
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

        ////////////////////////////// BODY //////////////////////////////

        body: TabBarView(
          children: [

            ////////////////////////////// Teacher //////////////////////////////

            Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: shrinePink300,
                foregroundColor: Colors.black,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddTeacher())
                  );
                },
                child: Icon(Icons.add),
              ),
              body: ListView(
                children: [
                  for (int count in List.generate(9, (index) => index + 1))
                    ListTile(
                      title: Text('List item 1'),
                      isThreeLine: true,
                      subtitle: Text('Secondary text\nTertiary text'),
                    //  leading: Icon(Icons.label),
                    //  trailing: ,
                    ),
                ],
              )
            ),

            ////////////////////////////// Student //////////////////////////////

            Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: shrinePink300,
                foregroundColor: Colors.black,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddStudent())
                  );
                },
                child: Icon(Icons.add),
              ),
              body: ListView(
                children: [
                  for (int count in List.generate(9, (index) => index + 1))
                    ListTile(
                      title: Text('List item 1'),
                      isThreeLine: true,
                      subtitle: Text('Secondary text\nTertiary text'),
                      //  leading: Icon(Icons.label),
                      //  trailing: ,
                    ),
                ],
              ),
            ),

            ////////////////////////////// Class //////////////////////////////

            Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: shrinePink300,
                foregroundColor: Colors.black,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddLesson())
                  );
                },
                child: Icon(Icons.add),
              ),
              body: ListView(
                children: [
                  for (int count in List.generate(9, (index) => index + 1))
                    ListTile(
                      title: Text('List item 1'),
                      isThreeLine: true,
                      subtitle: Text('Secondary text\nTertiary text'),
                      //  leading: Icon(Icons.label),
                      //  trailing: ,
                    ),
                ],
              ),
            ),
          ],
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