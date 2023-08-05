class HomeMenuModel {
  int? status;
  Result? result;

  HomeMenuModel({this.status, this.result});

  HomeMenuModel.fromJson(Map<String, dynamic> json) {
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
  List<HomeMenuData>? data;

  Result({this.total, this.perPage, this.page, this.lastPage, this.data});

  Result.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['perPage'];
    page = json['page'];
    lastPage = json['lastPage'];
    if (json['data'] != null) {
      data = <HomeMenuData>[];
      json['data'].forEach((v) {
        data!.add(new HomeMenuData.fromJson(v));
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

class HomeMenuData {
  String? uuid;
  String? name;
  String? icon;
  String? routeAppMobile;
  String? remarks;
  String? updatedAt;
  String? createdAt;
  String? createdBy;
  String? updatedBy;

  HomeMenuData(
      {this.uuid,
      this.name,
      this.icon,
      this.routeAppMobile,
      this.remarks,
      this.updatedAt,
      this.createdAt,
      this.createdBy,
      this.updatedBy});

  HomeMenuData.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    name = json['name'];
    icon = json['icon'];
    routeAppMobile = json['route_app_mobile'];
    remarks = json['remarks'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['route_app_mobile'] = this.routeAppMobile;
    data['remarks'] = this.remarks;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    return data;
  }
}
