class BookATripRequestModel {
  List<Passengers>? passengers;
  String? stripeToken;

  BookATripRequestModel({this.passengers, this.stripeToken});

  BookATripRequestModel.fromJson(Map<String, dynamic> json) {
    if (json['passengers'] != null) {
      passengers = <Passengers>[];
      json['passengers'].forEach((v) {
        passengers!.add(new Passengers.fromJson(v));
      });
    }
    stripeToken = json['stripeToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.passengers != null) {
      data['passengers'] = this.passengers!.map((v) => v.toJson()).toList();
    }
    data['stripeToken'] = this.stripeToken;
    return data;
  }
}

class Passengers {
  String? firstName;
  String? midName;
  String? lastName;
  String? age;
  String? chairNum;

  Passengers(
      {this.firstName, this.midName, this.lastName, this.age, this.chairNum});

  Passengers.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    midName = json['mid_name'];
    lastName = json['last_name'];
    age = json['age'];
    chairNum = json['chair_num'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['mid_name'] = this.midName;
    data['last_name'] = this.lastName;
    data['age'] = this.age;
    data['chair_num'] = this.chairNum;
    return data;
  }
}

class BookATripResponseModel {
  int? data;
  String? msg;
  int? status;

  BookATripResponseModel({this.data, this.msg, this.status});

  BookATripResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}
