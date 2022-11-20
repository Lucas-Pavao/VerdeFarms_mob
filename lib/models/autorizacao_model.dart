import 'dart:convert';

AuthResponse authResponseFromJason(String str) =>
    AuthResponse.fromJson(jsonDecode(str));
String authResponseToJason(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  final String? refresh;
  final String? access;
  AuthResponse({
    this.refresh,
    this.access,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'refresh': refresh,
      'access': access,
    };
  }

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    return AuthResponse(
      refresh: map['refresh'] != null ? map['refresh'] as String : null,
      access: map['access'] != null ? map['access'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromJson(String source) =>
      AuthResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
