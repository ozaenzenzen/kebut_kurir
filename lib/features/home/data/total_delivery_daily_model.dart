class ResultTotalDeliveryDailyModel {
  int? status;
  TotalPickupDeliveryModel? result;

  ResultTotalDeliveryDailyModel({this.status, this.result});

  ResultTotalDeliveryDailyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'] != null ? TotalPickupDeliveryModel.fromJson(json['result']) : null;
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

class TotalPickupDeliveryModel {
  int? total;

  TotalPickupDeliveryModel({this.total});

  TotalPickupDeliveryModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    return data;
  }
}
