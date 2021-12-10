import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz/Pages/University/UniversityPanel.dart';
import 'package:http/http.dart' as http;
import 'package:quiz/Classes/Teacher/Teacher.dart';

class AddTeacher extends StatelessWidget {

  String UsernameTXT, PasswordTXT, UniversityIDTXT;

  AddTeacher({Key? key,
    required this.UsernameTXT,
    required this.PasswordTXT,
    required this.UniversityIDTXT}) : super(key: key);

  TextEditingController TNameCNT = TextEditingController();
  TextEditingController TLastnameCNT = TextEditingController();
  TextEditingController TUsernameCNT = TextEditingController();
  TextEditingController TPasswordCNT = TextEditingController();
  TextEditingController TPassConfirmCNT = TextEditingController();
  TextEditingController TEmailCNT = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      ////////////////////////////// APP BAR //////////////////////////////

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UniversityPanel(UsernameTXT: UsernameTXT, PasswordTXT: PasswordTXT, UniversityIDTXT: "UniversityIDTXT"))
            );
          },
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
                        Text("اضافه کردن استاد", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: shrineBlue600),),
                        SizedBox(height: 25,)
                      ],
                    ),

                    // Inputs
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: Column(
                        children: [

                          SimpleInput(label: "نام"),
                          SizedBox(height: 15,),

                          SimpleInput(label: "نام خانوادگی"),
                          SizedBox(height: 15,),

                          UsernameInput(label: "نام کاربری"),
                          SizedBox(height: 15,),

                          PasswordInput(label: "رمز عبور"),
                          SizedBox(height: 15,),

                          PasswordInput(label: "تایید رمز عبور"),
                          SizedBox(height: 15,),

                          EmailInput(label: "ایمیل"),
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
                        onPressed: () async{

                          String Name = TNameCNT.text;
                          String Lastname = TLastnameCNT.text;
                          String Username = TUsernameCNT.text;
                          String Password = TPasswordCNT.text;
                          String PassConf = TPassConfirmCNT.text;
                          String Email = TEmailCNT.text;

                          if(TNameCNT.text.isEmpty || TLastnameCNT.text.isEmpty ||
                              TPassConfirmCNT.text.isEmpty || TPasswordCNT.text.isEmpty ||
                              TEmailCNT.text.isEmpty){
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
                          }
                          else{
                            Teacher teacher = Teacher(
                              UniId: UniversityIDTXT,
                              FullName: Name + " " + Lastname,
                              Password: Password,
                              Username: Username,
                              Email: Email,
                              Role: "Teacher",
                            );

                            final teacher_response = await http.post(
                              Uri.parse('http://localhost:3000/api/v1/user/create'),
                              headers: <String, String>{
                                'Content-Type': 'application/json; charset=UTF-8',
                              },
                              body: jsonEncode(<String, String>{
                                'uniId': teacher.UniId,
                                'fullName': teacher.FullName,
                                'password': teacher.Password,
                                'username': teacher.Username,
                                'email': teacher.Email,
                                'role': teacher.Role
                              }),
                            );

                            String teacherId = getID(teacher_response.body);

                            if(teacher_response.body.isEmpty){

                            }
                            else{
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => UniversityPanel(UsernameTXT: UsernameTXT, PasswordTXT: PasswordTXT, UniversityIDTXT: UniversityIDTXT))
                              );
                            }
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
                            MaterialPageRoute(
                              builder: (context) => UniversityPanel(UsernameTXT: UsernameTXT, PasswordTXT: PasswordTXT, UniversityIDTXT: '',)
                            )
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


Widget SimpleInput({label}){
  return TextFormField(
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      focusColor: shrinePink400,
      labelText: label,
      border: OutlineInputBorder(),
      labelStyle: TextStyle(color: Color(0xFF3E5196)),
    ),
  );
}

Widget UsernameInput({label}){
  return TextFormField(
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

Widget EmailInput({label}){
  return TextFormField(
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

Widget PasswordInput({label}){
  bool status = true;
  return TextFormField(
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

const Color shrinePink300 = Color(0xFFEB927B);
const Color shrinePink400 = Color(0xFFEE537C);

const Color shrineBlue900 = Color(0xFF363671);
const Color shrineBlue600 = Color(0xFF3E5196);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;