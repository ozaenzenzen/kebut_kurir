import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/features/static_page/args/static_page_args.dart';

class StaticPageController extends GetxController {
  StaticPageArg? data;
  // final StaticPageRepository _staticRepo = StaticPageRepository();
  ScrollController scrollController = ScrollController();
  final DialogsUtils _dialog = DialogsUtils();
  RxBool isRead = false.obs;

  Future<void> getStaticData(String type) async {
    _dialog.showLoading();
    // data = await _staticRepo.getStaticPage(staticType: type);
    print('ARGUMENT STATIC PAGE ===> ${data!.title}');
    _dialog.hideLoading();
    update();
  }

  void scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    isRead.value = true;
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        bool isTop = scrollController.position.pixels == 0;
        if (isTop) {
          print('At the top');
        } else {
          print('At the bottom');
          isRead.value = true;
        }
      }
    });
  }
}
