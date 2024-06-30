class EditProfileCompanyResponseModel {
  int? status;
  ResultEditProfileCompany? result;

  EditProfileCompanyResponseModel({
    this.status,
    this.result,
  });

  EditProfileCompanyResponseModel copyWith({
    int? status,
    ResultEditProfileCompany? result,
  }) =>
      EditProfileCompanyResponseModel(
        status: status ?? this.status,
        result: result ?? this.result,
      );

  factory EditProfileCompanyResponseModel.fromJson(Map<String, dynamic> json) => EditProfileCompanyResponseModel(
        status: json["status"],
        result: json["result"] == null ? null : ResultEditProfileCompany.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result?.toJson(),
      };
}

class ResultEditProfileCompany {
  int? res;
  String? message;

  ResultEditProfileCompany({
    this.res,
    this.message,
  });

  ResultEditProfileCompany copyWith({
    int? res,
    String? message,
  }) =>
      ResultEditProfileCompany(
        res: res ?? this.res,
        message: message ?? this.message,
      );

  factory ResultEditProfileCompany.fromJson(Map<String, dynamic> json) => ResultEditProfileCompany(
        res: json["res"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "res": res,
        "message": message,
      };
}
