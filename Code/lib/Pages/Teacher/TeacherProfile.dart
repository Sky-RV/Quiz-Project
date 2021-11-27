import 'package:flutter/material.dart';
import 'package:quiz/Pages/University/ChangePasswordPage.dart';
import 'package:quiz/Pages/University/UniversityProfilePage.dart';
import 'package:quiz/pages/University/UniversityPanel.dart';
import 'package:quiz/main.dart';

import 'TeacherPanel.dart';

class TeacherProfilePage extends StatelessWidget {

  String UsernameTXT, PasswordTXT;
  TeacherProfilePage({Key? key,
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

  // int _counter = 0;

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
                  gradient: LinearGradient(colors: [
                    Color(0xFF363671),
                    Color(0xFF3E5196),
                    Color(0xFF4E65B8),
                  ])),
            ),
            SizedBox(height: 20,),
            ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TeacherPanel(
                      USERNAME: UsernameTXT,
                      PASSWORD: PasswordTXT,
                    )),
                  );
                },
                child: Text("مدیریت آزمون ها", style: TextStyle(color: Colors.black),),
              ),
              leading: Icon(Icons.article),
            ),
            SizedBox(height: 10,),
            ListTile(
              title: TextButton(
                onPressed: (){},
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
                      MaterialPageRoute(builder: (context) => ChangePasswordPage(UsernameTXT: UsernameTXT, PasswordTXT: PasswordTXT))
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

      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[

              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,

                child: Column(
                  children: [

                    // Image From User
                    Center(
                      child: Image.asset('name'),
                    ),

                    SizedBox(height: 50,),

                    // Inputs
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: Column(

                        children: [
                          UsernameInput(label: "Username", str: UsernameTXT),
                          SizedBox(height: 15,),

                          UniversityInput(label: "University", str: 'چمران'),
                          SizedBox(height: 15,),

                          SimpleInput(label: "FirstName", str: 'یگانه'),
                          SizedBox(height: 15,),

                          SimpleInput(label: 'Lastname', str: 'غنی'),
                          SizedBox(height: 15,),

                          EmailInput(label: "Email", str: PasswordTXT),
                          SizedBox(height: 15,),
                        ],

                      ),
                    ),

                    SizedBox(height: 20,),

                    // Save Button
                    Padding(
                      // padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
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
                            child: Text('ذخیره', style: TextStyle(fontSize: 13, color: Colors.white),),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 15,),
                    Padding(
                      // padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: Ink(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF505050),
                                Color(0xFF939393)
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            width: 180,
                            height: 35,
                            alignment: Alignment.center,
                            child: Text('کنسل', style: TextStyle(fontSize: 13, color: Colors.white),),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}

Widget UsernameInput({label, str}){
  return TextFormField(
    style: TextStyle(color: Colors.black),
    initialValue: str,
    decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Color(0xFF3E5196)),
        prefixIcon: Icon(Icons.account_circle)
    ),
  );
}

Widget UniversityInput({label, str}){
  return TextFormField(
    initialValue: str,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Color(0xFF3E5196)),
        prefixIcon: Icon(Icons.account_balance_sharp)
    ),
  );
}

Widget SimpleInput({label, str}){
  return TextFormField(
    initialValue: str,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      labelStyle: TextStyle(color: Color(0xFF3E5196)),
    ),
  );
}

Widget EmailInput({label, str}){
  return TextFormField(
    initialValue: str,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Color(0xFF3E5196)),
        prefixIcon: Icon(Icons.email)
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