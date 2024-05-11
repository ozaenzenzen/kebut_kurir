import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/utils/prefs.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widget.dart';
import 'package:kebut_kurir/core/widgets/textfield_widget/underline_textfield_widget.dart';
import 'package:kebut_kurir/features/chat/data/send_chat_req.dart';
import 'package:kebut_kurir/features/chat/presentation/chat_controller.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // if (Get.isRegistered<ChatController>()) {
    //   controller.fetchChat(receiptNumber: Get.arguments, read: 2);
    // }
    return Scaffold(
      backgroundColor: AppTheme.colors.whiteColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: const AppBarWidget(
          title: 'Chat Admin',
        ),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(
              top: 24,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: ShapeDecoration(
                          color: const Color(0xFFFFFFE6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/icon_perusahaan.png',
                              width: 16,
                              height: 16,
                              color: AppTheme.colors.blackColor2,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            'Layanan Pengiriman Perusahaan',
                            style: GoogleFonts.mukta(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 27,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: Text(
                                    'No Resi : KBT123',
                                    style: TextStyle(
                                      color: Color(0xFF121419),
                                      fontSize: 16,
                                      fontFamily: 'Mukta',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                controller: controller.controller,
                child: Obx(
                  () => Column(
                    children: controller.listChat.isEmpty
                        ? []
                        : controller.listChat.map((element) {
                            // var index = controller.listChat.indexOf(element);

                            return Align(
                              alignment: element.position == null
                                  ? Alignment.topRight
                                  : element.position == "right"
                                      ? Alignment.topRight
                                      : Alignment.topLeft,
                              child: Container(
                                // width: double.infinity,
                                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  // border: Border.all(width: 1, color: AppTheme.colors.primaryColor),
                                  color: const Color(0xFFFFFFD9),
                                ),
                                padding: EdgeInsets.all(12.w),
                                // alignment: Alignment.topRight,
                                child: Column(
                                  children: [
                                    Text(
                                      // element.message ?? '',
                                      element.message == null && element.date == null ? '' : '${element.message}\n${DateFormat('HH:mm').format(DateTime.parse(element.date!))}',
                                      textAlign: TextAlign.right,
                                      style: AppTheme.textStyle.blackTextStyle.copyWith(
                                        fontSize: AppTheme.textConfig.size.ml,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15, bottom: 0, top: 0, right: 10),
                  width: double.infinity,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(maxHeight: 44.h),
                          child: UnderlineTextFieldWidget(
                            hintText: 'Masukkan pesan disini...',
                            filled: true,
                            withBorder: false,
                            isDense: true,
                            controller: controller.sendMessage,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () async {
                          String uuid = await Prefs.userId;
                          controller.sendChat(
                            req: SendChatReq(
                              message: controller.sendMessage.text,
                              receiptNumber: Get.arguments,
                              uuidUsers: uuid,
                              uuidUsersAdmin: "tlFfvxasdf2C410",
                            ),
                          );
                          controller.sendMessage.text = "";
                          FocusScope.of(context).unfocus();
                          controller.controller.animateTo(
                            controller.controller.position.maxScrollExtent,
                            duration: Duration(seconds: 0),
                            curve: Curves.fastOutSlowIn,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 14.w),
                          decoration: BoxDecoration(
                            color: AppTheme.colors.primaryColor,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.send_outlined,
                              color: AppTheme.colors.blackColor2,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
