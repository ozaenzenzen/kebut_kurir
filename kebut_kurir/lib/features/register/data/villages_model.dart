class VillagesModel {
  int? status;
  Result? result;

  VillagesModel({this.status, this.result});

  VillagesModel.fromJson(Map<String, dynamic> json) {
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
  String? uuid;
  String? uuidDistricts;
  String? name;

  Data({this.uuid, this.uuidDistricts, this.name});

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    uuidDistricts = json['uuid_districts'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['uuid_districts'] = this.uuidDistricts;
    data['name'] = this.name;
    return data;
  }
}
