// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

Register registerFromJason(String str) => Register.fromJson(jsonDecode(str));
String registerToJason(Register data) => json.encode(data.toJson());

class Register {
  final String? username;
  final String? password;
  final String? password2;
  final String? email;
  final String? first_name;
  final String? last_name;
  Register({
    this.username,
    this.password,
    this.password2,
    this.email,
    this.first_name,
    this.last_name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'password': password,
      'password2': password2,
      'email': email,
      'first_name': first_name,
      'last_name': last_name,
    };
  }

  factory Register.fromMap(Map<String, dynamic> map) {
    return Register(
      username: map['username'] != null ? map['username'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      password2: map['password2'] != null ? map['password2'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      first_name:
          map['first_name'] != null ? map['first_name'] as String : null,
      last_name: map['last_name'] != null ? map['last_name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Register.fromJson(String source) =>
      Register.fromMap(json.decode(source) as Map<String, dynamic>);
}
