import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/features/home/presentation/home_controller.dart';

class HomeScreenPromo extends StatelessWidget {
  final HomeController controller;

  const HomeScreenPromo({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16.w),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Promo Untukmu',
            style: AppTheme.textStyle.blackTextStyle.copyWith(
              fontSize: 16.sp,
              fontWeight: AppTheme.textConfig.weight.semiBold,
            ),
          ),
          SizedBox(height: 12.h),
          GetBuilder<HomeController>(
            builder: (HomeController homeController) {
              return const SizedBox();
              /* if (homeController.listDataVoucher == null) {
                return const SizedBox();
              } else {
                return CarouselSlider(
                  items: homeController.listDataVoucher!.map((data) {
                    return InkWell(
                      onTap: () {
                        Get.to(
                          () => VoucherDetailScreenV2(
                            data: data.event!.first,
                            actionCallback: (EventGetVoucher data) {},
                          ),
                          binding: VoucherBinding(),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: Image.network(
                          "https://kebut-main-api.jdi.web.id/${data.event!.first.image!.replaceAll(' ', '%20')}",
                          height: 100.h,
                          width: 202.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(),
                  /* items: homeController.listDataVoucher![0].event!.map((EventGetVoucher data) {
                    return InkWell(
                      onTap: () {
                        Get.to(
                          () => VoucherDetailScreenV2(
                            data: data,
                            actionCallback: (EventGetVoucher data) {},
                          ),
                          binding: VoucherBinding(),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: Image.network(
                          "https://kebut-main-api.jdi.web.id/${data.image!.replaceAll(' ', '%20')}",
                          height: 100.h,
                          width: 202.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }).toList(), */
                  // items: <Widget>[
                  //   InkWell(
                  //     onTap: () {
                  //       Get.to(
                  //         () => const HomePromoDetailScreen(
                  //           expiredDateTime: '31 Juli 2023',
                  //           minTrx: 'Rp50.000',
                  //           tnC:
                  //               'Lorem ipsum dolor sit amet consectetur. Pretium et ornare tortor vel sit quis eget. Duis sed pharetra lacus orci adipiscing in diam placerat. Erat quam blandit augue donec hendrerit. Lorem lorem nunc eu mauris vitae aliquet diam. Tellus aliquam dictumst id dolor lacus in nunc sit laoreet. Dolor sit urna facilisis nec ut. Id est fermentum penatibus non amet.\nCongue nunc mattis at pulvinar habitasse rhoncus auctor. Aliquam convallis faucibus pretium platea.',
                  //           networkImage: '',
                  //         ),
                  //       );
                  //     },
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(6.r),
                  //       child: AssetImageWidget(
                  //         assets: 'assets/promo_static.png',
                  //         height: 100.h,
                  //         width: 202.w,
                  //       ),
                  //     ),
                  //   )
                  // ],
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    autoPlay: false,
                    height: 110.h,
                    enlargeCenterPage: true,
                    viewportFraction: 0.6,
                    aspectRatio: 2.0,
                    initialPage: 0,
                  ),
                );
              } */
            },
          ),
        ],
      ),
    );
  }
}
