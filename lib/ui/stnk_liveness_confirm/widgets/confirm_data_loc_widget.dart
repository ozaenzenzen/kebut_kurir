import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';

class ConfirmDataLocWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final FutureOr<Iterable<String>> Function(String) suggestionsCallback;
  const ConfirmDataLocWidget({super.key, required this.controller, required this.suggestionsCallback, required this.label});

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
          decoration: BoxDecoration(
            color: AppTheme.colors.whiteColor4,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: TypeAheadFormField(
            textFieldConfiguration: TextFieldConfiguration(
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                isCollapsed: true,
                fillColor: AppTheme.colors.whiteColor4,
                hintText: label,
                hintStyle: AppTheme.textStyle.blackTextStyle.copyWith(
                  fontSize: AppTheme.textConfig.size.m,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 15.h),
              ),
            ),
            suggestionsCallback: suggestionsCallback,
            itemBuilder: (BuildContext context, String suggestion) {
              return ListTile(
                title: Text(suggestion),
              );
            },
            transitionBuilder: (BuildContext context, Widget suggestionsBox, AnimationController? controller) {
              return suggestionsBox;
            },
            onSuggestionSelected: (String suggestion) {
              controller.text = suggestion;
            },
            validator: (String? value) {
              if (value != null) {
                if (value.isEmpty) {
                  return '';
                }
              }
              return null;
            },
            onSaved: (String? value) => controller.text = value!,
          ),
        ),
      ],
    );
  }
}
