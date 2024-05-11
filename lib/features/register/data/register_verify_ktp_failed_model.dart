class RegisterVerifyKtpFailedModel {
  int? status;
  ResultRegisterVerifyKtpFailed? result;

  RegisterVerifyKtpFailedModel({
    this.status,
    this.result,
  });

  factory RegisterVerifyKtpFailedModel.fromJson(Map<String, dynamic> json) => RegisterVerifyKtpFailedModel(
        status: json["status"],
        result: json["result"] == null ? null : ResultRegisterVerifyKtpFailed.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "result": result?.toJson(),
      };
}

class ResultRegisterVerifyKtpFailed {
  The0RegisterVerifyKtpFailed? the0;

  ResultRegisterVerifyKtpFailed({
    this.the0,
  });

  factory ResultRegisterVerifyKtpFailed.fromJson(Map<String, dynamic> json) => ResultRegisterVerifyKtpFailed(
        the0: json["0"] == null ? null : The0RegisterVerifyKtpFailed.fromJson(json["0"]),
      );

  Map<String, dynamic> toJson() => {
        "0": the0?.toJson(),
      };
}

class The0RegisterVerifyKtpFailed {
  List<dynamic>? message;

  The0RegisterVerifyKtpFailed({
    this.message,
  });

  factory The0RegisterVerifyKtpFailed.fromJson(Map<String, dynamic> json) => The0RegisterVerifyKtpFailed(
        message: json["message"] == null
            ? []
            : json["message"][0].toString().contains("Unable")
                ? [json["message"]]
                : List<MessageRegisterVerifyKtpFailed>.from(json["message"]!.map((x) => MessageRegisterVerifyKtpFailed.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? [] : List<dynamic>.from(message!.map((x) => x.toJson())),
      };
}

class MessageRegisterVerifyKtpFailed {
  String? message;
  String? field;
  String? validation;

  MessageRegisterVerifyKtpFailed({
    this.message,
    this.field,
    this.validation,
  });

  factory MessageRegisterVerifyKtpFailed.fromJson(Map<String, dynamic> json) => MessageRegisterVerifyKtpFailed(
        message: json["message"],
        field: json["field"],
        validation: json["validation"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "field": field,
        "validation": validation,
      };
}
