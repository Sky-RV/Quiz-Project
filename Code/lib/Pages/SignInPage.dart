import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:quiz/Classes/University/User.dart';
import 'package:quiz/Pages/LogInPage.dart';
import 'package:quiz/Pages/SignInPage.dart';
import 'package:quiz/Pages/LogInPage.dart';
import 'package:quiz/main.dart';
import 'package:quiz/Pages/AboutUs.dart';
import 'package:quiz/Pages/ContactWithUs.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildShrineTheme(),
      title: 'Quiz Project',
      home: SignIn_Page(),
    );
  }
}

class SignIn_Page extends StatefulWidget {
  @override
  State<SignIn_Page> createState() => _SignIn_PageState();
}

class _SignIn_PageState extends State<SignIn_Page> {

  bool _uniValid = false;
  bool _nameValid = false;
  bool _lastnameValid = false;
  bool _usernameValid = false;
  bool _passValid = false;
  bool _conPassValid = false;
  bool _emailValid = false;

  TextEditingController UniversityCNT = TextEditingController();
  TextEditingController NameCNT = TextEditingController();
  TextEditingController LastnameCNT = TextEditingController();
  TextEditingController UsernameCNT = TextEditingController();
  TextEditingController PasswordCNT = TextEditingController();
  TextEditingController PasswordConfirmCNT = TextEditingController();
  TextEditingController EmailCNT = TextEditingController();

  final URL = "http://localhost:3000/api/v1/user/create";

  @override
  void dispose() {
    UniversityCNT.dispose();
    NameCNT.dispose();
    LastnameCNT.dispose();
    UsernameCNT.dispose();
    PasswordCNT.dispose();
    PasswordConfirmCNT.dispose();
    EmailCNT.dispose();
    super.dispose();
  }

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

      body: SafeArea(
        child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                Container(

                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,

                  child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [

                          SizedBox(height: 10,),
                          Text("ثبت نام", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: shrineBlue600),),
                          SizedBox(height: 20,),
                          //    Text("Create an university account", style: TextStyle(fontSize: 15, color: Colors.grey),),
                          //    SizedBox(height: 30,)

                        ],
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        child: Column(

                          // Inputs
                          children: [
                            UniversityInput(label: "دانشگاه", validation: _uniValid),
                            SizedBox(height: 15,),

                            SimpleInput(label: "نام", validation: _nameValid),
                            SizedBox(height: 15,),

                            SimpleInput(label: "نام خانوادگی", validation: _lastnameValid),
                            SizedBox(height: 15,),

                            UsernameInput(label: "نام کاربری", validation: _usernameValid),
                            SizedBox(height: 15,),

                            PasswordInput(label: "رمز", validation: _passValid),
                            SizedBox(height: 15,),

                            PasswordInput(label: "تایید رمز", validation: _conPassValid),
                            SizedBox(height: 15,),

                            EmailInput(label: "ایمیل", validation: _emailValid),
                            SizedBox(height: 15,)
                          ],
                        ),
                      ),

                      SizedBox(height: 20,),

                      // Sign In Button

                      Padding(
                        // padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: ElevatedButton(
                          onPressed: (){
                            String university = UniversityCNT.text;
                            String name = NameCNT.text;
                            String lastname = LastnameCNT.text;
                            String username = UsernameCNT.text;
                            String password = PasswordCNT.text;
                            String passwordConfirm = PasswordConfirmCNT.text;
                            String email = EmailCNT.text;

                            String fullname = name + " " + lastname;
                            String role = "Manager : " + university;

                            // Empty Fields Conditions

                            setState(() {
                              university.isEmpty ? _uniValid = true : _uniValid = false;
                              name.isEmpty ? _nameValid = true : _nameValid = false;
                              lastname.isEmpty ? _lastnameValid = true : _lastnameValid = false;
                              username.isEmpty ? _usernameValid = true : _usernameValid = false;
                              password.isEmpty ? _passValid = true : _passValid = false;
                              passwordConfirm.isEmpty ? _conPassValid = true : _conPassValid = false;
                              email.isEmpty ? _emailValid = true : _emailValid = false;
                            });

                              if(password != passwordConfirm){
                                // error masage
                              }
                              else{
                                // sign in
                                postData(university, fullname, username, password, email);
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
                              child: Text('ثبت نام', style: TextStyle(fontSize: 13, color: Colors.white),),
                            ),
                          ),
                        ),
                        // child: MaterialButton(
                        //   minWidth: double.infinity,
                        //   height: 60,
                        //   onPressed: (){},
                        //
                        // )
                      ),

                      // Have an account

                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LogIn())
                              );
                            },
                            child: Text('ورود', style: TextStyle(fontSize: 13, color: Color(0xFF3E5196), fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text('از قبل دارای اکانت هستید؟', style: TextStyle(fontSize: 13, color: Color(0xFF3E5196)),),
                        ],
                      ),

                    ],
                  ),

                ),
              ],
            )
        ),
      ),

    );
  }

  void postData(String uni, String fullname, String username, String password, String email) async{
    try{
      final response = await post(Uri.parse(URL), body:{
        "fullName": fullname,
        "password": password,
        "email": email,
        "username": username,
        "role": "Manager"
      });
      print(response.body);
    }
    catch(err){
    }
  }
}

Widget SimpleInput({label, validation}){
  return TextFormField(
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      focusColor: shrinePink400,
      labelText: label,
      border: OutlineInputBorder(),
      labelStyle: TextStyle(color: Color(0xFF3E5196)),
      errorText: validation ? label + "can not be empty" : null,
    ),
  );
}

Widget UsernameInput({label, validation}){
  return TextFormField(
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Color(0xFF3E5196)),
        prefixIcon: Icon(Icons.account_circle),
      errorText: validation ? label + "can not be empty" : null,
    ),
  );
}

Widget UniversityInput({label, validation}){
  return TextFormField(
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Color(0xFF3E5196)),
        errorText: validation ? label + "can not be empty" : null,
        prefixIcon: Icon(Icons.account_balance_sharp)
    ),
  );
}

Widget EmailInput({label, validation}){
  return TextFormField(
    style: TextStyle(color: Colors.black),
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      labelStyle: TextStyle(color: Color(0xFF3E5196)),
      errorText: validation ? label + "can not be empty" : null,
      prefixIcon: Icon(Icons.email),
    ),
  );
}

Widget PasswordInput({label, validation}){
  bool status = true;
  return TextFormField(
    style: TextStyle(color: Colors.black),
    obscureText: status,
    enableSuggestions: false,
    autocorrect: false,
    decoration: InputDecoration(
        errorText: validation ? label + "can not be empty" : null,
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

// Widget ErrorInput({label}){
//   return TextFormField(
//     decoration: InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(),
//         labelStyle: TextStyle(color: Color(0xFF3E5196)),
//         suffixIcon: Icon(Icons.visibility),
//         prefixIcon: Icon(Icons.password)
//     ),
//   );
// }

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

