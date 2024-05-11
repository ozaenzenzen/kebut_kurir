class RegisterVerifyKtpSuccessModel {
  int? status;
  ResultRegisterVerifyKtpSuccess? result;

  RegisterVerifyKtpSuccessModel({
    this.status,
    this.result,
  });

  factory RegisterVerifyKtpSuccessModel.fromJson(Map<String, dynamic> json) => RegisterVerifyKtpSuccessModel(
        status: json["status"],
        result: json["result"] == null ? null : ResultRegisterVerifyKtpSuccess.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result?.toJson(),
      };
}

class ResultRegisterVerifyKtpSuccess {
  int? res;
  String? message;

  ResultRegisterVerifyKtpSuccess({
    this.res,
    this.message,
  });

  factory ResultRegisterVerifyKtpSuccess.fromJson(Map<String, dynamic> json) => ResultRegisterVerifyKtpSuccess(
        res: json["res"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "res": res,
        "message": message,
      };
}
