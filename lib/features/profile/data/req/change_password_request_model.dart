class ChangePasswordRequestModel {
  String oldPasword;
  String newPassword;
  String newPassword1;

  ChangePasswordRequestModel({
    required this.oldPasword,
    required this.newPassword,
    required this.newPassword1,
  });

  factory ChangePasswordRequestModel.fromJson(Map<String, dynamic> json) => ChangePasswordRequestModel(
        oldPasword: json['old_pasword'],
        newPassword: json['new_password'],
        newPassword1: json['new_password1'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'old_pasword': oldPasword,
        'new_password': newPassword,
        'new_password1': newPassword1,
      };
}
