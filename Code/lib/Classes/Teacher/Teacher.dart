import 'dart:convert';

import 'package:http/http.dart' as http;

class Teacher{

  late String ID;
  late String UniId;
  late String FullName;
  late String Password;
  late String Username;
  late String Email;
  late String Role;

  Teacher({
    required this.UniId,
    required this.FullName,
    required this.Password,
    required this.Username,
    required this.Email,
    required this.Role
  });

  factory Teacher.fromJson(Map<String, dynamic> json){
    return Teacher(
        UniId: json['uniId'],
        FullName: json['fullName'],
        Password: json['password'],
        Username: json['username'],
        Email: json['email'],
        Role: json['role']
    );
  }

  // Sending data to server

  Future<Teacher> createAdmin(Teacher admin) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/api/v1/user/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'uniId': admin.UniId,
        'fullName': admin.FullName,
        'password': admin.Password,
        'username': admin.Username,
        'email': admin.Email,
        'role': admin.Role
      }),
    );

    if (response.statusCode == "success") {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Teacher.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create admin.');
    }
  }

}