class ShowTicket {
  List<Data>? data;
  String? msg;
  int? status;

  ShowTicket({this.data, this.msg, this.status});

  ShowTicket.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}

class Data {
  int? id;
  int? ticketsNum;
  String? firstName;
  String? midName;
  String? lastName;
  int? chairNum;
  bool? isUsed;
  bool? presenceTravellet;
  int? age;
  int? bookingId;

  Data(
      {this.id,
        this.ticketsNum,
        this.firstName,
        this.midName,
        this.lastName,
        this.chairNum,
        this.isUsed,
        this.presenceTravellet,
        this.age,
        this.bookingId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ticketsNum = json['tickets_num'];
    firstName = json['first_name'];
    midName = json['mid_name'];
    lastName = json['last_name'];
    chairNum = json['chair_num'];
    isUsed = json['is_used'];
    presenceTravellet = json['presence_travellet'];
    age = json['age'];
    bookingId = json['Booking_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tickets_num'] = this.ticketsNum;
    data['first_name'] = this.firstName;
    data['mid_name'] = this.midName;
    data['last_name'] = this.lastName;
    data['chair_num'] = this.chairNum;
    data['is_used'] = this.isUsed;
    data['presence_travellet'] = this.presenceTravellet;
    data['age'] = this.age;
    data['Booking_id'] = this.bookingId;
    return data;
  }
}
