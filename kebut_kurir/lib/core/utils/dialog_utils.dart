import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/utils/toast_custom.dart';
import 'package:kebut_kurir/core/widgets/dialogs/custom_dialog.dart';
import 'package:kebut_kurir/core/widgets/dialogs/error_dialog.dart';
import 'package:kebut_kurir/core/widgets/dialogs/loading_dialog.dart';

enum MainPopupButtonDirection { Vertical, Horizontal }

class DialogsUtils {
  bool _isDialogLoadingShowing = false;
  bool isDialogLoadingShowing = false;

  void showLoading() {
    print('ISI SHOW DIALOG $_isDialogLoadingShowing');
    if (_isDialogLoadingShowing == false) {
      isDialogLoadingShowing = true;
      _isDialogLoadingShowing = true;
      Get.dialog(
        const LoadingDialog(),
        barrierDismissible: false,
      );
    }
  }

  void showToastMessage(String message) {
    showToast(message);
  }

  void hideLoading() {
    _isDialogLoadingShowing = false;
    isDialogLoadingShowing = false;
    Get.back();
  }

  void showError(String message) {
    if (_isDialogLoadingShowing) {
      _isDialogLoadingShowing = false;
      Get.dialog(
        ErrorDialog(message: message),
        barrierDismissible: false,
      );
    }
  }

  void showCustomDialog({
    required String title,
    String? subTitle,
    String? asset,
    String? primaryButtonText,
    required BuildContext context,
    String? secondaryButtonText,
    Function()? primaryButton,
    Function(dynamic)? secondaryButton,
    ButtonDirection? buttonDirection,
    bool isBarrierDismissible = true,
    bool reverseButton = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: isBarrierDismissible,
      builder: (BuildContext context) {
        return CustomDialog(
          title: title,
          subTitle: subTitle,
          asset: asset,
          primaryButtonText: primaryButtonText,
          secondaryButtonText: secondaryButtonText,
          onTapPrimary: primaryButton,
          onTapSecondary: secondaryButton,
          buttonDirection: buttonDirection,
          reverseButton: reverseButton,
        );
      },
    );
  }

