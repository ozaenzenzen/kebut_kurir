class RegisterStepOneBodyModel {
  String? fullName;
  String? email;
  String? handphone;
  String? deviceId;
  String? deviceType;
  String? deviceModel;

  RegisterStepOneBodyModel({
    this.fullName,
    this.email,
    this.handphone,
    this.deviceId,
    this.deviceType,
    this.deviceModel,
  });

  RegisterStepOneBodyModel.fromJson(Map<String, dynamic> json) {
    fullName = json['fullname'];
    email = json['email'];
    handphone = json['handphone'];
    deviceId = json['device_id'];
    deviceType = json['device_type'];
    deviceModel = json['device_model'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullName;
    data['email'] = this.email;
    data['handphone'] = this.handphone;
    data['device_id'] = this.deviceId;
    data['device_type'] = this.deviceType;
    data['device_model'] = this.deviceModel;
    return data;
  }
}
