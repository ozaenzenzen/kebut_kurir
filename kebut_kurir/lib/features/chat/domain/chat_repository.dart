import 'dart:developer';

import 'package:kebut_kurir/core/utils/api_function.dart';
import 'package:kebut_kurir/features/chat/data/chat_data.dart';
import 'package:dio/src/response.dart';
import 'package:kebut_kurir/features/chat/data/send_chat_req.dart';

class ChatRepository {
  final ApiClient apiClient = ApiClient();
  Future<ResultChatModel?> getChat({
    required String uuid,
    required String receiptNumber,
    required int read,
  }) async {
    ResultChatModel? result;
    try {
      await apiClient.getRequest(
        'api/web/chat-admin-courier/list-chat',
        queryParameters: {
          'uuid_users': uuid,
          'receipt_number': receiptNumber,
          'read': read,
        },
      ).then((Response<dynamic> value) {
        log('REPONSE CHAT $value');
        result = ResultChatModel.fromJson(value.data);
      });
      if (result != null) {
        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<ResultChatModel?> postChat({
    required SendChatReq req,
  }) async {
    ResultChatModel? result;
    try {
      await apiClient.postRequest(
        'api/web/chat-admin-courier',
        data: req.toJson(),
      ).then((Response<dynamic> value) {
        log('REPONSE SEND CHAT $value');
        result = ResultChatModel.fromJson(value.data);
      });
      if (result != null) {
        return result;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
