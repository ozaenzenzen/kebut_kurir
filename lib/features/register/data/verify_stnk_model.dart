class VerifyStnkBodyModel {
  String? uuidTransportationTypes;
  String? uuidVehicleOwnershipsUser;
  String? merk;
  String? type;
  String? platNumber;
  String? yearVehicles;
  String? dateVehicles;

  VerifyStnkBodyModel({
    this.uuidTransportationTypes,
    this.uuidVehicleOwnershipsUser,
    this.merk,
    this.type,
    this.platNumber,
    this.yearVehicles,
    this.dateVehicles,
  });

  VerifyStnkBodyModel.fromJson(Map<String, dynamic> json) {
    uuidTransportationTypes = json['uuid_transportation_types'];
    uuidVehicleOwnershipsUser = json['uuid_vehicle_ownerships_user'];
    merk = json['merk'];
    type = json['type'];
    platNumber = json['plat_number'];
    yearVehicles = json['year_vehicles'];
    dateVehicles = json['date_vehicles'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid_transportation_types'] = this.uuidTransportationTypes;
    data['uuid_vehicle_ownerships_user'] = this.uuidVehicleOwnershipsUser;
    data['merk'] = this.merk;
    data['type'] = this.type;
    data['plat_number'] = this.platNumber;
    data['year_vehicles'] = this.yearVehicles;
    data['date_vehicles'] = this.dateVehicles;
    return data;
  }
}
