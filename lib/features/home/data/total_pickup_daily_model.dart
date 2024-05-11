class ResultTotalPickupDailyModel {
  int? status;
  TotalPickupDailyModel? result;

  ResultTotalPickupDailyModel({this.status, this.result});

  ResultTotalPickupDailyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'] != null ? TotalPickupDailyModel.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class TotalPickupDailyModel {
  int? total;

  TotalPickupDailyModel({this.total});

  TotalPickupDailyModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    return data;
  }
}
