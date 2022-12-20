import 'dart:convert';

class User {
  late int? id;
  final String? first_name;
  final String? last_name;
  final String? username;
  final String? email;

  User({
    this.id,
    this.first_name,
    this.last_name,
    this.username,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      username: json['username'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': first_name,
        'last_name': last_name,
        'username': username,
        'email': email,
      };

  @override
  String toString() {
    return 'User{id: $id, first_name: $first_name, last_name: $last_name, username: $username, email: $email}';
  }

  User copyWith({
    int? id,
    String? first_name,
    String? last_name,
    String? username,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      username: username ?? this.username,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'username': username,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      first_name: map['first_name'],
      last_name: map['last_name'],
      username: map['username'],
      email: map['email'],
    );
  }

  String toJsonString() => json.encode(toMap());

  factory User.fromJsonString(String source) =>
      User.fromMap(json.decode(source));
}