  Future<void> showSuccessDialog({
    required BuildContext context,
    String? title,
    String? description,
    double? titleSize,
    double? descriptionSize,
    Color? titleColor,
    Color? descriptionColor,
    bool isDismissible = true,
    Function()? primaryOnTap,
    String? primaryButtonText,
    Function()? secondaryOnTap,
    String? secondaryButtonText,
    bool reverseButton = false,
    bool useTimeOut = true,
    bool isHorizontal = true,
  }) async {
    Timer? timer;
    if (useTimeOut && isDismissible) {
      if (primaryButtonText != null || secondaryButtonText != null) {
        //
      } else {
        timer = Timer(
          const Duration(milliseconds: 3000),
          () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        );
      }
    } else {
      //
    }
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icon_popup_success.png',
                height: 96.h,
                width: 96.h,
              ),
              SizedBox(height: 16.h),
              Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: titleSize ?? AppTheme.textConfig.size.l,
                  fontWeight: AppTheme.textConfig.weight.semiBold,
                  color: titleColor,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                description ?? '',
                textAlign: TextAlign.center,
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: descriptionSize ?? AppTheme.textConfig.size.n,
                  fontWeight: AppTheme.textConfig.weight.regular,
                  color: descriptionColor ?? const Color(0xff616E7C),
                ),
              ),
              buttonHandlerForDialog(
                context: context,
                primaryOnTap: primaryOnTap,
                primaryButtonText: primaryButtonText,
                secondaryOnTap: secondaryOnTap,
                secondaryButtonText: secondaryButtonText,
                reverseButton: reverseButton,
                isHorizontal: isHorizontal,
              ),
              // : const SizedBox(),
            ],
          ),
        );
      },
    ).then((_) {
      timer?.cancel();
      timer = null;
    });
  }

  Future<void> showFailedDialog({
    required BuildContext context,
    String? title,
    String? description,
    double? titleSize,
    double? descriptionSize,
    Color? titleColor,
    Color? descriptionColor,
    bool isDismissible = true,
    Function()? primaryOnTap,
    String? primaryButtonText,
    Function()? secondaryOnTap,
    String? secondaryButtonText,
    bool reverseButton = false,
    bool useTimeOut = true,
    bool isHorizontal = true,
  }) async {
    Timer? timer;
    if (useTimeOut && isDismissible) {
      if (primaryButtonText != null || secondaryButtonText != null) {
        //
      } else {
        timer = Timer(
          const Duration(milliseconds: 3000),
          () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        );
      }
    } else {
      //
    }
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icon_popup_error.png',
                height: 96.h,
                width: 96.h,
              ),
              SizedBox(height: 16.h),
              Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: titleSize ?? AppTheme.textConfig.size.l,
                  fontWeight: AppTheme.textConfig.weight.semiBold,
                  color: titleColor,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                description ?? '',
                textAlign: TextAlign.center,
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: descriptionSize ?? AppTheme.textConfig.size.n,
                  fontWeight: AppTheme.textConfig.weight.regular,
                  color: descriptionColor ?? const Color(0xff616E7C),
                ),
              ),
              buttonHandlerForDialog(
                context: context,
                primaryOnTap: primaryOnTap,
                primaryButtonText: primaryButtonText,
                secondaryOnTap: secondaryOnTap,
                secondaryButtonText: secondaryButtonText,
                reverseButton: reverseButton,
                isHorizontal: isHorizontal,
              ),
              // : const SizedBox(),
            ],
          ),
        );
      },
    ).then((_) {
      timer?.cancel();
      timer = null;
    });
  }

  Future<void> showWarningDialog({
    required BuildContext context,
    String? title,
    String? description,
    double? titleSize,
    double? descriptionSize,
    Color? titleColor,
    Color? descriptionColor,
    bool isDismissible = true,
    Function()? primaryOnTap,
    String? primaryButtonText,
    Function()? secondaryOnTap,
    String? secondaryButtonText,
    bool reverseButton = false,
    bool useTimeOut = true,
    bool isHorizontal = true,
  }) async {
    Timer? timer;
    if (useTimeOut && isDismissible) {
      if (primaryButtonText != null || secondaryButtonText != null) {
        //
      } else {
        timer = Timer(
          const Duration(milliseconds: 3000),
          () {
            Navigator.of(context, rootNavigator: true).pop();
          },
        );
      }
    } else {
      //
    }
    showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/icon_popup_warning.png',
                height: 96.h,
                width: 96.h,
              ),
              SizedBox(height: 16.h),
              Text(
                title ?? '',
                textAlign: TextAlign.center,
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: titleSize ?? AppTheme.textConfig.size.l,
                  fontWeight: AppTheme.textConfig.weight.semiBold,
                  color: titleColor,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                description ?? '',
                textAlign: TextAlign.center,
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: descriptionSize ?? AppTheme.textConfig.size.n,
                  fontWeight: AppTheme.textConfig.weight.regular,
                  color: descriptionColor ?? const Color(0xff616E7C),
                ),
              ),
              buttonHandlerForDialog(
                context: context,
                primaryOnTap: primaryOnTap,
                primaryButtonText: primaryButtonText,
                secondaryOnTap: secondaryOnTap,
                secondaryButtonText: secondaryButtonText,
                reverseButton: reverseButton,
                isHorizontal: isHorizontal,
              ),
              // : const SizedBox(),
            ],
          ),
        );
      },
    ).then((_) {
      timer?.cancel();
      timer = null;
    });
  }

  Widget buttonHandlerForDialog({
    required BuildContext context,
    Function()? primaryOnTap,
    String? primaryButtonText,
    Function()? secondaryOnTap,
    String? secondaryButtonText,
    bool reverseButton = false,
    bool isHorizontal = true,
  }) {
    if (primaryButtonText == null && secondaryButtonText == null) {
      return const SizedBox();
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(height: 24.h),
        isHorizontal
            ? reverseButton
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      if (secondaryButtonText != null)
                        Expanded(
                          child: InkWell(
                            onTap: secondaryOnTap ??
                                () {
                                  Get.back();
                                },
                            child: Container(
                              height: 48.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: AppTheme.colors.whiteColor4,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                secondaryButtonText,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mukta(
                                  color: AppTheme.colors.neutral500,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (primaryButtonText != null && secondaryButtonText != null) SizedBox(width: 12.w),
                      if (primaryButtonText != null)
                        Expanded(
                          child: InkWell(
                            onTap: primaryOnTap ??
                                () {
                                  Get.back();
                                },
                            child: Container(
                              height: 48.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: AppTheme.colors.secondaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                primaryButtonText,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mukta(
                                  color: AppTheme.colors.neutral500,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      if (primaryButtonText != null)
                        Expanded(
                          child: InkWell(
                            onTap: primaryOnTap ??
                                () {
                                  Get.back();
                                },
                            child: Container(
                              height: 48.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: AppTheme.colors.primaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                primaryButtonText,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mukta(
                                  color: AppTheme.colors.neutral500,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      if (primaryButtonText != null && secondaryButtonText != null) SizedBox(width: 12.w),
                      if (secondaryButtonText != null)
                        Expanded(
                          child: InkWell(
                            onTap: secondaryOnTap ??
                                () {
                                  Get.back();
                                },
                            child: Container(
                              height: 48.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: AppTheme.colors.neutral500,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                secondaryButtonText,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.mukta(
                                  color: AppTheme.colors.whiteColor4,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  )
            : reverseButton
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      if (secondaryButtonText != null)
                        InkWell(
                          onTap: secondaryOnTap ??
                              () {
                                Get.back();
                              },
                          child: Container(
                            height: 48.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: AppTheme.colors.whiteColor4,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              secondaryButtonText,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mukta(
                                color: AppTheme.colors.neutral500,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ),
                      if (primaryButtonText != null && secondaryButtonText != null) SizedBox(height: 12.w),
                      if (primaryButtonText != null)
                        InkWell(
                          onTap: primaryOnTap ??
                              () {
                                Get.back();
                              },
                          child: Container(
                            height: 48.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: AppTheme.colors.secondaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              primaryButtonText,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mukta(
                                color: AppTheme.colors.neutral500,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      if (primaryButtonText != null)
                        InkWell(
                          onTap: primaryOnTap ??
                              () {
                                Get.back();
                              },
                          child: Container(
                            height: 48.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: AppTheme.colors.primaryColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              primaryButtonText,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mukta(
                                color: AppTheme.colors.neutral500,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ),
                      if (primaryButtonText != null && secondaryButtonText != null) SizedBox(height: 12.w),
                      if (secondaryButtonText != null)
                        InkWell(
                          onTap: secondaryOnTap ??
                              () {
                                Get.back();
                              },
                          child: Container(
                            height: 48.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: AppTheme.colors.neutral500,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              secondaryButtonText,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.mukta(
                                color: AppTheme.colors.whiteColor4,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
      ],
    );
  }
}
