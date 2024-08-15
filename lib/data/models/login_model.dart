class LoginRequestModel {
  String? email;
  String? password;

  LoginRequestModel({this.email, this.password});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

class LoginResponseModel {
  Data? data;
  String? msg;
  int? status;

  LoginResponseModel({this.data, this.msg, this.status});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? fname;
  String? mname;
  String? lname;
  String? email;
  String? birthday;
  String? phoneNumber;
  String? address;
  int? nationalNumber;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.fname,
      this.mname,
      this.lname,
      this.email,
      this.birthday,
      this.phoneNumber,
      this.address,
      this.nationalNumber,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['Fname'];
    mname = json['Mname'];
    lname = json['Lname'];
    email = json['email'];
    birthday = json['birthday'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    nationalNumber = json['National_Number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Fname'] = this.fname;
    data['Mname'] = this.mname;
    data['Lname'] = this.lname;
    data['email'] = this.email;
    data['birthday'] = this.birthday;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['National_Number'] = this.nationalNumber;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
