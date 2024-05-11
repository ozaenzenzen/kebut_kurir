class PostalCodeModel {
  int? status;
  Result? result;

  PostalCodeModel({this.status, this.result});

  PostalCodeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result =
        json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  int? total;
  int? perPage;
  int? page;
  int? lastPage;
  List<Data>? data;

  Result({this.total, this.perPage, this.page, this.lastPage, this.data});

  Result.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['perPage'];
    page = json['page'];
    lastPage = json['lastPage'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['perPage'] = this.perPage;
    data['page'] = this.page;
    data['lastPage'] = this.lastPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? postalCode;
  String? name;
  String? altName;
  double? latitude;
  double? longitude;
  String? elevations;

  Data(
      {this.postalCode,
      this.name,
      this.altName,
      this.latitude,
      this.longitude,
      this.elevations});

  Data.fromJson(Map<String, dynamic> json) {
    postalCode = json['postal_code'];
    name = json['name'];
    altName = json['alt_name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    elevations = json['elevations'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postal_code'] = this.postalCode;
    data['name'] = this.name;
    data['alt_name'] = this.altName;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['elevations'] = this.elevations;
    return data;
  }
}
