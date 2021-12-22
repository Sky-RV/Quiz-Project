import 'package:flutter/material.dart';

import '../AddTest_Page_1.dart';

class QtoQEachTimeclass extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildShrineTheme(),
      title: 'Quiz Project',
      home: QtoQEachTime(),
    );
  }
}

class QtoQEachTime extends StatefulWidget {
  @override
  State<QtoQEachTime> createState() => _QtoQEachTimeState();
}

class _QtoQEachTimeState extends State<QtoQEachTime> {

  @override
  Widget build(BuildContext context) {

    TextEditingController testTimeCNTE = TextEditingController();
    TextEditingController allowedEnterCNTE = TextEditingController();

    List<bool> _valueE = [false, false];

    return Scaffold(

      ////////////////////////////// APP BAR //////////////////////////////
      //
      // appBar: AppBar(
      //   backgroundColor: shrineBlue900,
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.search),
      //     ),
      //   ],
      //   title: Center(
      //     child: Text(
      //       "Add New File",
      //       style: TextStyle(color: Colors.white),
      //       textAlign: TextAlign.center,
      //     ),
      //   ),
      // ),

      ////////////////////////////// BODY //////////////////////////////

      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
                elevation: 5,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,

                child: Column(
                  children: [

                    SizedBox(height: 20,),

                    // exam time
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: SimpleInput(label: "Test time (minute)", cnt: testTimeCNTE),
                    ),

                    SizedBox(height: 15,),

                    // options
                    ListTile(
                      title: Text("Set time for each question",
                        style: TextStyle(color: Colors.black, fontSize: 14),),
                      leading: Checkbox(
                        activeColor: shrineBlue600,
                        value: _valueE[0],
                        onChanged: (value){
                          setState(() {
                            _valueE[0] = value!;
                          });
                        },
                      )
                    ),

                    ListTile(
                        title: Text("Access to questions randomly",
                          style: TextStyle(color: Colors.black, fontSize: 14),),
                        leading: Checkbox(
                          activeColor: shrineBlue600,
                          value: _valueE[1],
                          onChanged: (value){
                            setState(() {
                              _valueE[1] = value!;
                            });
                          },
                        )
                    ),

                    SizedBox(height: 5,),

                    // allowed enter
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: SimpleInput(label: 'Allowed Enter (1-10)', cnt: allowedEnterCNTE),
                    ),

                    SizedBox(height: 50,),

                    // buttons
                    ElevatedButton(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TestPage_1())
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                            color: shrinePink300,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Container(
                          width: 180,
                          height: 35,
                          alignment: Alignment.center,
                          child: Text('Cancel', style:
                          TextStyle(fontSize: 16, color: Colors.white),),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    //  myButton(label: 'Save', color: shrinePink400, act: actCancel()),
                    ElevatedButton(
                      onPressed: (){

                        String time = testTimeCNTE.text;
                        if(!time.isEmpty && _valueE != -1){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => TestPage_1())
                          );
                        }
                        else{
                          // error
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

                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                            color: shrinePink400,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Container(
                          width: 180,
                          height: 35,
                          alignment: Alignment.center,
                          child: Text('Next', style:
                          TextStyle(fontSize: 16, color: Colors.white),),
                        ),
                      ),
                    ),

                    SizedBox(height: 20,)

                  ],
                ),
              )

            ],
          ),
        ),
      ),

    );
  }
}

Widget SimpleInput({label, cnt}) {
  return TextFormField(
    controller: cnt,
    keyboardType: TextInputType.number,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
      labelStyle: TextStyle(color: shrineBlue600),
    ),
  );
}

Widget preIconInput({label, cnt, icon}) {
  return TextFormField(
    controller: cnt,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: shrineBlue600),
        prefixIcon: icon
    ),
  );
}

Widget trailingIconInput({label, cnt, icon}) {
  return TextFormField(
    controller: cnt,
    style: TextStyle(color: Colors.black),
    decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: shrineBlue600),
        suffixIcon: icon
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