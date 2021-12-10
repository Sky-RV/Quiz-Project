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

      if (response.statusCode == "success") {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.
        return University.fromJson(jsonDecode(response.body));
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