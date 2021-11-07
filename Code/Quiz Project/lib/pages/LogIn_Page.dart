import 'package:flutter/material.dart';
import 'package:quiz/pages/SignIn_Page.dart';
import 'package:flutter/cupertino.dart';

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
  int _counterIndex = 0;

  @override
  Widget build(BuildContext context) {

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(

      ////////////////////////////////// MENU BAR /////////////////////////////////

      drawer: Drawer(
        child: ListView(
          children: <Widget>[

            UserAccountsDrawerHeader(
              accountName: const Text("Name", style: TextStyle(fontSize: 20),),
              accountEmail: const Text("Number", style: TextStyle(fontSize: 14),),
              onDetailsPressed: () {
                // Fluttertoast.showToast(
                //   msg: "This is a Long Toast",
                //   toastLength: Toast.LENGTH_LONG
                // );
              },
              arrowColor: Colors.black,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xFF363671),
                        Color(0xFF3E5196),
                        Color(0xFF4E65B8),
                      ]
                  )
              ),
            ),

            const ListTile(
              title: Text("Question Bank", style: TextStyle(color: Colors.black)),
              leading: Icon(Icons.account_balance_sharp),
            ),

            const ListTile(
              title: Text("Online Test", style: TextStyle(color: Colors.black)),
              leading: Icon(Icons.alarm_on_outlined),
            ),

            const ListTile(
              title: Text("Special Student Exams", style: TextStyle(color: Colors.black)),
              leading: Icon(Icons.account_circle),
            ),

            const ListTile(
              title: Text("Share", style: TextStyle(color: Colors.black)),
              leading: Icon(Icons.share),
            ),

            const ListTile(
              title: Text("Online Class", style: TextStyle(color: Colors.black)),
              leading: Icon(Icons.class__sharp),
            ),

            const ListTile(
              title: Text("Online Homework", style: TextStyle(color: Colors.black)),
              leading: Icon(Icons.book_online_sharp),
            ),

            const ListTile(
              title: Text("Notebook Class", style: TextStyle(color: Colors.black)),
              leading: Icon(Icons.note),
            ),

            const ListTile(
              title: Text("Tutorial Movies", style: TextStyle(color: Colors.black),),
              leading: Icon(Icons.movie_creation_outlined),
            ),

          ],
        ),
      ),

      //////////////////////////////////// APP BAR //////////////////////////////

      appBar: AppBar(
        title: Center(
          child: Text("Quiz Project", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
        ),
        backgroundColor: Color(0xFF363671),
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
                    Column(
                      children: [
                        SizedBox(height: 20,),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.asset('flutter_assets/images/pic3.png', height: 100, width: 100,),
                        ),
                        SizedBox(height: 20,),
                        Text("Log In", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),),
                        SizedBox(height: 150,),
                      ],
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: Column(

                        // Inputs
                        children: [
                          UsernameInput(label: 'Username'),
                          SizedBox(height: 40,),

                          PasswordInput(label: 'Password'),
                          SizedBox(height: 5,),
                        ],

                      ),
                    ),

                    SizedBox(height: 5,),

                    TextButton(
                      onPressed: (){},
                      child: Text('Forget Password?', style: TextStyle(fontSize: 13, color: Color(0xFFFF0000), fontWeight: FontWeight.bold),),
                    ),

                    SizedBox(height: 100,),

                    //Log In button
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
                            child: Text('Sign In', style: TextStyle(fontSize: 13, color: Colors.white),),
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

      /////////////////////////// BOTTOM NAVIGATION BAR ///////////////////////////

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _counterIndex,
        backgroundColor: colorScheme.surface,

        selectedItemColor: Color(0xFFEE537C),
        unselectedItemColor: colorScheme.onSurface.withOpacity(.60),

        selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,

        onTap: (value) {
          // Respond to item press
          setState(() {
            _counterIndex = value;
          });
          // if (value == 1){
          //   Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => LogIn_Page())
          //   );
          // }
        },

        items: const [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label: 'Account',
              icon: Icon(Icons.account_circle)
          ),
          BottomNavigationBarItem(
              label: 'Access',
              icon: Icon(Icons.book)
          ),
        ],
      ),

    );
  }
}

Widget UsernameInput({label}){
  return TextFormField(
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
        hintText: label,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Color(0xFF3E5196)),
        prefixIcon: Icon(Icons.account_circle)
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
        hintText: label,
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

