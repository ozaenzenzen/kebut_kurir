import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/app/navigation/app_routes.dart';
import 'package:kebut_kurir/core/enums/ocr_enum.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/button_custom_widget.dart';
import 'package:kebut_kurir/features/register_upload_document/args/ktp_liveness_args.dart';
import 'package:kebut_kurir/features/register_upload_document/args/sim_args.dart';
import 'package:kebut_kurir/features/register_upload_document/presentation/register_upload_document_controller.dart';

class LivenessGuideBottomSheet extends GetView<RegisterUploadDocumentController> {
  final bool isSim;
  final Function() onTap;
  const LivenessGuideBottomSheet({
    super.key,
    this.isSim = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Bagaimana cara ambil foto yang benar?',
          style: AppTheme.textStyle.blackTextStyle.copyWith(
            fontSize: AppTheme.textConfig.size.nl,
            fontWeight: AppTheme.textConfig.weight.semiBold,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: <Widget>[
            Icon(Icons.check, color: AppTheme.colors.secondaryColor, size: 25.w),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                'Posisikan wajah dan KTP tepat berada pada area yang telah ditentukan',
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: AppTheme.textConfig.size.ml,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: <Widget>[
            Icon(Icons.check, color: AppTheme.colors.secondaryColor, size: 25.w),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                'Pastikan foto KTP terlihat jelas dan terbaca',
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: AppTheme.textConfig.size.ml,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Row(
          children: <Widget>[
            Icon(Icons.check, color: AppTheme.colors.secondaryColor, size: 25.w),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                'Tidak memakai aksesoris yang menutupi wajah (contoh : Topi, Kacamata hitam, masker)',
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: AppTheme.textConfig.size.ml,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(
              'assets/img_selfie1.png',
              width: 162.w,
              height: 115.w,
              fit: BoxFit.fill,
            ),
            Image.asset(
              'assets/img_selfie2.png',
              width: 162.w,
              height: 115.w,
              fit: BoxFit.fill,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ButtonCustom(
            text: 'Oke, Mengerti',
            textColor: AppTheme.colors.blackColor2,
            textSize: 18,
            onTap: onTap,
            // onTap: () => Get.toNamed(
            //   Routes.livenessScreen,
            //   arguments: isSim
            //       ? SimArgs(
            //           ktpImage: controller.ocrKtp.value!,
            //           card: OcrEnum.KTP,
            //         )
            //       : KtpLivenessArgs(
            //           card: OcrEnum.KTP,
            //           nik: '317181612030003',
            //           name: 'Yerikho',
            //           address: 'Jln Pendidikan',
            //           rtRw: '06/006',
            //           subDistrict: 'cijantung',
            //           district: 'Pasar rebo',
            //           city: 'Jakarta',
            //           province: 'Jakarta',
            //           pob: '12',
            //           dob: '12',
            //           height: '190',
            //           profession: 'Programmer',
            //           expired: '',
            //           bloodType: '0',
            //           citizenship: 'Indonesia',
            //           maritalStatus: 'belum kawin',
            //           religion: 'Katolik',
            //           gender: 'Male',
            //           // ktpImage: controller.ocrKtp.value!,
            //         ),
            // ),
            borderRadius: 6.r,
            paddingVer: 13,
          ),
        ),
      ],
    );
  }
}
