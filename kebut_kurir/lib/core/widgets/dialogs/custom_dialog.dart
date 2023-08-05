import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/widgets/asset_image_widget.dart';
import 'package:kebut_kurir/core/widgets/button_custom_widget.dart';

enum ButtonDirection { VERTICAL, HORIZONTAL }

class CustomDialog extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? asset;
  final ButtonDirection? buttonDirection;
  final String? primaryButtonText;
  final String? secondaryButtonText;
  final void Function()? onTapPrimary;
  final Function(dynamic)? onTapSecondary;

  const CustomDialog({
    Key? key,
    required this.title,
    this.subTitle,
    this.asset,
    this.onTapPrimary,
    this.onTapSecondary,
    this.primaryButtonText,
    this.secondaryButtonText,
    this.buttonDirection = ButtonDirection.VERTICAL,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Material(
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (asset != null && asset != '') ...<Widget>[
                AssetImageWidget(
                  assets: asset!,
                  height: 128,
                  width: 128,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 16.h,
                ),
              ],
              Text(
                title,
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: AppTheme.textConfig.size.l,
                  fontWeight: AppTheme.textConfig.weight.semiBold,
                ),
              ),
              if (subTitle != null && subTitle != '') ...<Widget>[
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  subTitle!,
                  textAlign: TextAlign.center,
                  style: AppTheme.textStyle.blackTextStyle.copyWith(
                    fontSize: AppTheme.textConfig.size.n,
                  ),
                ),
              ],
              SizedBox(
                height: 12.h,
              ),
              if (buttonDirection == ButtonDirection.HORIZONTAL) ...<Widget>[
                Row(
                  children: <Widget>[
                    Visibility(
                      visible: primaryButtonText != null && primaryButtonText != '',
                      child: Expanded(
                        child: ButtonCustom(
                          paddingVer: 8.h,
                          borderRadius: 6.r,
                          paddingHor: 12.w,
                          text: primaryButtonText!,
                          textColor: AppTheme.colors.primaryColor,
                          buttonColor: AppTheme.colors.secondaryColor,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: secondaryButtonText != null && secondaryButtonText != '',
                      child: Expanded(
                        child: ButtonCustom(
                          paddingVer: 8.h,
                          paddingHor: 12.w,
                          borderRadius: 6.r,
                          text: secondaryButtonText!,
                          textColor: AppTheme.colors.secondaryColor,
                          buttonColor: AppTheme.colors.whiteColor,
                        ),
                      ),
                    ),
                  ],
                )
              ] else ...<Widget>[
                primaryButtonText != null
                    ? Visibility(
                        visible: primaryButtonText != null && primaryButtonText != '',
                        child: ButtonCustom(
                          paddingVer: 8.h,
                          paddingHor: 12.w,
                          borderRadius: 6.r,
                          text: primaryButtonText!,
                          textColor: AppTheme.colors.whiteColor,
                          buttonColor: onTapPrimary != null ? AppTheme.colors.primaryColor : AppTheme.colors.greyColor,
                          onTap: onTapPrimary,
                        ),
                      )
                    : const SizedBox.shrink(),
                Visibility(
                  visible: secondaryButtonText != null && secondaryButtonText != '',
                  child: ButtonCustom(
                    paddingVer: 8.h,
                    paddingHor: 12.w,
                    borderRadius: 6.r,
                    text: secondaryButtonText ?? '',
                    textColor: AppTheme.colors.whiteColor,
                    buttonColor: onTapSecondary != null ? AppTheme.colors.primaryColor : AppTheme.colors.greyColor,
                    onTap: () => onTapSecondary,
                  ),
                )
              ],
            ],
          ),
        ),
      ),
    );
  }
}
