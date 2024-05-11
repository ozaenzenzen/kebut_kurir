import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/features/static_page/args/static_page_args.dart';
import 'package:kebut_kurir/features/static_page/domain/static_page_repository.dart';

class StaticPageController extends GetxController {
  Rxn<StaticPageArg>? data = Rxn<StaticPageArg>();
  final StaticPageRepository _staticRepo = StaticPageRepository();
  ScrollController scrollController = ScrollController();
  final DialogsUtils _dialog = DialogsUtils();
  RxBool isRead = false.obs;

  RxBool nextPage = false.obs;

  Future<void> getStaticData(String type) async {
    _dialog.showLoading();
    data!.value = await _staticRepo.getStaticPage(staticType: type);
    print('ARGUMENT STATIC PAGE ===> ${data!.value!.title}');
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

  void scrollToTop() {
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    isRead.value = false;
  }

  @override
  void onReady() async {
    if (Get.arguments != null) {
      final String? args = Get.arguments as String?;
      if (args != null) {
        print("ONINIT STATIGPAGE CONTROLLER $args");
        await getStaticData(args);
      }
    }
    super.onReady();
  }

  @override
  void onInit() async {
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
