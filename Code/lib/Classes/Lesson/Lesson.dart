import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz/Pages/University/LessonManagement/StudentList.dart';

class Lesson {

  late String LessonId;
  late String Name;
  late List<String> StudentdID;

  Lesson({required this.Name, StudentID, LessonID});

  factory Lesson.fromJson(Map<String, dynamic> json){
    return Lesson(
      Name: json['name'],
      LessonID: json['profId'],
      StudentID: json['studentIds']
    );
  }
  
  // sending data to server

  Future<Lesson> createLesson(Lesson lesson) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/api/v1/course/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': lesson.Name,
        'profId': lesson.LessonId,
        'studentIds': lesson.StudentdID.toString()
      })
    );

    if (response.statusCode == "success") {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Lesson.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create university.' + response.body + "id : " + getID(response.body));
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
}