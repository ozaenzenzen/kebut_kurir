class DetailPickupModel {
  int? status;
  Result? result;

  DetailPickupModel({this.status, this.result});

  DetailPickupModel.fromJson(Map<String, dynamic> json) {
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
  DataDetailPickup? data;

  Result({this.data});

  Result.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new DataDetailPickup.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataDetailPickup {
  String? uuidDeliveryOrders;
  SenderDetails? senderDetails;
  RecipientDetails? recipientDetails;
  String? packageSizeName;
  String? descPackage;
  String? packageWeight;
  String? packageVolume;

  DataDetailPickup(
      {this.uuidDeliveryOrders,
      this.senderDetails,
      this.recipientDetails,
      this.packageSizeName,
      this.descPackage,
      this.packageWeight,
      this.packageVolume});

  DataDetailPickup.fromJson(Map<String, dynamic> json) {
    uuidDeliveryOrders = json['uuid_delivery_orders'];
    senderDetails = json['sender_details'] != null
        ? new SenderDetails.fromJson(json['sender_details'])
        : null;
    recipientDetails = json['recipient_details'] != null
        ? new RecipientDetails.fromJson(json['recipient_details'])
        : null;
    packageSizeName = json['package_size_name'];
    descPackage = json['desc_package'];
    packageWeight = json['package_weight'];
    packageVolume = json['package_volume'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid_delivery_orders'] = this.uuidDeliveryOrders;
    if (this.senderDetails != null) {
      data['sender_details'] = this.senderDetails!.toJson();
    }
    if (this.recipientDetails != null) {
      data['recipient_details'] = this.recipientDetails!.toJson();
    }
    data['package_size_name'] = this.packageSizeName;
    data['desc_package'] = this.descPackage;
    data['package_weight'] = this.packageWeight;
    data['package_volume'] = this.packageVolume;
    return data;
  }
}

class SenderDetails {
  String? nameSender;
  String? phone;
  String? address;
  String? addressDetail;
  String? long;
  String? lat;

  SenderDetails(
      {this.nameSender,
      this.phone,
      this.address,
      this.addressDetail,
      this.long,
      this.lat});

  SenderDetails.fromJson(Map<String, dynamic> json) {
    nameSender = json['name_sender'];
    phone = json['phone'];
    address = json['address'];
    addressDetail = json['address_detail'];
    long = json['long'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_sender'] = this.nameSender;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['address_detail'] = this.addressDetail;
    data['long'] = this.long;
    data['lat'] = this.lat;
    return data;
  }
}

class RecipientDetails {
  String? nameRecipient;
  String? phone;
  String? address;
  String? addressDetail;
  String? long;
  String? lat;

  RecipientDetails(
      {this.nameRecipient,
      this.phone,
      this.address,
      this.addressDetail,
      this.long,
      this.lat});

  RecipientDetails.fromJson(Map<String, dynamic> json) {
    nameRecipient = json['name_recipient'];
    phone = json['phone'];
    address = json['address'];
    addressDetail = json['address_detail'];
    long = json['long'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name_recipient'] = this.nameRecipient;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['address_detail'] = this.addressDetail;
    data['long'] = this.long;
    data['lat'] = this.lat;
    return data;
  }
}