import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/utils/bottomsheet_utils.dart';
import 'package:kebut_kurir/core/widgets/asset_image_widget.dart';
import 'package:kebut_kurir/features/home/presentation/home_controller.dart';

class HomeScreenMenu extends StatefulWidget {
  final HomeController controller;
  const HomeScreenMenu({super.key, required this.controller});

  @override
  State<HomeScreenMenu> createState() => _HomeScreenMenuState();
}

class _HomeScreenMenuState extends State<HomeScreenMenu> {
  bool kirimBarangMenuActive = false;
  bool sewaGudangMenuActive = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12.w),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          (kirimBarangMenuActive || sewaGudangMenuActive)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Menu Layanan',
                      style: AppTheme.textStyle.blackTextStyle.copyWith(
                        fontSize: 16.sp,
                        fontWeight: AppTheme.textConfig.weight.semiBold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          kirimBarangMenuActive = false;
                          sewaGudangMenuActive = false;
                        });
                      },
                      child: Text(
                        'Back',
                        style: AppTheme.textStyle.blackTextStyle.copyWith(
                          fontSize: 16.sp,
                          fontWeight: AppTheme.textConfig.weight.semiBold,
                        ),
                      ),
                    ),
                  ],
                )
              : Text(
                  'Menu Layanan',
                  style: AppTheme.textStyle.blackTextStyle.copyWith(
                    fontSize: 16.sp,
                    fontWeight: AppTheme.textConfig.weight.semiBold,
                  ),
                ),
          SizedBox(height: 16.h),
          (kirimBarangMenuActive)
              ? Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          menuLayananPaketAction();
                        },
                        child: Column(
                          children: <Widget>[
                            AssetImageWidget(
                              assets: 'assets/icon_paket.png',
                              height: 50.h,
                              width: 50.h,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Paket',
                              style: AppTheme.textStyle.blackTextStyle.copyWith(
                                color: const Color(0xff1D2129),
                                fontSize: AppTheme.textConfig.size.m,
                                fontWeight: AppTheme.textConfig.weight.medium,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          menuLayananCargoAction();
                        },
                        child: Column(
                          children: <Widget>[
                            AssetImageWidget(
                              assets: 'assets/icon_kirim_barang.png',
                              height: 50.h,
                              width: 50.h,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Cargo',
                              style: AppTheme.textStyle.blackTextStyle.copyWith(
                                color: const Color(0xff1D2129),
                                fontSize: AppTheme.textConfig.size.m,
                                fontWeight: AppTheme.textConfig.weight.medium,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            kirimBarangMenuActive = true;
                          });
                        },
                        child: Column(
                          children: <Widget>[
                            AssetImageWidget(
                              assets: 'assets/icon_kirim_barang.png',
                              height: 50.h,
                              width: 50.h,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Kirim Barang',
                              style: AppTheme.textStyle.blackTextStyle.copyWith(
                                color: const Color(0xff1D2129),
                                fontSize: AppTheme.textConfig.size.m,
                                fontWeight: AppTheme.textConfig.weight.medium,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          //
                        },
                        child: Column(
                          children: <Widget>[
                            AssetImageWidget(
                              assets: 'assets/icon_sewa_gudang.png',
                              height: 50.h,
                              width: 50.h,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'Sewa Gudang',
                              style: AppTheme.textStyle.blackTextStyle.copyWith(
                                color: const Color(0xff1D2129),
                                fontSize: AppTheme.textConfig.size.m,
                                fontWeight: AppTheme.textConfig.weight.medium,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
          // Obx(
          //   () => GridView.builder(
          //     shrinkWrap: true,
          //     primary: false,
          //     physics: const NeverScrollableScrollPhysics(),
          //     itemCount: controller.listMenu.length,
          //     padding: const EdgeInsets.only(bottom: 38, top: 24, right: 9, left: 9),
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
          //       height: 125.h,
          //       crossAxisSpacing: 9.w,
          //       crossAxisCount: 2,
          //       mainAxisSpacing: 16.h,
          //     ),
          //     itemBuilder: (BuildContext context, int index) => HomeScreenMenuWidget(
          //       title: controller.listMenu[index].name ?? '',
          //       asset: 'assets/dompet_ic.svg',
          //       onTap: () async {
          //         HubungiKamiController hubController = Get.put(HubungiKamiController());
          //         PromoController promoController = Get.put(PromoController());
          //         if (controller.listMenu[index].routeAppMobile == Routes.hubungiKami) {
          //           await hubController.getNumber('whatsapp_number');
          //           await hubController.getNumber('sms');
          //           await hubController.getNumber('call_center');
          //         } else if (controller.listMenu[index].routeAppMobile == Routes.promoScreen) {
          //           await promoController.getPromoList();
          //         }
          //         Get.toNamed(controller.listMenu[index].routeAppMobile ?? '');
          //       },
          //       assetWidth: 50.w,
          //       assetHeight: 50.w,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  menuLayananPaketAction() async {
    await BottomSheetUtils().showBottomSheet(
      withStrip: true,
      radius: 20.h,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Pilih Tipe Pengiriman',
            style: AppTheme.textStyle.blackTextStyle.copyWith(
              fontSize: AppTheme.textConfig.size.l,
              fontWeight: AppTheme.textConfig.weight.semiBold,
            ),
          ),
          SizedBox(height: 16.h),
          Column(
            children: <Widget>[
              InkWell(
                onTap: () async {
                  Get.back();
                  setState(() {
                    kirimBarangMenuActive = false;
                    sewaGudangMenuActive = false;
                  });
                  // Get.to(
                  //   () => const KirimBarangScreen(
                  //     pengirimanType: PengirimanType.pribadi,
                  //     kirimBarangLayananType: KirimBarangLayananType.paket,
                  //     routeIdentifier: RouteIdentifier.create,
                  //   ),
                  //   binding: KirimBarangBinding(),
                  // );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    // horizontal: 12.w,
                  ),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: const Color(0xffE6F7EE),
                        radius: 18.h,
                        child: AssetImageWidget(
                          color: const Color(0xff00B050),
                          assets: 'assets/icon_person.png',
                          height: 24.h,
                          width: 24.h,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Pribadi',
                            style: AppTheme.textStyle.blackTextStyle.copyWith(
                              color: const Color(0xff121419),
                              fontSize: AppTheme.textConfig.size.n,
                              fontWeight: AppTheme.textConfig.weight.medium,
                            ),
                          ),
                          Text(
                            'Pengiriman atas nama pribadi',
                            style: AppTheme.textStyle.blackTextStyle.copyWith(
                              color: const Color(0xff43474D),
                              fontSize: AppTheme.textConfig.size.ssm,
                              fontWeight: AppTheme.textConfig.weight.regular,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: const Color(0xff297628),
                        size: 16.h,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              InkWell(
                onTap: () async {
                  Get.back();
                  setState(() {
                    kirimBarangMenuActive = false;
                    sewaGudangMenuActive = false;
                  });
                  /* Get.to(
                    () => const KirimBarangScreen(
                      pengirimanType: PengirimanType.perusahaan,
                      kirimBarangLayananType: KirimBarangLayananType.paket,
                      routeIdentifier: RouteIdentifier.create,
                    ),
                    binding: KirimBarangBinding(),
                  ); */
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    // horizontal: 12.w,
                  ),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: const Color(0xffE6F7EE),
                        radius: 18.h,
                        child: AssetImageWidget(
                          color: const Color(0xff00B050),
                          assets: 'assets/icon_perusahaan.png',
                          height: 24.h,
                          width: 24.h,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Perusahaan',
                            style: AppTheme.textStyle.blackTextStyle.copyWith(
                              color: const Color(0xff121419),
                              fontSize: AppTheme.textConfig.size.n,
                              fontWeight: AppTheme.textConfig.weight.medium,
                            ),
                          ),
                          Text(
                            'Pengiriman atas nama perusahaan',
                            style: AppTheme.textStyle.blackTextStyle.copyWith(
                              color: const Color(0xff43474D),
                              fontSize: AppTheme.textConfig.size.ssm,
                              fontWeight: AppTheme.textConfig.weight.regular,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: const Color(0xff297628),
                        size: 16.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }

  menuLayananCargoAction() async {
    await BottomSheetUtils().showBottomSheet(
      withStrip: true,
      radius: 20.h,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Pilih Tipe Pengiriman',
            style: AppTheme.textStyle.blackTextStyle.copyWith(
              fontSize: AppTheme.textConfig.size.l,
              fontWeight: AppTheme.textConfig.weight.semiBold,
            ),
          ),
          SizedBox(height: 16.h),
          Column(
            children: <Widget>[
              InkWell(
                onTap: () async {
                  Get.back();
                  setState(() {
                    kirimBarangMenuActive = false;
                    sewaGudangMenuActive = false;
                  });
                  /* Get.to(
                    () => const KirimBarangScreen(
                      pengirimanType: PengirimanType.pribadi,
                      kirimBarangLayananType: KirimBarangLayananType.kargo,
                      routeIdentifier: RouteIdentifier.create,
                    ),
                    binding: KirimBarangBinding(),
                  ); */
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    // horizontal: 12.w,
                  ),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: const Color(0xffE6F7EE),
                        radius: 18.h,
                        child: AssetImageWidget(
                          color: const Color(0xff00B050),
                          assets: 'assets/icon_person.png',
                          height: 24.h,
                          width: 24.h,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Pribadi',
                            style: AppTheme.textStyle.blackTextStyle.copyWith(
                              color: const Color(0xff121419),
                              fontSize: AppTheme.textConfig.size.n,
                              fontWeight: AppTheme.textConfig.weight.medium,
                            ),
                          ),
                          Text(
                            'Pengiriman atas nama pribadi',
                            style: AppTheme.textStyle.blackTextStyle.copyWith(
                              color: const Color(0xff43474D),
                              fontSize: AppTheme.textConfig.size.ssm,
                              fontWeight: AppTheme.textConfig.weight.regular,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: const Color(0xff297628),
                        size: 16.h,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              InkWell(
                onTap: () async {
                  Get.back();
                  setState(() {
                    kirimBarangMenuActive = false;
                    sewaGudangMenuActive = false;
                  });
                  /* Get.to(
                    () => const KirimBarangScreen(
                      pengirimanType: PengirimanType.perusahaan,
                      kirimBarangLayananType: KirimBarangLayananType.kargo,
                      routeIdentifier: RouteIdentifier.create,
                    ),
                    binding: KirimBarangBinding(),
                  ); */
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.h,
                    // horizontal: 12.w,
                  ),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: const Color(0xffE6F7EE),
                        radius: 18.h,
                        child: AssetImageWidget(
                          color: const Color(0xff00B050),
                          assets: 'assets/icon_perusahaan.png',
                          height: 24.h,
                          width: 24.h,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Perusahaan',
                            style: AppTheme.textStyle.blackTextStyle.copyWith(
                              color: const Color(0xff121419),
                              fontSize: AppTheme.textConfig.size.n,
                              fontWeight: AppTheme.textConfig.weight.medium,
                            ),
                          ),
                          Text(
                            'Pengiriman atas nama perusahaan',
                            style: AppTheme.textStyle.blackTextStyle.copyWith(
                              color: const Color(0xff43474D),
                              fontSize: AppTheme.textConfig.size.ssm,
                              fontWeight: AppTheme.textConfig.weight.regular,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: const Color(0xff297628),
                        size: 16.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
