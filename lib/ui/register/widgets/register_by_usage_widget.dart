import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kebut_kurir/features/register/presentation/register_controller.dart';
import 'package:kebut_kurir/ui/register/widgets/register_textfield.dart';

class RegisterByUsageWidget extends StatelessWidget {
  final RegisterController controller;
  const RegisterByUsageWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        RegisterTextField(
          label: 'Email Perusahaan',
          controller: controller.tecEmailPt,
          hint: 'Masukkan Email Perushaan',
        ),
        SizedBox(height: 16.h),
        RegisterTextField(
          controller: controller.tecAlamatPt,
          label: 'Alamat Perusahaan',
          hint: 'Masukkan Alamat Perusahaan',
        ),
        SizedBox(height: 16.h),
        RegisterTextField(
          controller: controller.tecNomorPt,
          label: 'Nomor Tlp Perusahaan',
          hint: 'Masukkan Nomor Tlp Perusahaan',
        ),
      ],
    );
  }
}
