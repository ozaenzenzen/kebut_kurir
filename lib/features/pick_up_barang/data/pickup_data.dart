

import 'package:get/get.dart';
import 'package:kebut_kurir/features/pick_up_barang/data/detail_pickup_data.dart';

class PickupData {
  int? status;
  Result? result;

  PickupData({
    this.status,
    this.result,
  });

  PickupData.fromJson(Map<String, dynamic> json) {
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
  List<Data>? data;

  Result({this.data});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? uuidDeliveryOrders;
  String? type;
  String? address;
  String? addressDetail;
  String? latitude;
  String? longitude;
  String? distance;
  // Rx<DataDetailPickup>? detailPickup;
   Rx<DataDetailPickup?> detailPickup = Rx<DataDetailPickup?>(null);


  Data({
    this.uuidDeliveryOrders,
    this.type,
    this.address,
    this.addressDetail,
    this.latitude,
    this.longitude,
    this.distance,
  });

  Data.fromJson(Map<String, dynamic> json) {
    uuidDeliveryOrders = json['uuid_delivery_orders'];
    type = json['type'];
    address = json['address'];
    addressDetail = json['address_detail'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid_delivery_orders'] = this.uuidDeliveryOrders;
    data['type'] = this.type;
    data['address'] = this.address;
    data['address_detail'] = this.addressDetail;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['distance'] = this.distance;
    return data;
  }
}
