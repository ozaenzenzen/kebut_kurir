// ignore_for_file: avoid_print, invalid_use_of_visible_for_testing_member

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/core/utils/prefs.dart';
import 'package:kebut_kurir/features/chat/data/chat_data.dart';
import 'package:kebut_kurir/features/chat/data/send_chat_req.dart';
import 'package:kebut_kurir/features/chat/domain/chat_repository.dart';

class ChatController extends GetxController {
  RxList<ChatData> listChat = RxList<ChatData>();

  final ChatRepository _chatRepository = ChatRepository();

  final TextEditingController sendMessage = TextEditingController();

  final DialogsUtils dialogsUtils = DialogsUtils();

  final ScrollController controller = ScrollController();

  RxInt fetchData = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    Future.delayed(Duration.zero, () async {
      await fetchChat(receiptNumber: Get.arguments, read: 2).then((value) {
        print("listchat : ${value.length}");
        controller.jumpTo(
          controller.position.maxScrollExtent,
        );
      });
    });
    super.onReady();
  }

  Future<List<ChatData>> fetchChat({
    required String receiptNumber,
    required int read,
  }) async {
    dialogsUtils.showLoading();
    final ResultChatModel? result = await _chatRepository.getChat(
      uuid: await Prefs.userId,
      read: read,
      receiptNumber: receiptNumber,
    );
    log("response result : ${result?.toJson()}");
    listChat.clear();
    if (result != null) {
      if (result.result != null) {
        if (result.result!.chat != null) {
          listChat.addAll(result.result!.chat!);
          fetchData.value = 1;
          update();
        } else {
          listChat.clear();
        }
      } else {
        listChat.clear();
      }
    } else {
      listChat.clear();
    }

    dialogsUtils.hideLoading();
    update();
    controller.jumpTo(
      controller.position.maxScrollExtent,
    );
    return listChat;
  }

  Future<void> sendChat({
    required SendChatReq req,
  }) async {
    dialogsUtils.showLoading();
    final ResultChatModel? result = await _chatRepository.postChat(
      req: req,
    );
    if (result != null) {
      if (result.result != null) {
        if (result.result!.chat != null) {
          listChat.value = result.result!.chat!;
        } else {
          listChat.value = [];
        }
      } else {
        listChat.value = [];
      }
    } else {
      listChat.value = [];
    }
    dialogsUtils.hideLoading();
    update();
  }
}
