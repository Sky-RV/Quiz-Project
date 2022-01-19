import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz/Pages/University/UniversityPanel.dart';
import 'package:http/http.dart' as http;

class AddStudent extends StatelessWidget {

  String FullName, ID, UniversityID, Token;
  AddStudent({Key? key,
    required this.FullName,
    required this.ID,
    required this.UniversityID,
    required this.Token
  }) : super(key: key);

  TextEditingController SNameCNT = TextEditingController();
  TextEditingController SLastnameCNT = TextEditingController();
  TextEditingController SUsernameCNT = TextEditingController();
  TextEditingController SPasswordCNT = TextEditingController();
  TextEditingController SPassConfirmCNT = TextEditingController();
  TextEditingController SEmailCNT = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      ////////////////////////////// APP BAR //////////////////////////////

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () => Navigator.of(context).pop(),
        ),
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

      /////////////////////////////////// BODY /////////////////////////////

      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[

              Container(

                height: MediaQuery.of(context).size.height,
                width: double.infinity,

                child: Column(
                  children: [

                    // Title
                    Column(
                      children: [
                        SizedBox(height: 35,),
                        Text("اضافه کردن دانشجو", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: shrineBlue600),),
                        SizedBox(height: 25,)
                      ],
                    ),

                    // Inputs
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: Column(
                        children: [

                          SimpleInput(label: "نام", cnt: SNameCNT),
                          SizedBox(height: 15,),

                          SimpleInput(label: "نام خانوادگی", cnt: SLastnameCNT),
                          SizedBox(height: 15,),

                          UsernameInput(label: "نام کاربری", cnt: SUsernameCNT),
                          SizedBox(height: 15,),

                          PasswordInput(label: "رمز عبور", cnt: SPasswordCNT),
                          SizedBox(height: 15,),

                          PasswordInput(label: "تایید رمز عبور", cnt: SPassConfirmCNT),
                          SizedBox(height: 15,),

                          EmailInput(label: "ایمیل", cnt: SEmailCNT),
                          SizedBox(height: 15,),

                        ],
                      ),
                    ),

                    SizedBox(height: 35,),

                    // Save Button
                    Padding(
                      // padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                        onPressed: () async {

                          String Name = SNameCNT.text;
                          String Lastname = SLastnameCNT.text;
                          String Username = SUsernameCNT.text;
                          String Password = SPasswordCNT.text;
                          String PassConf = SPassConfirmCNT.text;
                          String Email = SEmailCNT.text;
                          String Role = "Student";
                          String FullName = Name + " " + Lastname;

                          // Empty Conditions

                          // Create Student
                          final student_response = await http.post(
                            Uri.parse('http://localhost:3000/api/v1/user/create'),
                            headers: <String, String>{
                              'Content-Type': 'application/json; charset=UTF-8',
                            },
                            body: jsonEncode(<String, String>{
                              'uniId': UniversityID,
                              'fullName': Name + " " + Lastname,
                              'password': Password,
                              'username': Username,
                              'email': Email,
                              'role': Role
                            }),
                          );

                          String studentID = getID(student_response.body);

                          if(student_response.body.isEmpty ||
                              SNameCNT.text.isEmpty || SLastnameCNT.text.isEmpty || SUsernameCNT.text.isEmpty ||
                              SPasswordCNT.text.isEmpty || SPassConfirmCNT.text.isEmpty || SEmailCNT.text.isEmpty){
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                // return object of type Dialog
                                return AlertDialog(
                                  title: new Text("Error", style: TextStyle(color: Colors.red),),
                                  content: new Text("Please try again", style: TextStyle(color: Colors.black),),
                                  actions: <Widget>[
                                    // usually buttons at the bottom of the dialog
                                    new FlatButton(
                                      child: new Text("Close", style: TextStyle(color: shrinePink300),),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                            print(student_response.body + "\nUniID : " + UniversityID
                                + "\n name " + FullName + "\n user and pass : " + Username + " " + Password
                                + "\nemail : " + Email + " " + Role + "\n" + PassConf);
                          }
                          else{
                            print(student_response.body);
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => UniversityPanel(FullName: FullName, ID: 'Student', UniversityID: UniversityID, Token: Token, myToken: 'Student',))
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

                    SizedBox(height: 15,),

                    // Cancel Button
                    Padding(
                      // padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => UniversityPanel(FullName: FullName, ID: 'Student', UniversityID: UniversityID, Token: Token, myToken: 'Student',))
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
                                Color(0xFF555455),
                                Color(0xFFA7A7A7),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            width: 180,
                            height: 35,
                            alignment: Alignment.center,
                            child: Text('لغو', style: TextStyle(fontSize: 13, color: Colors.white),),
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

String getID(String str) {
  String id1 = "", id2 = "";
  String id = id1 + id2;

  for(int i=0; i<str.length; i++){
    if(str[i]=='i' && str[i+1]=='d'){
      // return str[i+4]; // رقم اول دو رقمی
      //return str[i+4] + str[i+5];
      if (str[i+5] != ','){
        id2 = str[i+5];
        return str[i+4] + str[i+5];
      }
      else{
        return str[i+4];
      }
    }
  }
  return id;
}

Widget SimpleInput({label, cnt}){
  return TextFormField(
    controller: cnt,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      focusColor: shrinePink400,
      labelText: label,
      border: OutlineInputBorder(),
      labelStyle: TextStyle(color: Color(0xFF3E5196)),
    ),
  );
}

Widget UsernameInput({label, cnt}){
  return TextFormField(
    controller: cnt,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Color(0xFF3E5196)),
        prefixIcon: Icon(Icons.account_circle)
    ),
  );
}

// Widget UniversityInput({label}){
//   return TextFormField(
//     style: TextStyle(color: Colors.black),
//     decoration: InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(),
//         labelStyle: TextStyle(color: Color(0xFF3E5196)),
//         prefixIcon: Icon(Icons.account_balance_sharp)
//     ),
//   );
// }

Widget EmailInput({label, cnt}){
  return TextFormField(
    controller: cnt,
    style: TextStyle(color: Colors.black),
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      labelStyle: TextStyle(color: Color(0xFF3E5196)),
      prefixIcon: Icon(Icons.email),
    ),
  );
}

Widget PasswordInput({label, cnt}){
  bool status = true;
  return TextFormField(
    controller: cnt,
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