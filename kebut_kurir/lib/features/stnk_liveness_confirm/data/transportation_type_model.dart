class TransportationTypeModel {
  int? status;
  Result? result;

  TransportationTypeModel({this.status, this.result});

  TransportationTypeModel.fromJson(Map<String, dynamic> json) {
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
  int? total;
  int? perPage;
  int? page;
  int? lastPage;
  List<TransportationTypeData>? data;

  Result({this.total, this.perPage, this.page, this.lastPage, this.data});

  Result.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['perPage'];
    page = json['page'];
    lastPage = json['lastPage'];
    if (json['data'] != null) {
      data = <TransportationTypeData>[];
      json['data'].forEach((v) {
        data!.add(new TransportationTypeData.fromJson(v));
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

class TransportationTypeData {
  String? uuid;
  String? name;
  String? updatedAt;
  String? createdAt;
  String? createdBy;
  String? updatedBy;

  TransportationTypeData({
    this.uuid,
    this.name,
    this.updatedAt,
    this.createdAt,
    this.createdBy,
    this.updatedBy,
  });

  TransportationTypeData.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}
