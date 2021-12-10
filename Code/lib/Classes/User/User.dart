import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class User{

  late String ID;
  late String UniId;
  late String FullName;
  late String Password;
  late String Username;
  late String Email;
  late String Role;

  User({
    UniId,
    FullName,
    Password,
    Username,
    Email,
    Role
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
        UniId: json['uniId'],
        FullName: json['fullName'],
        Password: json['password'],
        Username: json['username'],
        Email: json['email'],
        Role: json['role']
    );
  }

  // Sending data to server
  Future<User> createAdmin(User user) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/api/v1/user/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'uniId': user.UniId,
        'fullName': user.FullName,
        'password': user.Password,
        'username': user.Username,
        'email': user.Email,
        'role': user.Role
      }),
    );

    if (response.statusCode == "success") {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create admin.');
    }
  }

  // Getting data from server for log in
  Future<User> logInUser(String username, String password) async{

    String url = "http://localhost:3000/api/v1/auth/login";

    final response = await http.post(Uri.parse(url), body: {
      'username': username,
      'password': password,
    });

    if (response.statusCode == "success") {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return User.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create admin.');
    }

  }

  // Getting user details
  // Future<ApiResponse> getUser(String userID) async {
  //
  //   String url = "http://localhost:3000/api/v1/user/getUserById/2";
  //
  //   ApiResponse _apiResponse = ApiResponse();
  //
  //   try {
  //     final response = await http.get(Uri.parse(url));
  //
  //     switch (response.statusCode) {
  //       case 200:
  //         _apiResponse.Data = User.fromJson(json.decode(response.body));
  //         break;
  //       case 401:
  //         print((_apiResponse.ApiError as ApiError).error);
  //         _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
  //         break;
  //       default:
  //         print((_apiResponse.ApiError as ApiError).error);
  //         _apiResponse.ApiError = ApiError.fromJson(json.decode(response.body));
  //         break;
  //     }
  //   }
  //   on SocketException{
  //     _apiResponse.ApiError = ApiError(error: "Server error. Please retry");
  //   }
  //
  //   return _apiResponse;
  //
  // }

}