import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widget.dart';
import 'package:kebut_kurir/core/widgets/textfield_widget/underline_textfield_widget.dart';
import 'package:kebut_kurir/features/chat/presentation/chat_controller.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colors.whiteColor,
      appBar: PreferredSize(
        child: const AppBarWidget(
          title: 'Chat Admin',
        ),
        preferredSize: Size.fromHeight(56.h),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
                children: [
                  Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(width: 1, color: AppTheme.colors.primaryColor),
                            color: const Color(0xFFD9F3E5),
                          ),
                          padding: EdgeInsets.all(12.w),
                          child: Text(
                            'Testong Chat halo bro',
                            style: AppTheme.textStyle.primaryTextStyle.copyWith(
                              fontSize: AppTheme.textConfig.size.m,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(12.w),
                          child: Text(
                            'Testong Chat halo bro',
                            style: AppTheme.textStyle.blackTextStyle.copyWith(
                              fontSize: AppTheme.textConfig.size.m,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 24.h),
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
                          child: const UnderlineTextFieldWidget(
                            hintText: 'Tulis Pesan...',
                            filled: true,
                            withBorder: false,
                            isDense: true,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 14.w),
                          decoration: BoxDecoration(
                            color: AppTheme.colors.primaryColor,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.send_outlined,
                              color: Colors.white,
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
