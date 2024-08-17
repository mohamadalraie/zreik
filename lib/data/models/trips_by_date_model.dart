class TripsByDateModel {
  List<Trip>? data;
  String? msg;
  int? status;

  TripsByDateModel({this.data, this.msg, this.status});

  TripsByDateModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != 'null' && json['data'] != null) {
      data = <Trip>[];
      json['data'].forEach((v) {
        data!.add(new Trip.fromJson(v));
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

class Trip {
  int? id;
  int? cost;
  String? date;
  String? startTrip;
  String? endTrip;
  int? fromToId;
  int? busId;
  FromTo? fromTo;
  Bus? bus;

  Trip(
      {this.id,
      this.cost,
      this.date,
      this.startTrip,
      this.endTrip,
      this.fromToId,
      this.busId,
      this.fromTo,
      this.bus});

  Trip.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cost = json['cost'];
    date = json['date'];
    startTrip = json['start_trip'];
    endTrip = json['end_trip'];
    fromToId = json['From_To_id'];
    busId = json['Bus_id'];
    fromTo =
        json['from_to'] != null ? new FromTo.fromJson(json['from_to']) : null;
    bus = json['bus'] != null ? new Bus.fromJson(json['bus']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cost'] = this.cost;
    data['date'] = this.date;
    data['start_trip'] = this.startTrip;
    data['end_trip'] = this.endTrip;
    data['From_To_id'] = this.fromToId;
    data['Bus_id'] = this.busId;
    if (this.fromTo != null) {
      data['from_to'] = this.fromTo!.toJson();
    }
    if (this.bus != null) {
      data['bus'] = this.bus!.toJson();
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

class Bus {
  int? id;
  String? type;

  Bus({this.id, this.type});

  Bus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    return data;
  }
}
