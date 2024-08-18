class UpdateProfileModel {
  Data? data;
  String? msg;
  int? status;

  UpdateProfileModel({this.data, this.msg, this.status});

  UpdateProfileModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? fname;
  String? mname;
  String? lname;
  String? email;
  String? birthday;
  String? phoneNumber;
  String? address;
  int? nationalNumber;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.fname,
        this.mname,
        this.lname,
        this.email,
        this.birthday,
        this.phoneNumber,
        this.address,
        this.nationalNumber,
        this.emailVerifiedAt,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['Fname'];
    mname = json['Mname'];
    lname = json['Lname'];
    email = json['email'];
    birthday = json['birthday'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    nationalNumber = json['National_Number'];
    emailVerifiedAt = json['email_verified_at'];
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
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
