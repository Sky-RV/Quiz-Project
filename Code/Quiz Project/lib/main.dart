import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildShrineTheme(),
      title: 'Quiz Project',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              title: Text("بانک سوال و آزمون"),
              leading: Icon(Icons.account_balance_sharp),
            ),

            const ListTile(
              title: Text("آزمون آنلاین"),
              leading: Icon(Icons.alarm_on_outlined),
            ),

            const ListTile(
              title: Text("آزمون های ویژه دانش آموزی"),
              leading: Icon(Icons.account_circle),
            ),

            const ListTile(
              title: Text("پیام رسان"),
              leading: Icon(Icons.share),
            ),

            const ListTile(
              title: Text("کلاس آنلاین"),
              leading: Icon(Icons.class__sharp),
            ),

            const ListTile(
              title: Text("تکلیف آنلاین"),
              leading: Icon(Icons.book_online_sharp),
            ),

            const ListTile(
              title: Text("دفتر کلاسی"),
              leading: Icon(Icons.note),
            ),

            const ListTile(
              title: Text("فیلم آموزشی"),
              leading: Icon(Icons.movie_creation_outlined),
            ),

          ],
        ),
      ),

      //////////////////////////////////// APP BAR //////////////////////////////

      appBar: AppBar(
        title: const Center(
          child: Text("Quiz Project", style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
        ),
        backgroundColor: Color(0xFF363671),
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

