class EditProfileCompanyRequestModel {
  String? shortname;
  String? email;
  String? handphone;
  String? officeName;
  String? officeAddress;
  String? officePhone;

  EditProfileCompanyRequestModel({
    this.shortname,
    this.email,
    this.handphone,
    this.officeName,
    this.officeAddress,
    this.officePhone,
  });

  EditProfileCompanyRequestModel copyWith({
    String? shortname,
    String? email,
    String? handphone,
    String? officeName,
    String? officeAddress,
    String? officePhone,
  }) =>
      EditProfileCompanyRequestModel(
        shortname: shortname ?? this.shortname,
        email: email ?? this.email,
        handphone: handphone ?? this.handphone,
        officeName: officeName ?? this.officeName,
        officeAddress: officeAddress ?? this.officeAddress,
        officePhone: officePhone ?? this.officePhone,
      );

  factory EditProfileCompanyRequestModel.fromJson(Map<String, dynamic> json) => EditProfileCompanyRequestModel(
        shortname: json["shortname"],
        email: json["email"],
        handphone: json["handphone"],
        officeName: json["office_name"],
        officeAddress: json["office_address"],
        officePhone: json["office_phone"],
      );

  Map<String, dynamic> toJson() => {
        "shortname": shortname,
        "email": email,
        "handphone": handphone,
        "office_name": officeName,
        "office_address": officeAddress,
        "office_phone": officePhone,
      };
}
