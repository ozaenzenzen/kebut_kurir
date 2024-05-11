class ChangePasswordResponseModel {
  int? status;
  Result? result;

  ChangePasswordResponseModel({
    this.status,
    this.result,
  });

  factory ChangePasswordResponseModel.fromJson(Map<String, dynamic> json) => ChangePasswordResponseModel(
        status: json['status'],
        result: json['result'] == null ? null : Result.fromJson(json['result']),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'status': status,
        'result': result?.toJson(),
      };
}

class Result {
  int? res;
  String? message;
  String? detailMessage;

  Result({
    required this.res,
    required this.message,
    required this.detailMessage,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        res: json['res'],
        message: json['message'],
        detailMessage: json['detail_message'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'res': res,
        'message': message,
        'detail_message': detailMessage,
      };
}
