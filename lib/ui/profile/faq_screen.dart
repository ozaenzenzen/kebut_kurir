import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:kebut_kurir/core/widgets/app_bar_widget.dart';
import 'package:kebut_kurir/features/profile/data/resp/get_faq_response_model.dart';
import 'package:kebut_kurir/features/profile/presentation/profile_controller.dart';
import 'package:kebut_kurir/ui/profile/widgets/custom_expansion_panel_widget.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final ProfileController profileController = Get.find<ProfileController>();

  GetFAQResponseModel? data;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await profileController.getFAQ(
        onSuccess: (GetFAQResponseModel dataResponse) {
          setState(() {
            data = dataResponse;
          });
          profileController.update();
        },
        onFailed: (String errorMessage) {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: const AppBarWidget(
          title: '',
        ),
        preferredSize: Size.fromHeight(56.h),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        padding: EdgeInsets.all(16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Frequently Asked Questions',
              style: GoogleFonts.mukta(
                color: const Color(0xff121419),
                fontWeight: FontWeight.w600,
                fontSize: 28.sp,
              ),
            ),
            SizedBox(height: 16.h),
            GetBuilder<ProfileController>(
              builder: (ProfileController controller) {
                if (data == null) {
                  return const SizedBox();
                } else {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.dataGetFAQResponseModel!.result!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.white,
                        child: CustomExpansionPanelWidget(
                          title: controller.dataGetFAQResponseModel!.result!.data![index].topic!,
                          child: ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.dataGetFAQResponseModel!.result!.data![index].faq!.data.length,
                            itemBuilder: (BuildContext context, int indexChild) {
                              return Card(
                                child: CustomExpansionPanelWidget(
                                  title: '${indexChild + 1}. ${controller.dataGetFAQResponseModel!.result!.data![index].faq!.data[indexChild].question}',
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        '${controller.dataGetFAQResponseModel!.result!.data![index].faq!.data[indexChild].question}',
                                        style: GoogleFonts.mukta(
                                          color: const Color(0xff121419),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      Text(
                                        '${controller.dataGetFAQResponseModel!.result!.data![index].faq!.data[indexChild].answer}',
                                        style: GoogleFonts.mukta(
                                          color: const Color(0xff121419),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                              // return Row(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: <Widget>[
                              //     Text(
                              //       '$indexChild',
                              //       style: GoogleFonts.mukta(
                              //         color: const Color(0xff121419),
                              //         fontWeight: FontWeight.w600,
                              //         fontSize: 14.sp,
                              //       ),
                              //     ),
                              //     SizedBox(width: 10.w),
                              //     Expanded(
                              //       child: Column(
                              //         crossAxisAlignment: CrossAxisAlignment.start,
                              //         children: <Widget>[
                              //           Text(
                              //             '${controller.dataGetFAQResponseModel!.result!.data![index].faq!.data[indexChild].question}',
                              //             style: GoogleFonts.mukta(
                              //               color: const Color(0xff121419),
                              //               fontWeight: FontWeight.w600,
                              //               fontSize: 14.sp,
                              //             ),
                              //           ),
                              //           Text(
                              //             '${controller.dataGetFAQResponseModel!.result!.data![index].faq!.data[indexChild].answer}',
                              //             style: GoogleFonts.mukta(
                              //               color: const Color(0xff121419),
                              //               fontWeight: FontWeight.w400,
                              //               fontSize: 14.sp,
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ],
                              // );
                            },
                            separatorBuilder: (BuildContext context, int indexChild) {
                              return SizedBox(height: 10.h);
                            },
                          ),
                        ),
                      );
                      // return Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: <Widget>[
                      //     Text(
                      //       'Pengirim',
                      //       style: GoogleFonts.mukta(
                      //         color: const Color(0xff121419),
                      //         fontWeight: FontWeight.w600,
                      //         fontSize: 22.sp,
                      //       ),
                      //     ),
                      //     Icon(
                      //       // (controller.isTopicOpen![index]) ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      //       (isTopicOpen![index]) ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      //       // Icons.keyboard_arrow_up,
                      //       size: 24.h,
                      //       color: const Color(0xff00B050),
                      //     ),
                      //   ],
                      // );
                      // return Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: <Widget>[
                      //     Text(
                      //       '${data!.result!.data![index].topic}',
                      //       style: GoogleFonts.mukta(
                      //         color: const Color(0xff121419),
                      //         fontWeight: FontWeight.w600,
                      //         fontSize: 16.sp,
                      //       ),
                      //     ),
                      //     // Text(
                      //     //   '${data!.result!.data![index].answer}',
                      //     //   style: GoogleFonts.mukta(
                      //     //     color: const Color(0xff121419),
                      //     //     fontWeight: FontWeight.w400,
                      //     //     fontSize: 14.sp,
                      //     //   ),
                      //     // ),
                      //   ],
                      // );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 12.h);
                    },
                  );
                }
              },
            ),
            // data == null && profileController.isTopicOpen == <bool>[]
            //     ? const SizedBox()
            //     : ListView.separated(
            //         shrinkWrap: true,
            //         physics: const NeverScrollableScrollPhysics(),
            //         itemCount: data!.result!.data!.length,
            //         itemBuilder: (BuildContext context, int index) {
            //           return Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: <Widget>[
            //               Text(
            //                 'Pengirim',
            //                 style: GoogleFonts.mukta(
            //                   color: const Color(0xff121419),
            //                   fontWeight: FontWeight.w600,
            //                   fontSize: 22.sp,
            //                 ),
            //               ),
            //               Icon(
            //                 (profileController.isTopicOpen![index]) ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
            //                 size: 24.h,
            //                 color: const Color(0xff00B050),
            //               ),
            //             ],
            //           );
            //           // return Column(
            //           //   crossAxisAlignment: CrossAxisAlignment.start,
            //           //   children: <Widget>[
            //           //     Text(
            //           //       '${data!.result!.data![index].topic}',
            //           //       style: GoogleFonts.mukta(
            //           //         color: const Color(0xff121419),
            //           //         fontWeight: FontWeight.w600,
            //           //         fontSize: 16.sp,
            //           //       ),
            //           //     ),
            //           //     // Text(
            //           //     //   '${data!.result!.data![index].answer}',
            //           //     //   style: GoogleFonts.mukta(
            //           //     //     color: const Color(0xff121419),
            //           //     //     fontWeight: FontWeight.w400,
            //           //     //     fontSize: 14.sp,
            //           //     //   ),
            //           //     // ),
            //           //   ],
            //           // );
            //         },
            //         separatorBuilder: (BuildContext context, int index) {
            //           return SizedBox(height: 12.h);
            //         },
            //       ),
          ],
        ),
      ),
    );
  }
}
