import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:quiz/Pages/Teacher/TeacherProfile.dart';
import 'package:quiz/Pages/Teacher/Tests/Descriptive/AddTest_Page_2.dart';
import 'package:quiz/Pages/Teacher/Tests/Descriptive/Add_NewFile.dart';
import '../../../../main.dart';
import '../../TeacherPanel.dart';

class EditNewFile_Page extends StatefulWidget {

  late String FileTitle, FileType, FileTime, FileDescription, File;
  EditNewFile_Page ({Key? key,
    required this.FileTitle,
    required this.FileType,
    required this.FileTime,
    required this.FileDescription,
    required this.File
  }) : super(key: key);

  @override
  _EditNewFileState createState() => _EditNewFileState();
}

class _EditNewFileState extends State<EditNewFile_Page> {

  String? selectedValue = null;
  final _dropdownFormKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Questions"),value: "Questions"),
      DropdownMenuItem(child: Text("Answers"),value: "Answers"),
    ];
    return menuItems;
  }

  TextEditingController FileTitleCNT = TextEditingController();
  TextEditingController FileTypeCNT = TextEditingController();
  TextEditingController FileTimeCNT = TextEditingController();
  TextEditingController FileDescriptionCNT = TextEditingController();
  TextEditingController FileCNT = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      ////////////////////////////// APP BAR //////////////////////////////

      appBar: AppBar(
        backgroundColor: shrineBlue900,
        title: Center(
          child: Text(
            "Quiz Project",
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),

      ////////////////////////////// BODY //////////////////////////////

      body: Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          elevation: 5,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,

          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(height: 50,),
                  Text("Add Test File Question", style: TextStyle(fontSize: 26,
                      fontWeight: FontWeight.bold, color: shrineBlue600),),
                  SizedBox(height: 50,)
                ],
              ),

              SizedBox(height: 20,),

              // Inputs
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  children: [

                    // file title
                    TextFormField(
                      initialValue: widget.FileTitle.toString(),
                      controller: FileTitleCNT,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'File Title',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Color(0xFF3E5196)),
                      ),
                    ),

                    SizedBox(height: 15,),

                    // file type
                    DropdownButtonFormField(
                        value: selectedValue,
                        hint: Text(widget.FileType.toString(), style: TextStyle(color: Colors.black),),
                        style: TextStyle(color: Colors.black),
                        onChanged: (String? newValue){
                          setState(() {
                            selectedValue = newValue!;
                          });
                        },
                        items: dropdownItems
                    ),

                    SizedBox(height: 30,),

                    // show time (minute)
                    TextFormField(
                      initialValue: widget.FileTime.toString(),
                      controller: FileTimeCNT,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.timer),
                        labelText: 'Show Time (Minute)',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Color(0xFF3E5196)),
                      ),
                    ),

                    SizedBox(height: 20,),

                    // description
                    TextFormField(
                      initialValue: widget.FileDescription.toString(),
                      controller: FileDescriptionCNT,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Description',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Color(0xFF3E5196)),
                      ),
                    ),

                    SizedBox(height: 20,),

                    // upload file
                    TextFormField(
                      initialValue: widget.File.toString(),
                      controller: FileCNT,
                      keyboardType: TextInputType.multiline,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        labelText: 'Upload File',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Color(0xFF3E5196)),
                      ),
                    ),

                    SizedBox(height: 15,),

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
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddTest_Page_2())
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
                          width: 150,
                          height: 35,
                          alignment: Alignment.center,
                          child: Text('Cancel', style:
                          TextStyle(fontSize: 16, color: Colors.white),),
                        ),
                      ),
                    ),
                    SizedBox(width: 70,),
                    ElevatedButton(
                      onPressed: (){
                        String fileTitle = FileTitleCNT.text;
                        String filtType = selectedValue.toString();
                        String fileTime = FileTimeCNT.text;
                        String fileDesc = FileDescriptionCNT.text;
                        String file = FileCNT.text;

                        if(fileTitle.isEmpty || fileTime.isEmpty || selectedValue==null){
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
                          // server
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddTest_Page_2())
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
                          width: 150,
                          height: 35,
                          alignment: Alignment.center,
                          child: Text('Save', style:
                          TextStyle(fontSize: 16, color: Colors.white),),
                        ),
                      ),
                    )
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