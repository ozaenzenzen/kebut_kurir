class CheckCourierbyPostalCodeData {
  int? status;
  List<Result>? result;

  CheckCourierbyPostalCodeData({this.status, this.result});

  CheckCourierbyPostalCodeData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? uuid;
  String? fullname;
  String? shortname;
  String? email;
  String? handphone;
  String? deliveryTypes;
  String? updatedAt;
  String? createdAt;

  Result(
      {this.uuid,
      this.fullname,
      this.shortname,
      this.email,
      this.handphone,
      this.deliveryTypes,
      this.updatedAt,
      this.createdAt});

  Result.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    fullname = json['fullname'];
    shortname = json['shortname'];
    email = json['email'];
    handphone = json['handphone'];
    deliveryTypes = json['delivery_types'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['fullname'] = this.fullname;
    data['shortname'] = this.shortname;
    data['email'] = this.email;
    data['handphone'] = this.handphone;
    data['delivery_types'] = this.deliveryTypes;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}