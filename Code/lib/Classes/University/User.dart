class User {

  late String UniversityName, FirstName, LastName, Username, Password, Email, FullName, Role;

  // User ({
  //   // this.UniversityName,
  //   required this.FullName,
  //   required this.Username,
  //   required this.Password,
  //   required this.Email,
  //   required this.Role
  // });

  User (
    // this.UniversityName,
     this.FullName,
     this.Username,
     this.Password,
     this.Email,
     this.Role
  );

  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //       FullName: json['fullName'],
  //       Username: json['username'],
  //       Password: json['password'],
  //       Email: json['email'],
  //       Role: json['role'],
  //   );
  // }
  //
  // factory User.fromJson(Map<String, dynamic> json) => User(
  //   FullName: json["fullname"],
  //   Username: json["username"],
  //   Password: json["password"],
  //   Email: json["email"],
  //   Role: json["role"]
  // );

  Map<String, dynamic> toJson() =>
      {
        "fullName": FullName,
        "username": Username,
        "password": Password,
        "email": Email,
        "role": Role
      };
}