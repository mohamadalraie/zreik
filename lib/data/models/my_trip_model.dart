class MyTripModel {
  List<Data>? data;
  String? msg;
  int? status;

  MyTripModel({this.data, this.msg, this.status});

  MyTripModel.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  int? managerId;
  String? dateOfBooking;
  int? tripId;
  String? bookingType;
  int? branchId;
  String? chargeId;
  Trip? trip;

  Data(
      {this.id,
        this.userId,
        this.managerId,
        this.dateOfBooking,
        this.tripId,
        this.bookingType,
        this.branchId,
        this.chargeId,
        this.trip});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['User_id'];
    managerId = json['Manager_id'];
    dateOfBooking = json['date_of_booking'];
    tripId = json['Trip_id'];
    bookingType = json['booking_type'];
    branchId = json['Branch_id'];
    chargeId = json['charge_id'];
    trip = json['trip'] != null ? new Trip.fromJson(json['trip']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['User_id'] = this.userId;
    data['Manager_id'] = this.managerId;
    data['date_of_booking'] = this.dateOfBooking;
    data['Trip_id'] = this.tripId;
    data['booking_type'] = this.bookingType;
    data['Branch_id'] = this.branchId;
    data['charge_id'] = this.chargeId;
    if (this.trip != null) {
      data['trip'] = this.trip!.toJson();
    }
    return data;
  }
}

class Trip {
  int? id;
  int? tripNum;
  String? date;
  String? startTrip;
  String? endTrip;
  int? busId;
  String? tripType;
  int? fromToId;
  String? status;
  FromTo? fromTo;

  Trip(
      {this.id,
        this.tripNum,
        this.date,
        this.startTrip,
        this.endTrip,
        this.busId,
        this.tripType,
        this.fromToId,
        this.status,
        this.fromTo});

  Trip.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tripNum = json['trip_num'];
    date = json['date'];
    startTrip = json['start_trip'];
    endTrip = json['end_trip'];
    busId = json['Bus_id'];
    tripType = json['trip_type'];
    fromToId = json['From_To_id'];
    status = json['status'];
    fromTo =
    json['from_to'] != null ? new FromTo.fromJson(json['from_to']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['trip_num'] = this.tripNum;
    data['date'] = this.date;
    data['start_trip'] = this.startTrip;
    data['end_trip'] = this.endTrip;
    data['Bus_id'] = this.busId;
    data['trip_type'] = this.tripType;
    data['From_To_id'] = this.fromToId;
    data['status'] = this.status;
    if (this.fromTo != null) {
      data['from_to'] = this.fromTo!.toJson();
    }
    return data;
  }
}

class FromTo {
  int? id;
  String? source;
  String? destination;

  FromTo({this.id, this.source, this.destination});

  FromTo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    source = json['source'];
    destination = json['destination'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['source'] = this.source;
    data['destination'] = this.destination;
    return data;
  }
}
