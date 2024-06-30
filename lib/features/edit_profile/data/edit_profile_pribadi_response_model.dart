class EditProfilePribadiResponseModel {
  int? status;
  Result? result;

  EditProfilePribadiResponseModel({
    this.status,
    this.result,
  });

  factory EditProfilePribadiResponseModel.fromJson(Map<String, dynamic> json) => EditProfilePribadiResponseModel(
        status: json['status'],
        result: json['result'] != null ? Result.fromJson(json['result']) : null,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'status': status,
        'result': result?.toJson(),
      };
}

class Result {
  int res;
  String message;

  Result({
    required this.res,
    required this.message,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        res: json['res'],
        message: json['message'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'res': res,
        'message': message,
      };
}
