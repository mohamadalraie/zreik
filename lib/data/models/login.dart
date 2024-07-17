class Login {
  late String emailOrMobile;
  late String password;

  Login({required this.emailOrMobile, required this.password});

  Login.fromJson(Map<String, dynamic> json) {
    emailOrMobile = json['emailOrMobile'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emailOrMobile'] = this.emailOrMobile;
    data['password'] = this.password;
    return data;
  }
}
