import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quiz/Classes/User/User.dart';
import 'package:quiz/Pages/University/ChangePasswordPage.dart';
import 'package:quiz/Pages/University/TeacherManagement/AddTeacher.dart';
import 'package:quiz/Pages/University/UniversityProfilePage.dart';
import 'package:quiz/main.dart';
import 'package:quiz/Pages/University/LessonManagement/AddLesson.dart';
import 'package:quiz/Pages/University/StudentManagement/AddStudent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quiz/Pages/University/LessonManagement/StudentList.dart';
import 'package:http/http.dart' as http;



class UniversityPanel extends StatefulWidget {

  final String FullName, ID, UniversityID, Token;
  const UniversityPanel({
    Key? key,
    required this.FullName,
    required this.ID,
    required this.UniversityID,
    required this.Token,
    myToken}) : super(key: key);

  @override
  UniversityPanelPage createState() => UniversityPanelPage();
}

class UniversityPanelPage extends State<UniversityPanel>{


  // Future<List<User>> getUsers(String STR, String str) async{
  //   String url = "http://localhost:3000/api/v1/user/list";
  //   final response = await http.get(Uri.parse(url));
  //
  //   var responseData = json.decode(response.body);
  //
  //   // create list
  //   List<User> usersList = [];
  //   List<User> teachersList = [];
  //   List<User> studentsList = [];
  //
  //   for(var singleUser in responseData){
  //     User user = User(
  //       UniId: singleUser['UniId'],
  //       FullName: singleUser['name'] + " " + singleUser['lastname'],
  //       Username: singleUser['username'],
  //       Password: singleUser['password'],
  //       Email: singleUser['email'],
  //       Role: singleUser['role']
  //     );
  //
  //     if(user.Role == STR || user.Role == str) {
  //       usersList.add(user);
  //     }
  //
  //   }
  //   return usersList;
  // }

  // Future<List<dynamic>> getUsers() async{
  //   String url = "http://localhost:3000/api/v1/user/list";
  //   final response = await http.get(Uri.parse(url));
  //
  //   var responseData = json.decode(response.body);
  //
  //   // create list
  //   List<User> usersList = [];
  //
  //   for(var singleUser in responseData){
  //     User user = User(
  //         UniId: singleUser['uniId'],
  //         FullName: singleUser['fullName'],
  //         Username: singleUser['username'],
  //         Password: singleUser['password'],
  //         Email: singleUser['email'],
  //         Role: singleUser['role'],
  //         Token: singleUser['token']
  //     );
  //
  //     if(responseData['data']['uniId'] == UniversityID){
  //       usersList.add(user);
  //     }
  //   }
  //   return usersList;
  // }

