class Register {
  String? username;
  String? password;
  String? password2;
  String? email;
  String? firstName;
  String? lastName;

  Register(
      {this.username,
      this.password,
      this.password2,
      this.email,
      this.firstName,
      this.lastName});

  Register.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    password2 = json['password2'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['password2'] = password2;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    return data;
  }
}
