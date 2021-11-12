import 'package:flutter/material.dart';
import 'package:quiz/pages/University/UniversityPanel.dart';

class AddLesson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildShrineTheme(),
      title: 'Quiz Project',
      home: AddLesson_Page(),
    );
  }
}

class AddLesson_Page extends StatefulWidget {
  @override
  State<AddLesson_Page> createState() => _AddLesson_State();
}

class _AddLesson_State extends State<AddLesson_Page>{

  @override
  Widget build(BuildContext context) {

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

      /////////////////////////////////// BODY /////////////////////////////

      // body: SafeArea(
      //   child: SingleChildScrollView(
      //     child: Stack(
      //       children: <Widget>[
      //
      //         Container(
      //
      //           height: MediaQuery.of(context).size.height,
      //           width: double.infinity,
      //
      //           child: Column(
      //             children: [
      //
      //               // Title
      //               Column(
      //                 children: [
      //                   SizedBox(height: 35,),
      //                   Text("ثبت نام دانشجو", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: shrineBlue600),),
      //                   SizedBox(height: 25,)
      //                 ],
      //               ),
      //
      //               // Inputs
      //               Padding(
      //                 padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      //                 child: Column(
      //                   children: [
      //
      //                     SimpleInput(label: "نام"),
      //                     SizedBox(height: 15,),
      //
      //                     SimpleInput(label: "نام خانوادگی"),
      //                     SizedBox(height: 15,),
      //
      //                     UsernameInput(label: "نام کاربری"),
      //                     SizedBox(height: 15,),
      //
      //                     PasswordInput(label: "رمز عبور"),
      //                     SizedBox(height: 15,),
      //
      //                     PasswordInput(label: "تایید رمز عبور"),
      //                     SizedBox(height: 15,),
      //
      //                     EmailInput(label: "ایمیل"),
      //                     SizedBox(height: 15,),
      //
      //                   ],
      //                 ),
      //               ),
      //
      //               SizedBox(height: 35,),
      //
      //               // Save Button
      //               Padding(
      //                 // padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      //                 padding: EdgeInsets.symmetric(horizontal: 40),
      //                 child: ElevatedButton(
      //                   onPressed: (){},
      //                   style: ElevatedButton.styleFrom(
      //                     padding: EdgeInsets.zero,
      //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      //                   ),
      //                   child: Ink(
      //                     decoration: BoxDecoration(
      //                       gradient: LinearGradient(
      //                         colors: [
      //                           Color(0xFFEE537C),
      //                           Color(0xFFEB927B)
      //                         ],
      //                       ),
      //                       borderRadius: BorderRadius.circular(20),
      //                     ),
      //                     child: Container(
      //                       width: 180,
      //                       height: 35,
      //                       alignment: Alignment.center,
      //                       child: Text('ثبت نام', style: TextStyle(fontSize: 13, color: Colors.white),),
      //                     ),
      //                   ),
      //                 ),
      //                 // child: MaterialButton(
      //                 //   minWidth: double.infinity,
      //                 //   height: 60,
      //                 //   onPressed: (){},
      //                 //
      //                 // )
      //               ),
      //
      //               SizedBox(height: 15,),
      //
      //               // Cancel Button
      //               Padding(
      //                 // padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      //                 padding: EdgeInsets.symmetric(horizontal: 40),
      //                 child: ElevatedButton(
      //                   onPressed: (){},
      //                   style: ElevatedButton.styleFrom(
      //                     padding: EdgeInsets.zero,
      //                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      //                   ),
      //                   child: Ink(
      //                     decoration: BoxDecoration(
      //                       gradient: LinearGradient(
      //                         colors: [
      //                           Color(0xFF555455),
      //                           Color(0xFFA7A7A7),
      //                         ],
      //                       ),
      //                       borderRadius: BorderRadius.circular(20),
      //                     ),
      //                     child: Container(
      //                       width: 180,
      //                       height: 35,
      //                       alignment: Alignment.center,
      //                       child: Text('لغو', style: TextStyle(fontSize: 13, color: Colors.white),),
      //                     ),
      //                   ),
      //                 ),
      //                 // child: MaterialButton(
      //                 //   minWidth: double.infinity,
      //                 //   height: 60,
      //                 //   onPressed: (){},
      //                 //
      //                 // )
      //               ),
      //
      //             ],
      //           ),
      //
      //         ),
      //
      //       ],
      //     ),
      //   ),
      // ),

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

const Color shrinePink300 = Color(0xFFEB927B);
const Color shrinePink400 = Color(0xFFEE537C);

const Color shrineBlue900 = Color(0xFF363671);
const Color shrineBlue600 = Color(0xFF3E5196);

const Color shrineErrorRed = Color(0xFFC5032B);

const Color shrineSurfaceWhite = Color(0xFFFFFBFA);
const Color shrineBackgroundWhite = Colors.white;

const defaultLetterSpacing = 0.03;