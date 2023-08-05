import 'package:flutter/material.dart';

import 'package:kebut_kurir/core/theme/app_theme.dart';

class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppTheme.colors.whiteColor,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              strokeWidth: 3,
              color: AppTheme.colors.primaryColor,
            ),
            const SizedBox(
              height: 16,
            ),
            Material(
              type: MaterialType.transparency,
              child: Text(
                'Harap tunggu...',
                style: AppTheme.textStyle.primaryTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
