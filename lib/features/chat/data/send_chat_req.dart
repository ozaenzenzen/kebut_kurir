class SendChatReq {
  String? uuidUsers;
  String? uuidUsersAdmin;
  String? receiptNumber;
  String? message;

  SendChatReq(
      {this.uuidUsers, this.uuidUsersAdmin, this.receiptNumber, this.message});

  SendChatReq.fromJson(Map<String, dynamic> json) {
    uuidUsers = json['uuid_users'];
    uuidUsersAdmin = json['uuid_users_admin'];
    receiptNumber = json['receipt_number'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid_users'] = this.uuidUsers;
    data['uuid_users_admin'] = this.uuidUsersAdmin;
    data['receipt_number'] = this.receiptNumber;
    data['message'] = this.message;
    return data;
  }
}