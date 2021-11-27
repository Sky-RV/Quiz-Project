import 'package:flutter/material.dart';
import 'package:quiz/Pages/University/UniversityPanel.dart';
import 'package:quiz/Pages/University/UniversityProfilePage.dart';
import 'package:quiz/main.dart';

import 'TeacherPanel.dart';

class ChangePasswordPage extends StatelessWidget {

  String UsernameTXT, PasswordTXT;
  ChangePasswordPage({Key? key,
    required this.UsernameTXT,
    required this.PasswordTXT}) : super(key: key);


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

                    SizedBox(height: 40,),
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text('تغییر رمز عبور', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: shrineBlue600),),
                    ),

                    SizedBox(height: 50,),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                      child: Column(

                        // Inputs
                        children: [
                          PasswordInput(label: "رمز عبور فعلی"),
                          SizedBox(height: 40,),

                          PasswordInput(label: "رمز عبور جدید"),
                          SizedBox(height: 40,),

                          PasswordInput(label: "تایید رمز عبور جدید"),
                          SizedBox(height: 50,),
                        ],

                      ),
                    ),

                    // Change Password Button
                    Padding(
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
                                shrinePink400,
                                shrinePink300
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

Widget PasswordInput({label, PassController}){
  bool status = true;
  return TextFormField(
    controller: PassController,
    style: TextStyle(color: Colors.black),
    obscureText: status,
    enableSuggestions: false,
    autocorrect: false,
    decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Color(0xFF3E5196)),
        prefixIcon: Icon(Icons.password),
        suffixIcon: IconButton(
          icon: Icon(status ? Icons.visibility : Icons.visibility_off),
          // onPressed: (){
          //   setState(() {
          //     status = !status;
          //   });
          // },
          onPressed: (){},
        )
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