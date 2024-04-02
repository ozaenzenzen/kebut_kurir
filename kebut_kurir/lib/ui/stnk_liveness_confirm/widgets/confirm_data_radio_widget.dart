import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/custom_radio_widget.dart';
import 'package:kebut_kurir/features/stnk_liveness_confirm/presentation/stnk_liveness_confirm_controller.dart';

class ConfirmDataRadioWidget extends GetView<STNKLivenessConfirmController> {
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
                      groupValue: controller.selectedJenisRoda.value,
                      onChanged: (value) {
                        if (value != null) {
                          controller.selectedJenisRoda.value = value;
                          controller.tecMerkKendaraan.clear();
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
      ],
    );
  }
}
