import 'dart:convert';

import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;

class University {

  late String UniId;
  late String Name;
  late String Address;

  University({required this.Name, required this.Address, UniId});

  factory University.fromJson(Map<String, dynamic> json){
    return University(
      Name: json['name'],
      Address: json['address'],
      UniId: json['id']
    );
  }

  // Sending data to server

  Future<University> createUniversity(University uni) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/api/v1/university/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': uni.Name,
        'address': uni.Address
      }),
    );

    return University.fromJson(jsonDecode(response.body));

    //   if (response.statusCode == "success") {
    //     // If the server did return a 201 CREATED response,
    //     // then parse the JSON.
    //     return University.fromJson(jsonDecode(response.body));
    //   } else {
    //     // If the server did not return a 201 CREATED response,
    //     // then throw an exception.
    //     throw Exception('Failed to create university.' + response.body);
    //   }
    // }
  }

}