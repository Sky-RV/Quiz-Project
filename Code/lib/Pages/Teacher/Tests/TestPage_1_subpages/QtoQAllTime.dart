import 'package:flutter/material.dart';

import '../AddTest_Page_1.dart';

class QtoQAllTimeclass extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildShrineTheme(),
      title: 'Quiz Project',
      home: QtoQAllTime(),
    );
  }
}

class QtoQAllTime extends StatefulWidget {
  @override
  State<QtoQAllTime> createState() => _QtoQAllTimeState();
}

class _QtoQAllTimeState extends State<QtoQAllTime> {

  @override
  Widget build(BuildContext context) {

    TextEditingController testTimeCNTA = TextEditingController();
    TextEditingController allowedEnterCNT = TextEditingController();

    List<bool> _valueA = [false, false];
    int _valA = -1;

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

                    // exam time
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: SimpleInput(label: "Test time (minute)", cnt: testTimeCNTA),
                    ),

                    SizedBox(height: 10,),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: SimpleInput(label: 'Allowed Enter (1-10)', cnt: allowedEnterCNT),
                    ),

                    SizedBox(height: 15,),

                    // options
                    ListTile(
                        title: Text("Access to questions randomly",
                          style: TextStyle(color: Colors.black, fontSize: 14),),
                        leading: Checkbox(
                          activeColor: shrineBlue600,
                          value: _valueA[0],
                          onChanged: (value){
                            setState(() {
                              _valueA[0] = value!;
                            });
                          },
                        )
                    ),

                    ListTile(
                        title: Text("Access to to last questions",
                          style: TextStyle(color: Colors.black, fontSize: 14),),
                        leading: Checkbox(
                          activeColor: shrineBlue600,
                          value: _valueA[1],
                          onChanged: (value){
                            setState(() {
                              _valueA[1] = value!;
                            });
                          },
                        )
                    ),

                    SizedBox(height: 15,),

                    ListTile(
                      title: Text("Do NOT stop the timer in case of exit the exam panel.",
                        style: TextStyle(color: Colors.black, fontSize: 14),),
                      leading: Radio(
                        value: 1,
                        groupValue: _valA,
                        activeColor: shrineBlue600,
                        onChanged: (value){
                          setState(() {
                            _valA = int.parse(value.toString());
                          });
                        },
                      ),
                    ),

                    ListTile(
                      title: Text("STOP the timer in case of exit the exam panel.",
                        style: TextStyle(color: Colors.black, fontSize: 14),),
                      leading: Radio(
                        value: 2,
                        groupValue: _valA,
                        activeColor: shrineBlue600,
                        onChanged: (value){
                          setState(() {
                            _valA = int.parse(value.toString());
                          });
                        },
                      ),
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
                    SizedBox(width: 90,),
                    //  myButton(label: 'Save', color: shrinePink400, act: actCancel()),
                    ElevatedButton(
                      onPressed: (){

                        String time = testTimeCNTA.text;
                        String enter = allowedEnterCNT.text;

                        if(!time.isEmpty && _valA != -1 && !enter.isEmpty && _valueA == false){
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
                    )

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