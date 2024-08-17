class MyTripModel {
  List<Data>? data;
  String? msg;
  int? status;

  MyTripModel({this.data, this.msg, this.status});

  MyTripModel.fromJson(Map<String, dynamic> json) {
    data = (json['data'] as List?)
        ?.map((item) => Data.fromJson(item as Map<String, dynamic>))
        .toList();

    msg = json['msg'] ?? 'No message';
    status = json['status'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((item) => item.toJson()).toList(),
      'msg': msg,
      'status': status,
    };
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

  Data({
    this.id,
    this.userId,
    this.managerId,
    this.dateOfBooking,
    this.tripId,
    this.bookingType,
    this.branchId,
    this.chargeId,
    this.trip,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    userId = json['User_id'] ?? 0;
    managerId = json['Manager_id'] as int? ?? 0;
    dateOfBooking = json['date_of_booking'] ?? 'N/A';
    tripId = json['Trip_id'] ?? 0;
    bookingType = json['booking_type'] ?? 'Unknown';
    branchId = json['Branch_id'] ?? 0;
    chargeId = json['charge_id'] ?? 'N/A';
    trip = json['trip'] != null ? Trip.fromJson(json['trip']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'User_id': userId,
      'Manager_id': managerId,
      'date_of_booking': dateOfBooking,
      'Trip_id': tripId,
      'booking_type': bookingType,
      'Branch_id': branchId,
      'charge_id': chargeId,
      'trip': trip?.toJson(),
    };
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

  Trip({
    this.id,
    this.tripNum,
    this.date,
    this.startTrip,
    this.endTrip,
    this.busId,
    this.tripType,
    this.fromToId,
    this.status,
    this.fromTo,
  });

  Trip.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    tripNum = json['trip_num'] ?? 0;
    date = json['date'] ?? 'N/A';
    startTrip = json['start_trip'] ?? 'N/A';
    endTrip = json['end_trip'] ?? 'N/A';
    busId = json['Bus_id'] ?? 0;
    tripType = json['trip_type'] ?? 'Unknown';
    fromToId = json['From_To_id'] ?? 0;
    status = json['status'] ?? 'Unknown';
    fromTo = json['from_to'] != null ? FromTo.fromJson(json['from_to']) : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'trip_num': tripNum,
      'date': date,
      'start_trip': startTrip,
      'end_trip': endTrip,
      'Bus_id': busId,
      'trip_type': tripType,
      'From_To_id': fromToId,
      'status': status,
      'from_to': fromTo?.toJson(),
    };
  }
}

class FromTo {
  int? id;
  String? source;
  String? destination;

  FromTo({this.id, this.source, this.destination});

  FromTo.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    source = json['source'] ?? 'Unknown';
    destination = json['destination'] ?? 'Unknown';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'source': source,
      'destination': destination,
    };
  }
}
