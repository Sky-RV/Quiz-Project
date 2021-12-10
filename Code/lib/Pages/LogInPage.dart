import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiz/Pages/ForgetPassword.dart';
import 'package:quiz/Pages/SignInPage.dart';
import 'package:quiz/Pages/Teacher/TeacherPanel.dart';
import 'package:quiz/Pages/University/UniversityPanel.dart';
import 'package:quiz/Pages/AboutUs.dart';
import 'package:quiz/Pages/ContactWithUs.dart';
import 'package:http/http.dart';
import '../main.dart';

class LogIn extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildShrineTheme(),
      title: 'Quiz Project',
      home: LogIn_Page(),
    );
  }
}

class LogIn_Page extends StatefulWidget {
  @override
  State<LogIn_Page> createState() => _LogIn_PageState();
}

class _LogIn_PageState extends State<LogIn_Page> {

  final URL = "http://localhost:3000/api/v1/auth/login";

  int _value = -1;

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    TextEditingController UserController = TextEditingController();
    TextEditingController PassController = TextEditingController();

    bool _userValid = false, _passValid = false;

    String _selectedValue = 'مدیر';
    bool _isObscure = true;
    bool _validate = false;

    @override
    void dispose() {
      UserController.dispose();
      PassController.dispose();
      super.dispose();
    }

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
                        width: 200,
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
                        width: 200,
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
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp())
                    );
                  },
                  child: Text("خانه", style: TextStyle(color: Colors.white),),
                ),
                leading: Icon(Icons.home, color: Colors.white70,),
              ),

              SizedBox(height: 10,),
              ListTile(
                title: TextButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogIn())
                    );
                  },
                  child: Text("ورود کاربران", style: TextStyle(color: Colors.white),),
                ),
                leading: Icon(Icons.account_circle, color: Colors.white70,),
              ),

              SizedBox(height: 10,),
              ListTile(
                title: TextButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutUs())
                    );
                  },
                  child: Text("درباره ما", style: TextStyle(color: Colors.white),),
                ),
                leading: Icon(Icons.announcement, color: Colors.white70,),
              ),

              SizedBox(height: 10,),
              ListTile(
                title: TextButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactWithUs())
                    );
                  },
                  child: Text("ارتباط با ما", style: TextStyle(color: Colors.white),),
                ),
                leading: Icon(Icons.share, color: Colors.white70,),
              ),

            ],
          ),
        ),
      ),


      /////////////////////////////////// BODY /////////////////////////////

      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: 20,),
                SizedBox(height: 20,),
                Text("ورود", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: shrineBlue600),),
                SizedBox(height: 150,),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              child: Column(

                children: [

                  // Inputs
                  UsernameInput(label: 'نام کاربری', UserController: UserController, valid: _userValid),
                  //  TextFormField(
                  //    controller: UserController,
                  //    style: TextStyle(color: Colors.black),
                  //    decoration: InputDecoration(
                  //        errorText: _validate ? 'نام کاربری اشتباه است.' : null,
                  //        labelText: 'نام کاربردی',
                  //        border: OutlineInputBorder(),
                  //        labelStyle: TextStyle(color: Color(0xFF3E5196)),
                  //        prefixIcon: Icon(Icons.account_circle)
                  //    ),
                  //  ),
                  SizedBox(height: 40,),

                  PasswordInput(label: 'رمز', PassController: PassController, valid: _passValid),
                  //  TextField(
                  //    obscureText: _isObscure,
                  //    decoration: InputDecoration(
                  //        labelText: 'Password',
                  //        suffixIcon: IconButton(
                  //            icon: Icon(
                  //                _isObscure ? Icons.visibility : Icons.visibility_off),
                  //            onPressed: () {
                  //              setState(() {
                  //                _isObscure = !_isObscure;
                  //              });
                  //            })),
                  //  ),
                  SizedBox(height: 5,),
                ],

              ),
            ),

            SizedBox(height: 5,),

            TextButton(
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ForgetPassword())
                );
              },
              child: Text('فراموشی رمز ورود؟', style: TextStyle(fontSize: 13, color: Color(0xFFFF0000), fontWeight: FontWeight.bold),),
            ),

            SizedBox(height: 30,),

            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Radio(
                  activeColor: shrineBlue600,
                  value: 1,
                  groupValue: _value,
                  onChanged: (value){
                    setState(() {
                      _value = int.parse(value.toString());
                    });
                  },
                ),
                new Text('مدیر', style: TextStyle(color: Colors.black),),

                SizedBox(width: 10,),

                new Radio(
                  activeColor: shrineBlue600,
                  value: 2,
                  groupValue: _value,
                  onChanged: (value){
                    setState(() {
                      _value = int.parse(value.toString());
                    });
                  },
                ),
                new Text('استاد', style: TextStyle(color: Colors.black),),

                SizedBox(width: 10,),

                new Radio(
                  activeColor: shrineBlue600,
                  value: 3,
                  groupValue: _value,
                  onChanged: (value){
                    setState(() {
                      _value = int.parse(value.toString());
                    });
                  },
                ),
                new Text('دانشجو', style: TextStyle(color: Colors.black),),

              ],
            ),

            SizedBox(height: 35,),

            //Log In button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton(
                onPressed: (){

                  String Username = UserController.text;
                  String Password = PassController.text;

                  if(Username=='admin' && Password=='admin' && _value==1){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UniversityPanel(UsernameTXT: Username, PasswordTXT: Password, UniversityIDTXT: "UniversityIDTXT"))
                    );
                  }
                  else if(Username=='t' && Password=='t' && _value==2){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TeacherPanel(USERNAME: Username, PASSWORD: Password))
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF363671),
                        Color(0xFFEE537C),
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

          ],
        ),
      ),

      // body: SafeArea(
      //   child: SingleChildScrollView(
      //     child: Stack(
      //       children: <Widget>[
      //
      //         Container(
      //           height: MediaQuery.of(context).size.height,
      //           width: double.infinity,
      //
      //           child: Column(
      //             children: [
      //               Column(
      //                 children: [
      //                   SizedBox(height: 20,),
      //                   SizedBox(height: 20,),
      //                   Text("ورود", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: shrineBlue600),),
      //                   SizedBox(height: 150,),
      //                 ],
      //               ),
      //
      //               Padding(
      //                 padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      //                 child: Column(
      //
      //                   children: [
      //
      //                     // Inputs
      //                     UsernameInput(label: 'نام کاربری', UserController: UserController, valid: _validate),
      //                    //  TextFormField(
      //                    //    controller: UserController,
      //                    //    style: TextStyle(color: Colors.black),
      //                    //    decoration: InputDecoration(
      //                    //        errorText: _validate ? 'نام کاربری اشتباه است.' : null,
      //                    //        labelText: 'نام کاربردی',
      //                    //        border: OutlineInputBorder(),
      //                    //        labelStyle: TextStyle(color: Color(0xFF3E5196)),
      //                    //        prefixIcon: Icon(Icons.account_circle)
      //                    //    ),
      //                    //  ),
      //                     SizedBox(height: 40,),
      //
      //                     PasswordInput(label: 'رمز', PassController: PassController, valid: _validate),
      //                    //  TextField(
      //                    //    obscureText: _isObscure,
      //                    //    decoration: InputDecoration(
      //                    //        labelText: 'Password',
      //                    //        suffixIcon: IconButton(
      //                    //            icon: Icon(
      //                    //                _isObscure ? Icons.visibility : Icons.visibility_off),
      //                    //            onPressed: () {
      //                    //              setState(() {
      //                    //                _isObscure = !_isObscure;
      //                    //              });
      //                    //            })),
      //                    //  ),
      //                     SizedBox(height: 5,),
      //                   ],
      //
      //                 ),
      //               ),
      //
      //               SizedBox(height: 5,),
      //
      //               TextButton(
      //                 onPressed: (){
      //                   Navigator.push(
      //                       context,
      //                       MaterialPageRoute(builder: (context) => ForgetPassword())
      //                   );
      //                 },
      //                 child: Text('فراموشی رمز ورود؟', style: TextStyle(fontSize: 13, color: Color(0xFFFF0000), fontWeight: FontWeight.bold),),
      //               ),
      //
      //               SizedBox(height: 30,),
      //
      //               ListTile(
      //                 title: Text("مدیر",
      //                   style: TextStyle(color: Colors.black, fontSize: 14),),
      //                 leading: Radio(
      //                   value: 1,
      //                   groupValue: _value,
      //                   activeColor: shrineBlue600,
      //                   onChanged: (value){
      //                     setState(() {
      //                       _value = int.parse(value.toString());
      //                     });
      //                   },
      //                 ),
      //               ),
      //               ListTile(
      //                 title: Text('استاد',
      //                   style: TextStyle(color: Colors.black, fontSize: 14),),
      //                 leading: Radio(
      //                   value: 2,
      //                   groupValue: _value,
      //                   activeColor: shrineBlue600,
      //                   onChanged: (value){
      //                     setState(() {
      //                       _value = int.parse(value.toString());
      //                     });
      //                   },
      //                 ),
      //               ),
      //               ListTile(
      //                 title: Text('دانشجو',
      //                   style: TextStyle(color: Colors.black, fontSize: 14),),
      //                 leading: Radio(
      //                   value: 3,
      //                   groupValue: _value,
      //                   activeColor: shrineBlue600,
      //                   onChanged: (value){
      //                     setState(() {
      //                       _value = int.parse(value.toString());
      //                     });
      //                   },
      //                 ),
      //               ),
      //
      //               SizedBox(height: 35,),
      //
      //               //Log In button
      //               Padding(
      //                 padding: EdgeInsets.symmetric(horizontal: 40),
      //                 child: ElevatedButton(
      //                   onPressed: (){
      //
      //                     String Username = UserController.text;
      //                     String Password = PassController.text;
      //
      //                     if(Username=='admin' && Password=='admin'){
      //                       Navigator.push(
      //                           context,
      //                           MaterialPageRoute(builder: (context) => UniversityPanel(UsernameTXT: Username, PasswordTXT: Password,))
      //                       );
      //                     }
      //                     else if(Username=='t' && Password=='t'){
      //                       Navigator.push(
      //                         context,
      //                         MaterialPageRoute(builder: (context) => TeacherPanel(USERNAME: Username, PASSWORD: Password))
      //                       );
      //                     }
      //                     else{
      //                       // error message
      //                     }
      //
      //                   },
      //                   style: ElevatedButton.styleFrom(
      //                     padding: EdgeInsets.zero,
      //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      //                   ),
      //                   child: Ink(
      //                     decoration: BoxDecoration(
      //                       gradient: LinearGradient(
      //                         colors: [
      //                           Color(0xFF363671),
      //                           Color(0xFFEE537C),
      //                         ],
      //                       ),
      //                       borderRadius: BorderRadius.circular(20),
      //                     ),
      //                     child: Container(
      //                       width: 180,
      //                       height: 35,
      //                       alignment: Alignment.center,
      //                       child: Text('ورود', style: TextStyle(fontSize: 13, color: Colors.white),),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //
      //             ],
      //           ),
      //         ),
      //
      //       ],
      //     ),
      //   ),
      // )
    );
  }

  void getUser(String username, String password) async{
    try{
      final response = await post(Uri.parse(URL), body:{

      });
      print(response.body);
    }
    catch(err){
    }
  }
}

Widget UsernameInput({label, UserController, valid}){
  return TextFormField(
    controller: UserController,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Color(0xFF3E5196)),
        errorText: valid ? label + "can not be empty" : null,
        prefixIcon: Icon(Icons.account_circle)
    ),
  );
}

Widget PasswordInput({label, PassController, valid}){
  bool status = true;
  return TextFormField(
    controller: PassController,
    style: TextStyle(color: Colors.black),
    obscureText: status,
    enableSuggestions: false,
    autocorrect: false,
    decoration: InputDecoration(
        errorText: valid ? label + "can not be empty" : null,
        labelText: label,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Color(0xFF3E5196)),
        prefixIcon: Icon(Icons.vpn_key),
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
    //bodyColor: Colors.white,
  );
}

const Color shrinePink300 = Color(0xFFEB927B);
const Color shrinePink400 = Color(0xFFEE537C);

const Color shrineBlue900 = Color(0xFF363671);
const Color shrineBlue600 = Color(0xFF3E5196);

const Color shrineErrorRed = Color(0xFFC5032B);

const defaultLetterSpacing = 0.03;

