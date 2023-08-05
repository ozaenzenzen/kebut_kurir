class RegisterStepOneBodyModel {
  String? shortname;
  String? email;
  String? handphone;
  String? uuidTypeCustomers;
  String? officeEmail;
  String? officeAddress;
  String? officePhone;
  String? password;
  String? repeatPassword;
  String? deviceId;
  String? deviceType;
  String? deviceModel;

  RegisterStepOneBodyModel(
      {this.shortname,
      this.email,
      this.handphone,
      this.uuidTypeCustomers,
      this.officeEmail,
      this.officeAddress,
      this.officePhone,
      this.password,
      this.repeatPassword,
      this.deviceId,
      this.deviceType,
      this.deviceModel});

  RegisterStepOneBodyModel.fromJson(Map<String, dynamic> json) {
    shortname = json['shortname'];
    email = json['email'];
    handphone = json['handphone'];
    uuidTypeCustomers = json['uuid_type_customers'];
    officeEmail = json['office_email'];
    officeAddress = json['office_address'];
    officePhone = json['office_phone'];
    password = json['password'];
    repeatPassword = json['repeat_password'];
    deviceId = json['device_id'];
    deviceType = json['device_type'];
    deviceModel = json['device_model'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shortname'] = this.shortname;
    data['email'] = this.email;
    data['handphone'] = this.handphone;
    data['uuid_type_customers'] = this.uuidTypeCustomers;
    data['office_email'] = this.officeEmail;
    data['office_address'] = this.officeAddress;
    data['office_phone'] = this.officePhone;
    data['password'] = this.password;
    data['repeat_password'] = this.repeatPassword;
    data['device_id'] = this.deviceId;
    data['device_type'] = this.deviceType;
    data['device_model'] = this.deviceModel;
    return data;
  }
}
