class AbsenRequestModel {
  String? uuidUsers;
  String? address;
  String? latitude;
  String? longitude;
  String? attendanceDatetime;

  AbsenRequestModel({
    this.uuidUsers,
    this.address,
    this.latitude,
    this.longitude,
    this.attendanceDatetime,
  });

  AbsenRequestModel.fromJson(Map<String, dynamic> json) {
    uuidUsers = json['uuid_users'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    attendanceDatetime = json['attendance_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid_users'] = this.uuidUsers;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['attendance_datetime'] = this.attendanceDatetime;
    return data;
  }
}
