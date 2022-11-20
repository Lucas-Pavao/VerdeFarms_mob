import 'dart:convert';

User userFromJason(String str) => User.fromJson(jsonDecode(str));
String userToJason(User data) => json.encode(data.toJson());

class User {
//   {
//     "first_name": "",
//     "last_name": "",
//     "username": "",
//     "email": ""
// }

  final String? first_name;
  final String? last_name;
  final String? username;
  final String? email;
  User({
    this.first_name,
    this.last_name,
    this.username,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'first_name': first_name,
      'last_name': last_name,
      'username': username,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      first_name:
          map['first_name'] != null ? map['first_name'] as String : null,
      last_name: map['last_name'] != null ? map['last_name'] as String : null,
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
