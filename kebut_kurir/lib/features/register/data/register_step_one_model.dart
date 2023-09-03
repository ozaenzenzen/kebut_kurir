class RegisterStepOneModel {
  int? status;
  Result? result;

  RegisterStepOneModel({this.status, this.result});

  RegisterStepOneModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'] != null ? new Result.fromJson(json['result']) : null;
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
  Data? data;
  String? message;

  Result({this.data, this.message});

  Result.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  String? uuid;
  String? courier;

  Data({
    this.uuid,
    this.courier,
  });

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    courier = json['courier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['courier'] = this.courier;
    return data;
  }
}
