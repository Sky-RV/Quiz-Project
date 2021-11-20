class User {

  late String UniversityName, FirstName, LastName, Username, Password, Email, FullName, Role;

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
}