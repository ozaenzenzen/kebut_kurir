import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';


class ConfirmDataDropDownWidget extends StatelessWidget {
  final String label;
  final String hint;
  final String valueList;
  final void Function(String?)? onChanged;
  final List<String> listMenu;
  const ConfirmDataDropDownWidget(
      {super.key, required this.label, required this.hint, required this.listMenu, required this.valueList, this.onChanged});

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
        SizedBox(height: 8.h),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 44.h,
          padding: const EdgeInsets.only(left: 5, right: 10),
          decoration: BoxDecoration(
            color: AppTheme.colors.whiteColor4,
            borderRadius: BorderRadius.circular(4),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
                value: valueList != '' ? valueList : null,
                hint: Text(
                  hint,
                  style: AppTheme.textStyle.blackTextStyle.copyWith(
                    fontSize: AppTheme.textConfig.size.ssm,
                    fontWeight: AppTheme.textConfig.weight.medium,
                  ),
                ),
                items: List.generate(
                  listMenu.length,
                  (int index) => DropdownMenuItem<String>(
                    value: listMenu[index],
                    child: Text(
                      listMenu[index],
                      style: AppTheme.textStyle.blackTextStyle.copyWith(
                        fontSize: AppTheme.textConfig.size.ssm,
                        fontWeight: AppTheme.textConfig.weight.medium,
                      ),
                    ),
                  ),
                ),
                onChanged: onChanged),
          ),
        ),
      ],
    );
  }
}
