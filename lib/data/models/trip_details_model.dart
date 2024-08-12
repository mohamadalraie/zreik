class TripDetailsModel {
  Data? data;
  String? msg;
  int? status;

  TripDetailsModel({this.data, this.msg, this.status});

  TripDetailsModel.fromJson(Map<String, dynamic> json) {
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
  List<TripDetails>? tripDetails;
  List<int>? unavailableChair;

  Data({this.tripDetails, this.unavailableChair});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['tripDetails'] != null) {
      tripDetails = <TripDetails>[];
      json['tripDetails'].forEach((v) {
        tripDetails!.add(new TripDetails.fromJson(v));
      });
    }
    unavailableChair = json['unavailable_chair'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tripDetails != null) {
      data['tripDetails'] = this.tripDetails!.map((v) => v.toJson()).toList();
    }
    data['unavailable_chair'] = this.unavailableChair;
    return data;
  }
}

class TripDetails {
  int? availableChair;
  int? busId;
  int? driverId;
  Bus? bus;
  Driver? driver;

  TripDetails(
      {this.availableChair, this.busId, this.driverId, this.bus, this.driver});

  TripDetails.fromJson(Map<String, dynamic> json) {
    availableChair = json['available_chair'];
    busId = json['Bus_id'];
    driverId = json['Driver_id'];
    bus = json['bus'] != null ? new Bus.fromJson(json['bus']) : null;
    driver =
        json['driver'] != null ? new Driver.fromJson(json['driver']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['available_chair'] = this.availableChair;
    data['Bus_id'] = this.busId;
    data['Driver_id'] = this.driverId;
    if (this.bus != null) {
      data['bus'] = this.bus!.toJson();
    }
    if (this.driver != null) {
      data['driver'] = this.driver!.toJson();
    }
    return data;
  }
}

class Bus {
  int? id;
  String? busName;
  String? model;
  int? busNumber;
  int? chairCount;
  String? formType;

  Bus(
      {this.id,
      this.busName,
      this.model,
      this.busNumber,
      this.chairCount,
      this.formType});

  Bus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    busName = json['bus_name'];
    model = json['model'];
    busNumber = json['bus_number'];
    chairCount = json['chair_count'];
    formType = json['form_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bus_name'] = this.busName;
    data['model'] = this.model;
    data['bus_number'] = this.busNumber;
    data['chair_count'] = this.chairCount;
    data['form_type'] = this.formType;
    return data;
  }
}

class Driver {
  int? id;
  String? fname;
  String? lname;

  Driver({this.id, this.fname, this.lname});

  Driver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['Fname'];
    lname = json['Lname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Fname'] = this.fname;
    data['Lname'] = this.lname;
    return data;
  }
}
