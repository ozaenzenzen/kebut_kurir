class ResultChatModel {
  int? status;
  Result? result;

  ResultChatModel({this.status, this.result});

  ResultChatModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  List<ChatData>? chat;
  int? unread;

  Result({this.chat, this.unread});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['chat'] != null) {
      chat = <ChatData>[];
      json['chat'].forEach((v) {
        chat!.add(ChatData.fromJson(v));
      });
    }
    unread = json['unread'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chat != null) {
      data['chat'] = chat!.map((v) => v.toJson()).toList();
    }
    data['unread'] = unread;
    return data;
  }
}

class ChatData {
  String? author;
  String? position;
  String? message;
  String? date;

  ChatData({this.author, this.position, this.message, this.date});

  ChatData.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    position = json['position'];
    message = json['message'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['author'] = author;
    data['position'] = position;
    data['message'] = message;
    data['date'] = date;
    return data;
  }
}
