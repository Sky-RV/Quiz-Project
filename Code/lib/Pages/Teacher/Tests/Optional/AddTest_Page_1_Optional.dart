import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/Pages/Teacher/Tests/Optional/AddTest_Page_2_Optional.dart';

void main() {
  runApp(TestPage_1_Optional());
}

class TestPage_1_Optional extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _buildShrineTheme(),
      title: 'Quiz Project',
      home: TestPage1(),
    );
  }
}

class TestPage1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestPage_1();
}

class _TestPage_1 extends State<TestPage1>{

  TextEditingController testTimeCNT = TextEditingController();
  int _value = -1;

  TextEditingController testTimeCNTA = TextEditingController();
  TextEditingController allowedEnterCNTA = TextEditingController();
  List<bool> _valueA = [false, false];
  int _valA = -1;

  TextEditingController testTimeCNTE = TextEditingController();
  TextEditingController allowedEnterCNTE = TextEditingController();
  List<bool> _valueE = [false, false];

  TextEditingController TestTitleCNT = TextEditingController();
  TextEditingController CourseNameCNT = TextEditingController();
  TextEditingController StartTimeCNT = TextEditingController();
  TextEditingController EndTimeCNT = TextEditingController();

  // CARD 1
  String C1_title = 'Base Information', C1_subtitle = 'Question Type';
  String C1_question1 = 'Pdf', C1_question2 = 'Write by Teacher';
  int C1_value = -1;

  // CARD 2
  String C2_title = 'Test Settings';
  String C2_Op1 = 'Tests have negative score',C2_Op5 = 'Student can see questions and answer after the test done';
  List<bool> C2_list = [false, false];

  // CARD 3
  String C3_title = 'Holding Settings';
  String C3_subtitle = 'Question Type';
  String C3_Op1 = 'Held in the scheduled date and time', C3_Op2 = 'Holding floating',
          C3_Op3 = 'Show question by question and set a time for questions',
          C3_Op4 = 'Show question by question and set a total time for the test';
  int C3_value = -1;

  String UsernameTXT = 'teacher', PasswordTXT = 'teacher';

  // Card 3 Dialogs values
  late String C3_D2_testTime = "";
  late int C3_D2_option = -1;

  late String C3_D3_testTime = "";
  late String C3_D3_allowedEnter = "";
  late int C3_D3_option = -1;
  List<bool> C3_D3_ckeckBox = [];

  late String C3_D4_testTime = "";
  late String C3_D4_allowedEnter = "";
  List<bool> C3_D4_checkBox = [];