  Future<List<User>> getUsers() async {
    String uri = "http://localhost:3000/api/v1/user/list";
    var response = await http.get(Uri.parse(uri));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((user) => new User.fromJson(user)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  // Future<List<User>> teacherLists() async{
  //   var url = "http://localhost:3000/api/v1/user/list";
  //   final response = await http.get(Uri.parse(url));
  //
  //   if (response.statusCode == 200) {
  //     List jsonResponse = json.decode(response.body);
  //     return jsonResponse.map((data) => new User.fromJson(data)).toList();
  //   } else {
  //     throw Exception('Unexpected error occured!');
  //   }
  // }

  Map<int, bool> countToValue = <int, bool>{};

  late Future<List<User>> teacherList;

  // @override
  // initState(){
  //   teacherList = getUsers();
  // }

  final List<String> Teachers_Name = [];
  final List<String> Teachers_Emails = [];

  final List<String> Students_Name = [];
  final List<String> Students_Emails = [];

  final List<String> Lessons_Name = [];

  // final List<String> Teachers_Name = <String> ['Naji', 'Leo'];
  // final List<String> Teachers_Emails = <String> ['Naji@gmail.com', 'Leo@gmail.com'];
  //
  // final List<String> Students_Name = <String> ['Yeganeh', 'Peni'];
  // final List<String> Students_Emails = <String> ['Yeganeh@gmail.com', 'Peni@gmail.com'];
  //
  // final List<String> Lessons_Name = <String> ['Math', 'Database'];

  @override
  void initState() {
    if(widget.ID == 'Teacher'){
      Teachers_Name.insert(0, 'Leo');
      Teachers_Emails.insert(0, 'Leo@gmail.com');
    }
    if(widget.ID == "Student"){
      Teachers_Name.insert(0, 'Leo');
      Teachers_Emails.insert(0, 'Leo@gmail.com');
      Students_Name.insert(0, 'Peni');
      Students_Emails.insert(0, "Peni@gmail.com");
    }
    if(widget.ID == "Lesson"){
      Teachers_Name.insert(0, 'Leo');
      Teachers_Emails.insert(0, 'Leo@gmail.com');
      Students_Name.insert(0, 'Peni');
      Students_Emails.insert(0, "Peni@gmail.com");
      Lessons_Name.insert(0, 'Database');
    }
  }

  @override
  Widget build(BuildContext context) {

    String ID = widget.ID;
    String FullName = widget.FullName;
    String UniversityID = widget.UniversityID;
    String Token = widget.Token;

    final double _w = MediaQuery.of(context).size.width;

    return DefaultTabController(

      length: 3,

      child: Scaffold(

        ////////////////////////////// APP BAR //////////////////////////////

        appBar: AppBar(

          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
          ],

          backgroundColor: shrineBlue900,

          ////////////////////////////// TAB BAR //////////////////////////////

          bottom: TabBar(

            indicatorColor: shrinePink400,
            labelColor: shrinePink300,
            unselectedLabelColor: Colors.white70,

            tabs: [
              Tab(text: '??????????',),
              Tab(text: '????????????',),
              Tab(text: '??????',),
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
                accountName: Text(FullName, style: TextStyle(fontSize: 20),),
                accountEmail: Text(
                  "Admin Email", style: TextStyle(fontSize: 14),),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(FullName[0], style: TextStyle(fontSize: 30),),
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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            UniversityPanel(FullName: FullName,
                              ID: ID,
                              UniversityID: UniversityID,
                              Token: Token,))
                    );
                  },
                  child: Text(
                    "??????????????", style: TextStyle(color: Colors.black),),
                ),
                leading: Icon(Icons.dashboard),
              ),

              SizedBox(height: 10,),
              ListTile(
                title: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            UniversityProfilePage(FullName: FullName,
                              ID: ID,
                              UniversityID: UniversityID,
                              Token: Token,))
                    );
                  },
                  child: Text(
                    "??????????????", style: TextStyle(color: Colors.black),),
                ),
                leading: Icon(Icons.account_circle),
              ),

              SizedBox(height: 10,),
              ListTile(
                title: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            ChangePasswordPage(FullName: FullName,
                              ID: ID,
                              UniversityID: UniversityID,
                              Token: Token,))
                    );
                  },
                  child: Text(
                    "?????????? ?????? ????????", style: TextStyle(color: Colors.black),),
                ),
                leading: Icon(Icons.vpn_key),
              ),

              SizedBox(height: 10,),
              ListTile(
                title: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp())
                    );
                  },
                  child: Text("????????", style: TextStyle(color: Colors.black),),
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
              // appBar: AppBar(
              //   actions: [
              //     IconButton(
              //       onPressed: (){},
              //       icon: Icon(Icons.search),
              //     ),
              //   ],
              // ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: shrinePink300,
                foregroundColor: Colors.black,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          AddTeacher(FullName: FullName,
                            ID: ID,
                            UniversityID: UniversityID,
                            Token: Token,))
                  );
                },
                child: Icon(Icons.add),
              ),

              // body: ListView.builder(
              //   itemCount: Teachers_Name.length,
              //   itemBuilder: (BuildContext context, int index){
              //     return Container(
              //       height: 50,
              //       margin: EdgeInsets.all(2),
              //       child: Text(
              //         '${Teachers_ID[index]} (${Teachers_Name[index]}',
              //         style: TextStyle(fontSize: 18, color: Colors.black),
              //       ),
              //     );
              //   },
              // ),

              body: AnimationLimiter(
                child: ListView.builder(
                  padding: EdgeInsets.all(_w / 30),
                  physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemCount: Teachers_Name.length,
                  itemBuilder: (BuildContext context, int index) {
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
                              title: Text('${Teachers_Name[index]}',
                                style: TextStyle(color: Colors.black),),
                              //isThreeLine: true,
                              subtitle: Text('${Teachers_Emails[index]}'),
                              //  leading: Icon(Icons.label),
                              //  trailing: ,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15)),
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

            ),

            ////////////////////////////// Student //////////////////////////////

            Scaffold(
              // appBar: AppBar(
              //   actions: [
              //     IconButton(
              //       onPressed: (){},
              //       icon: Icon(Icons.search),
              //     ),
              //   ],
              // ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: shrinePink300,
                foregroundColor: Colors.black,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          AddStudent(FullName: FullName,
                            ID: ID,
                            UniversityID: UniversityID,
                            Token: Token,))
                  );
                },
                child: Icon(Icons.add),
              ),

              body: AnimationLimiter(
                child: ListView.builder(
                  padding: EdgeInsets.all(_w / 30),
                  physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemCount: Students_Emails.length,
                  itemBuilder: (BuildContext context, int index) {
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
                              title: Text('${Students_Name[index]}',
                                style: TextStyle(color: Colors.black),),
                             // isThreeLine: true,
                              subtitle: Text('${Students_Emails[index]}',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black
                              ),),
                              //  leading: Icon(Icons.label),
                              //  trailing: ,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15)),
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
            ),

            ////////////////////////////// Class //////////////////////////////

            Scaffold(
              // appBar: AppBar(
              //   actions: [
              //     IconButton(
              //       onPressed: (){},
              //       icon: Icon(Icons.search),
              //     ),
              //   ],
              // ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: shrinePink300,
                foregroundColor: Colors.black,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddLesson(ID: "Lesson", UniversityID: UniversityID, FullName: FullName, Token: Token,))
                  );
                },
                child: Icon(Icons.add),
              ),
              body: AnimationLimiter(
                child: ListView.builder(
                  padding: EdgeInsets.all(_w / 30),
                  physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  itemCount: Lessons_Name.length,
                  itemBuilder: (BuildContext context, int index) {
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
                              title: Text('${Lessons_Name[index]}',
                                style: TextStyle(color: Colors.black),),
                              //isThreeLine: true,
                              subtitle: Text('${Teachers_Name[index]}'),
                              //  leading: Icon(Icons.label),
                              //  trailing: ,
                            ),

                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(15)),
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