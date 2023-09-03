import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widgetV2.dart';
import 'package:kebut_kurir/core/widgets/button_custom_widget.dart';
import 'package:kebut_kurir/features/static_page/presentation/static_page_controller.dart';

class StaticPageScreen extends GetView<StaticPageController> {
  const StaticPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(56.h),
              child: Obx(
                () => AppBarWidgetV2(
                  title: controller.nextPage.value ? 'Kebijakan Privasi' : 'Syarat dan Ketentuan',
                  onBack: () {
                    if (controller.isRead.value) {
                      Get.back(result: true);
                    } else {
                      Get.back(result: false);
                    }
                  },
                ),
              )),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: controller.scrollController,
                  child: Obx(
                    () => controller.data != null
                        ? controller.data!.value != null
                            ? Container(
                                padding: const EdgeInsets.all(16),
                                child: Html(
                                  data: controller.data!.value!.content,
                                ),
                              )
                            : Container()
                        : Column(
                            children: [
                              Text(
                                'Lorem ipsum dolor sit amet consectetur. Mattis cras arcu in nisi amet tristique sapien. Amet aenean laoreet iaculis et feugiat. Urna placerat pulvinar elementum sit ut eget id. Mauris fermentum arcu integer lacus. In pellentesque a lectus at diam mattis lorem lectus. In morbi odio vitae ac fermentum pulvinar. Felis arcu phasellus placerat tristique. Gravida ac sit convallis et hac nisi pulvinar ultrices.\nTellus cursus non eget convallis duis. Tincidunt ac pellentesque elementum eleifend vel eget dui sed. Aliquam mattis magna sapien vitae vitae. Vel eu sed mattis suspendisse vitae molestie amet turpis in. Quam vitae aliquam pulvinar id faucibus. At aliquam risus tellus tortor sit facilisi mattis donec. Et tempus porttitor id elit cursus hendrerit turpis euismod. Mattis urna eget cras morbi.\nAc at sit donec habitasse enim enim ac proin. Amet lobortis volutpat magna fermentum amet libero interdum enim. Laoreet ipsum orci ante volutpat at morbi ac. Sed est enim amet pharetra sed interdum nunc nunc interdum. Erat sed maecenas erat et ornare. Pulvinar ac diam lectus sit mauris fermentum facilisis. Etiam suscipit eget.',
                                style: AppTheme.textStyle.blackTextStyle.copyWith(
                                  color: AppTheme.colors.blackColor2,
                                  fontWeight: AppTheme.textConfig.weight.regular,
                                  height: 1.40,
                                  fontSize: AppTheme.textConfig.size.n,
                                ),
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet consectetur. Mattis cras arcu in nisi amet tristique sapien. Amet aenean laoreet iaculis et feugiat. Urna placerat pulvinar elementum sit ut eget id. Mauris fermentum arcu integer lacus. In pellentesque a lectus at diam mattis lorem lectus. In morbi odio vitae ac fermentum pulvinar. Felis arcu phasellus placerat tristique. Gravida ac sit convallis et hac nisi pulvinar ultrices.\nTellus cursus non eget convallis duis. Tincidunt ac pellentesque elementum eleifend vel eget dui sed. Aliquam mattis magna sapien vitae vitae. Vel eu sed mattis suspendisse vitae molestie amet turpis in. Quam vitae aliquam pulvinar id faucibus. At aliquam risus tellus tortor sit facilisi mattis donec. Et tempus porttitor id elit cursus hendrerit turpis euismod. Mattis urna eget cras morbi.\nAc at sit donec habitasse enim enim ac proin. Amet lobortis volutpat magna fermentum amet libero interdum enim. Laoreet ipsum orci ante volutpat at morbi ac. Sed est enim amet pharetra sed interdum nunc nunc interdum. Erat sed maecenas erat et ornare. Pulvinar ac diam lectus sit mauris fermentum facilisis. Etiam suscipit eget.',
                                style: AppTheme.textStyle.blackTextStyle.copyWith(
                                  color: AppTheme.colors.blackColor2,
                                  fontWeight: AppTheme.textConfig.weight.regular,
                                  height: 1.40,
                                  fontSize: AppTheme.textConfig.size.n,
                                ),
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet consectetur. Mattis cras arcu in nisi amet tristique sapien. Amet aenean laoreet iaculis et feugiat. Urna placerat pulvinar elementum sit ut eget id. Mauris fermentum arcu integer lacus. In pellentesque a lectus at diam mattis lorem lectus. In morbi odio vitae ac fermentum pulvinar. Felis arcu phasellus placerat tristique. Gravida ac sit convallis et hac nisi pulvinar ultrices.\nTellus cursus non eget convallis duis. Tincidunt ac pellentesque elementum eleifend vel eget dui sed. Aliquam mattis magna sapien vitae vitae. Vel eu sed mattis suspendisse vitae molestie amet turpis in. Quam vitae aliquam pulvinar id faucibus. At aliquam risus tellus tortor sit facilisi mattis donec. Et tempus porttitor id elit cursus hendrerit turpis euismod. Mattis urna eget cras morbi.\nAc at sit donec habitasse enim enim ac proin. Amet lobortis volutpat magna fermentum amet libero interdum enim. Laoreet ipsum orci ante volutpat at morbi ac. Sed est enim amet pharetra sed interdum nunc nunc interdum. Erat sed maecenas erat et ornare. Pulvinar ac diam lectus sit mauris fermentum facilisis. Etiam suscipit eget.',
                                style: AppTheme.textStyle.blackTextStyle.copyWith(
                                  color: AppTheme.colors.blackColor2,
                                  fontWeight: AppTheme.textConfig.weight.regular,
                                  height: 1.40,
                                  fontSize: AppTheme.textConfig.size.n,
                                ),
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet consectetur. Mattis cras arcu in nisi amet tristique sapien. Amet aenean laoreet iaculis et feugiat. Urna placerat pulvinar elementum sit ut eget id. Mauris fermentum arcu integer lacus. In pellentesque a lectus at diam mattis lorem lectus. In morbi odio vitae ac fermentum pulvinar. Felis arcu phasellus placerat tristique. Gravida ac sit convallis et hac nisi pulvinar ultrices.\nTellus cursus non eget convallis duis. Tincidunt ac pellentesque elementum eleifend vel eget dui sed. Aliquam mattis magna sapien vitae vitae. Vel eu sed mattis suspendisse vitae molestie amet turpis in. Quam vitae aliquam pulvinar id faucibus. At aliquam risus tellus tortor sit facilisi mattis donec. Et tempus porttitor id elit cursus hendrerit turpis euismod. Mattis urna eget cras morbi.\nAc at sit donec habitasse enim enim ac proin. Amet lobortis volutpat magna fermentum amet libero interdum enim. Laoreet ipsum orci ante volutpat at morbi ac. Sed est enim amet pharetra sed interdum nunc nunc interdum. Erat sed maecenas erat et ornare. Pulvinar ac diam lectus sit mauris fermentum facilisis. Etiam suscipit eget.',
                                style: AppTheme.textStyle.blackTextStyle.copyWith(
                                  color: AppTheme.colors.blackColor2,
                                  fontWeight: AppTheme.textConfig.weight.regular,
                                  height: 1.40,
                                  fontSize: AppTheme.textConfig.size.n,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 0,
                          blurRadius: 1,
                          offset: const Offset(0, -3),
                        ),
                      ],
                    ),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Obx(
                        () => ButtonCustom(
                          text: 'Saya telah membaca dan setuju',
                          isActive: controller.isRead.value,
                          textColor: AppTheme.colors.blackColor2,
                          textSize: 18,
                          onTap: () async {
                            if (controller.nextPage.value) {
                              Get.back(
                                result: true,
                              );
                            } else {
                              await controller.getStaticData("policy");
                              controller.nextPage.value = true;
                              controller.scrollToTop();
                              controller.update();
                            }
                          },
                          borderRadius: 6.r,
                          paddingVer: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          floatingActionButton: Container(
            width: 33.w,
            height: 33.w,
            margin: EdgeInsets.only(bottom: 100.h),
            child: FloatingActionButton(
              onPressed: controller.scrollToBottom,
              backgroundColor: const Color(0xFFFFFFD9),
              child: Icon(
                Icons.arrow_downward_sharp,
                color: AppTheme.colors.blackColor2,
              ),
            ),
          ),
        ),
        onWillPop: () async {
          if (controller.isRead.value) {
            Get.back(result: true);
          } else {
            Get.back(result: false);
          }
          return false;
        });
  }
}
