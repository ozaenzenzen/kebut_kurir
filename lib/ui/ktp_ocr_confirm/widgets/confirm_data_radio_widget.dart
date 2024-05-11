import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/custom_radio_widget.dart';

import 'package:kebut_kurir/features/ktp_ocr_confirm/presentation/ktp_ocr_confirm_controller.dart';

class ConfirmDataRadioWidget extends GetView<KTPOcrConfirmController> {
  final String label;
  // final String value1;
  // final String value2;
  final List<String> listValue;

  const ConfirmDataRadioWidget({
    super.key,
    required this.label,
    required this.listValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.start,
          style: AppTheme.textStyle.blackTextStyle.copyWith(
            fontSize: AppTheme.textConfig.size.n,
            fontWeight: AppTheme.textConfig.weight.semiBold,
          ),
        ),
        SizedBox(height: 4.h),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            spacing: 11,
            direction: Axis.horizontal,
            children: listValue.map((e) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
                    () => CustomRadio(
                      value: e,
                      groupValue: controller.selectedGender.value,
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedGender.value = value;
                        }
                      },
                    ),
                  ),
                  Text(
                    e,
                    style: AppTheme.textStyle.blackTextStyle.copyWith(
                      fontSize: AppTheme.textConfig.size.n,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        )
        // Row(
        //   children: [
        //     Row(
        //       children: [
        //         Obx(
        //           () => Radio<String>(
        //             value: value1,
        //             groupValue: controller.selectedGender.value,
        //             activeColor: AppTheme.colors.primaryColor,
        //             onChanged: (value) {
        //               if (value != null) {
        //                 controller.selectedGender.value = value;
        //               }
        //             },
        //           ),
        //         ),
        //         Text(
        //           value1,
        //           style: AppTheme.textStyle.blackTextStyle.copyWith(
        //             fontSize: AppTheme.textConfig.size.n,
        //           ),
        //         ),
        //       ],
        //     ),
        //     SizedBox(width: 110.w),
        //     Row(
        //       children: [
        //         Obx(
        //           () => Radio<String>(
        //             value: value2,
        //             groupValue: controller.selectedGender.value,
        //             activeColor: AppTheme.colors.primaryColor,
        //             onChanged: (value) {
        //               if (value != null) {
        //                 controller.selectedGender.value = value;
        //               }
        //             },
        //           ),
        //         ),
        //         Text(
        //           value2,
        //           style: AppTheme.textStyle.blackTextStyle.copyWith(
        //             fontSize: AppTheme.textConfig.size.n,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
