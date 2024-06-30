import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController with GetSingleTickerProviderStateMixin  {
  late TabController tabController;
  RxInt tabIndex = 0.obs;
  void initTab() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      tabIndex.value = tabController.index;
    });
  }

  @override
  void onInit() {
    super.onInit();
    initTab();
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }
}