  @override
  Widget build(BuildContext context) {

    // CARD 3 DIALOG 1
    final AlertDialog dialog3_2 = AlertDialog(
      title: Text(C3_Op1),
      content: Card(
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
              child: SimpleInput(label: "Test time (minute)", cnt: testTimeCNT),
            ),

            SizedBox(height: 15,),

            // options
            ListTile(
              title: Text("Do NOT stop the timer in case of exit the exam panel.",
                style: TextStyle(color: Colors.black, fontSize: 14),),
              leading: Radio(
                value: 1,
                groupValue: _value,
                activeColor: shrineBlue600,
                onChanged: (value){
                  setState(() {
                    _value = int.parse(value.toString());
                  });
                },
              ),
            ),

            ListTile(
              title: Text("STOP the timer in case of exit the exam panel.",
                style: TextStyle(color: Colors.black, fontSize: 14),),
              leading: Radio(
                value: 2,
                groupValue: _value,
                activeColor: shrineBlue600,
                onChanged: (value){
                  setState(() {
                    _value = int.parse(value.toString());
                  });
                },
              ),
            ),

            SizedBox(height: 50,),

            // buttons
            ElevatedButton(
              onPressed: (){
                String testTime = testTimeCNT.text;
                C3_D2_testTime = testTime;
                C3_D2_option = _value;
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
                  child: Text('Save', style:
                  TextStyle(fontSize: 16, color: Colors.white),),
                ),
              ),
            ),
            SizedBox(height: 25,),

            SizedBox(height: 20,)

          ],
        ),
      )
    );

    final AlertDialog dialog3_3 = AlertDialog(
        title: Text(C3_Op1),
        content: Card(
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
                child: SimpleInput(label: "Test time (minute)", cnt: testTimeCNTA),
              ),

              SizedBox(height: 10,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: SimpleInput(label: 'Allowed Enter (1-10)', cnt: allowedEnterCNTA),
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
                  String time = testTimeCNTA.text;
                  String enter = allowedEnterCNTA.text;

                  C3_D3_testTime = time;
                  C3_D3_allowedEnter = enter;
                  C3_D3_option = _valA;
                  C3_D3_ckeckBox = [_valueA[0], _valueA[1]];
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
                    child: Text('Save', style:
                    TextStyle(fontSize: 16, color: Colors.white),),
                  ),
                ),
              ),

              SizedBox(height: 20,)

            ],
          ),
        )
    );

    final AlertDialog dialog3_4 = AlertDialog(
        title: Text(C3_Op1),
        content: Card(
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
                onPressed: () {
                  String time = testTimeCNTE.text;
                  String alowTime = allowedEnterCNTE.text;

                  C3_D4_testTime = time;
                  C3_D4_allowedEnter = alowTime;
                  C3_D4_checkBox = [_valueE[0], _valueE[1]];
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
    );

    return Scaffold(

      ////////////////////////////// APP BAR //////////////////////////////

      appBar: AppBar(
        backgroundColor: shrineBlue900,
        actions: [
          TextButton(
            onPressed: (){
              // main text inputs
              String testTitle = TestTitleCNT.text;
              String courseName = CourseNameCNT.text;
              String startTime = StartTimeCNT.text;
              String endTime = EndTimeCNT.text;

              // main options input
              int c1_option = C1_value;
              int c3_option = C3_value;

              // main checkbox inputs
              List<bool> c2_checkBox = C2_list;

              // dialogs input
              // dialog 2
              String d2_time = C3_D2_testTime;
              int d2_option = C3_D2_option;

              // dialog 3
              String d3_time = C3_D3_testTime;
              String d3_alw = C3_D3_allowedEnter;
              int d3_option = C3_D3_option;
              List<bool> d3_chbox = C3_D3_ckeckBox;

              // dialog 4
              String d4_time = C3_D4_testTime;
              String d4_alw = C3_D4_allowedEnter;
              List<bool> d4_chbox = C3_D4_checkBox;

              if (!testTitle.isEmpty && !courseName.isEmpty && !startTime.isEmpty && !endTime.isEmpty
                  && c1_option!=-1 && c2_checkBox!=false){
                // card 3 option 1
                if(C3_value == 1){
                  // Exam Server
                  // Pass to Next Page
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddTest_Page_2_Optional())
                  );
                }
                // card 3 option 2
                if(C3_value == 2){
                  if(!d2_time.isEmpty && d2_option!=-1){
                    // Exam Server
                    // Pass to Next Page
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddTest_Page_2_Optional())
                    );
                  }
                }
                // card 3 option 3
                if(C3_value == 3){
                  if(!d3_time.isEmpty && !d3_alw.isEmpty && d3_option!=-1 && d3_chbox!=false){
                    // Exam Server
                    // Pass to Next Page
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddTest_Page_2_Optional())
                    );
                  }
                }
                // card 3 option 4
                if(C3_value == 4){
                  if(!d4_time.isEmpty && !d4_alw.isEmpty && d4_chbox!=false){
                    // Exam Server
                    // Pass to Next Page
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddTest_Page_2_Optional())
                    );
                  }
                }

              }
              else{
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
            child: Text("Next", style: TextStyle(color: Color(0xFFD4CCCA)),),
          )
        ],
        title: Center(
          child: Text(
            'Quiz Project',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),

      ////////////////////////////// BODY //////////////////////////////

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Icon(Icons.class_, color: shrineBlue600,), // replace with specific icon (number 1)
                    Text('Define new test', style: TextStyle(fontSize: 16, color: Colors.black),)

                  ],
                ),

                SizedBox(height: 30,), // card 1
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 5,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,

                  child: Column(
                    children: [

                      Padding( // title
                        padding: EdgeInsets.all(16),
                        child: Text(C1_title,
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            SimpleInput(label: 'Test title', cnt: TestTitleCNT),
                            SizedBox(height: 15,),

                            trailingIconInput(label: 'Course Name', icon: Icon(Icons.arrow_downward), cnt: CourseNameCNT),
                            SizedBox(height: 15,),
                          ],
                        ),
                      ),

                      Text(C1_subtitle,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                      SizedBox(height: 10,),

                      ListTile(
                        title: Text(C1_question1,
                            style: TextStyle(color: Colors.black, fontSize: 14),),
                        leading: Radio(
                          value: 1,
                          groupValue: C1_value,
                          activeColor: shrineBlue600,
                          onChanged: (value){
                            setState(() {
                              C1_value = int.parse(value.toString());
                            });
                          },
                        ),
                      ),

                      ListTile(
                        title: Text(C1_question2,
                          style: TextStyle(color: Colors.black, fontSize: 14),),
                        leading: Radio(
                          value: 2,
                          groupValue: C1_value,
                          activeColor: shrineBlue600,
                          onChanged: (value){
                            setState(() {
                              C1_value = int.parse(value.toString());
                            });
                          },
                        ),
                      ),

                      SizedBox(height: 15,)

                    ],
                  ),
                ),

                SizedBox(height: 15,), // card 2
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 5,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,

                  child: Column(
                    children: [

                      Padding( // title
                        padding: EdgeInsets.all(16),
                        child: Text(C2_title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),),
                      ),

                      SizedBox(height: 10,),
                      ListTile( // check list 1/5
                        title: Text(C2_Op1,
                        style: TextStyle(color: Colors.black, fontSize: 14),),
                        leading: Checkbox(
                          activeColor: shrineBlue600,
                          value: C2_list[0],
                          onChanged: (value){
                            setState(() {
                              C2_list[0] = value!;
                            });
                          },
                        ),
                      ),
                      ListTile( // check list 5/5
                        title: Text(C2_Op5,
                          style: TextStyle(color: Colors.black, fontSize: 14),),
                        leading: Checkbox(
                          activeColor: shrineBlue600,
                          value: C2_list[1],
                          onChanged: (value){
                            setState(() {
                              C2_list[1] = value!;
                            });
                          },
                        ),
                      ),

                      SizedBox(height: 15,)
                    ],
                  ),
                ),

                SizedBox(height: 15,), // card 3
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 5,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,

                  child: Column(
                    children: [

                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(C3_title,
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            preIconInput(label: 'Start Date and Time', icon: Icon(Icons.calendar_today_rounded), cnt: StartTimeCNT),
                            SizedBox(height: 15,),
                            preIconInput(label: 'End Date and Time', icon: Icon(Icons.calendar_today_rounded), cnt: EndTimeCNT),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.all(16),
                        child: Text(C3_subtitle,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),),
                      ),

                      SizedBox(height: 10,),
                      ListTile( // radio 1/4
                        title: Text(C3_Op1,
                        style: TextStyle(color: Colors.black, fontSize: 14),),
                        leading: Radio(
                          value: 1,
                          groupValue: C3_value,
                          activeColor: shrineBlue600,
                          onChanged: (value){
                            setState(() {
                              C3_value = int.parse(value.toString());
                            });
                          },
                        ),
                      ),
                      ListTile( // radio 2/4
                        title: Text(C3_Op2,
                          style: TextStyle(color: Colors.black, fontSize: 14),),
                        trailing: IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: (){
                            showDialog(context: context, builder: (context) => dialog3_2);
                          },
                        ),
                        leading: Radio(
                          value: 2,
                          groupValue: C3_value,
                          activeColor: shrineBlue600,
                          onChanged: (value){
                            setState(() {
                              C3_value = int.parse(value.toString());
                            });
                          },
                        ),
                      ),
                      ListTile( // radio 3/4
                        title: Text(C3_Op3,
                          style: TextStyle(color: Colors.black, fontSize: 14),),
                        trailing: IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: (){
                            showDialog(context: context, builder: (context) => dialog3_3);
                          },
                        ),
                        leading: Radio(
                          value: 3,
                          groupValue: C3_value,
                          activeColor: shrineBlue600,
                          onChanged: (value){
                            setState(() {
                              C3_value = int.parse(value.toString());
                            });
                          },
                        ),
                      ),
                      ListTile( // radio 4/4
                        title: Text(C3_Op4,
                          style: TextStyle(color: Colors.black, fontSize: 14),),
                        trailing: IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: (){
                            showDialog(context: context, builder: (context) => dialog3_4);
                          },
                        ),
                        leading: Radio(
                          value: 4,
                          groupValue: C3_value,
                          activeColor: shrineBlue600,
                          onChanged: (value){
                            setState(() {
                              C3_value = int.parse(value.toString());
                            });
                          },
                        ),
                      ),

                      SizedBox(height: 15,)

                    ],
                  ),
                ),


                // Buttons
                SizedBox(height: 35,),
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => TeacherPanel(USERNAME: UsernameTXT, PASSWORD: PasswordTXT))
                          // );
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
                      ElevatedButton(
                        onPressed: (){
                          // main text inputs
                          String testTitle = TestTitleCNT.text;
                          String courseName = CourseNameCNT.text;
                          String startTime = StartTimeCNT.text;
                          String endTime = EndTimeCNT.text;

                          // main options input
                          int c1_option = C1_value;
                          int c3_option = C3_value;

                          // main checkbox inputs
                          List<bool> c2_checkBox = C2_list;

                          // dialogs input
                          // dialog 2
                          String d2_time = C3_D2_testTime;
                          int d2_option = C3_D2_option;

                          // dialog 3
                          String d3_time = C3_D3_testTime;
                          String d3_alw = C3_D3_allowedEnter;
                          int d3_option = C3_D3_option;
                          List<bool> d3_chbox = C3_D3_ckeckBox;

                          // dialog 4
                          String d4_time = C3_D4_testTime;
                          String d4_alw = C3_D4_allowedEnter;
                          List<bool> d4_chbox = C3_D4_checkBox;

                          if (!testTitle.isEmpty && !courseName.isEmpty && !startTime.isEmpty && !endTime.isEmpty
                              && c1_option!=-1 && c2_checkBox!=false){
                            // card 3 option 1
                            if(C3_value == 1){
                              // Exam Server
                              // Pass to Next Page
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => AddTest_Page_2_Optional())
                              );
                            }
                            // card 3 option 2
                            else if(C3_value == 2 && (!d2_time.isEmpty && d2_option!=-1)){
                                // Exam Server
                                // Pass to Next Page
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AddTest_Page_2_Optional())
                                );
                            }
                            // card 3 option 3
                            else if(C3_value == 3 && (!d3_time.isEmpty && !d3_alw.isEmpty && d3_option!=-1 && d3_chbox!=false)){
                                // Exam Server
                                // Pass to Next Page
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AddTest_Page_2_Optional())
                                );
                            }
                            // card 3 option 4
                            else if(C3_value == 4 && (!d4_time.isEmpty && !d4_alw.isEmpty && d4_chbox!=false)){
                                // Exam Server
                                // Pass to Next Page
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AddTest_Page_2_Optional())
                                );
                            }

                          }
                          else{
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
                ),

                SizedBox(height: 20,),

              ],
            ),
          ),
        ),
      ),

    );
  }

}


Widget SimpleInput({label, cnt}) {
  return TextFormField(
    controller: cnt,
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