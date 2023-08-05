class LoginModel {
  int? status;
  Result? result;

  LoginModel({this.status, this.result});

  LoginModel.fromJson(Map<String, dynamic> json) {
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
  String? message;
  Token? token;
  User? user;

  Result({this.message, this.token, this.user});

  Result.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'] != null ? new Token.fromJson(json['token']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.token != null) {
      data['token'] = this.token!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Token {
  String? type;
  String? token;
  String? refreshToken;

  Token({this.type, this.token, this.refreshToken});

  Token.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['token'] = this.token;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}

class User {
  String? uuid;
  String? groupId;
  String? fullname;
  String? email;

  User({this.uuid, this.groupId, this.fullname, this.email});

  User.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    groupId = json['group_id'];
    fullname = json['fullname'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['group_id'] = this.groupId;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    return data;
  }
}
