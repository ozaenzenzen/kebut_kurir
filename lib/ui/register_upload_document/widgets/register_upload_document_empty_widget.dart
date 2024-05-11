import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';

class RegisterUploadDocumentEmptyWidget extends StatelessWidget {
  final Size size;
  final Function() onTap;
  final String title, description, placeHolderText;
  final String? imagePath;
  const RegisterUploadDocumentEmptyWidget({
    super.key,
    required this.size,
    required this.onTap,
    required this.title,
    required this.description,
    required this.placeHolderText,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '$title ',
                    style: AppTheme.textStyle.blackTextStyle.copyWith(
                      color: AppTheme.colors.blackColor2,
                      fontSize: AppTheme.textConfig.size.m,
                      fontWeight: AppTheme.textConfig.weight.regular,
                      height: 1.14,
                    ),
                  ),
                  TextSpan(
                    text: '(Wajib)',
                    style: AppTheme.textStyle.blackTextStyle.copyWith(
                      color: AppTheme.colors.greyColor3,
                      fontSize: AppTheme.textConfig.size.m,
                      fontWeight: AppTheme.textConfig.weight.regular,
                      height: 1.14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: ShapeDecoration(
                color: const Color(0xFFF5F6F7),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt,
                    size: 25.w,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    placeHolderText,
                    style: AppTheme.textStyle.blackTextStyle.copyWith(
                      color: AppTheme.colors.blackColor2,
                      fontSize: AppTheme.textConfig.size.n,
                      fontWeight: AppTheme.textConfig.weight.regular,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            SizedBox(
              width: double.infinity,
              child: Text(
                description,
                style: AppTheme.textStyle.blackTextStyle.copyWith(
                  color: AppTheme.colors.greyColor3,
                  fontSize: AppTheme.textConfig.size.m,
                  fontWeight: AppTheme.textConfig.weight.regular,
                  height: 1.33,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
