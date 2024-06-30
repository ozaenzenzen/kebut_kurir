import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebut_kurir/core/theme/app_theme.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/core/utils/picture_utils.dart';
import 'package:kebut_kurir/core/widgets/app_bar_widget.dart';
import 'package:kebut_kurir/core/widgets/asset_image_widget.dart';
import 'package:kebut_kurir/core/widgets/insert_photo_widget.dart';
import 'package:kebut_kurir/core/widgets/textfield_widget/underline_textfield_widget.dart';
import 'package:kebut_kurir/features/edit_profile/data/edit_profile_company_response_model.dart';
import 'package:kebut_kurir/features/edit_profile/data/request/edit_profile_company_request_model.dart';
import 'package:kebut_kurir/features/edit_profile/presentation/edit_profile_controller.dart';
import 'package:skeletons/skeletons.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: const AppBarWidget(
          title: 'Edit Profile',
        ),
        preferredSize: Size.fromHeight(56.h),
      ),
      body: GestureDetector(
        onTap: () {},
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4.h),
                    Container(
                      padding: EdgeInsets.all(12.h),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: const Color(0xffF5F6F7),
                      ),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Foto Profil',
                            style: AppTheme.textStyle.blackTextStyle.copyWith(
                              fontSize: AppTheme.textConfig.size.n,
                              fontWeight: AppTheme.textConfig.weight.regular,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Obx(() {
                            // return AssetImageWidget(
                            //   assets: 'assets/icon_person.png',
                            //   height: 30.h,
                            //   width: 30.h,
                            // );
                            return controller.imageProfile.value == ""
                                ? InsertPhotoWidget(
                                    isProfile: true,
                                    size: 50.h,
                                    onImageSelected: (ImageData imgResult) {
                                      // debugPrint('imageString ${imgResult.filePath}');
                                      // debugPrint('base64Value ${imgResult.base64Value}');
                                      // setState(() {
                                      controller.profileImage = imgResult;
                                      // });
                                    },
                                    placeholderWidget: CircleAvatar(
                                      backgroundColor: const Color(0xffD9D9D9),
                                      radius: 30.h,
                                      child: AssetImageWidget(
                                        assets: 'assets/icon_person.png',
                                        height: 30.h,
                                        width: 30.h,
                                      ),
                                    ),
                                  )
                                : controller.imageProfile.value.contains('http')
                                    ? InsertPhotoWidget(
                                        isProfile: true,
                                        size: 50.h,
                                        value: controller.imageProfile.value,
                                        // useValueBase64: true,
                                        onImageSelected: (ImageData imgResult) {
                                          // debugPrint('imageString ${imgResult.filePath}');
                                          // debugPrint('base64Value ${imgResult.base64Value}');
                                          controller.profileImage = imgResult;
                                        },
                                        placeholderWidget: CircleAvatar(
                                          backgroundColor: const Color(0xffD9D9D9),
                                          radius: 30.h,
                                          child: AssetImageWidget(
                                            assets: 'assets/icon_person.png',
                                            height: 30.h,
                                            width: 30.h,
                                          ),
                                        ),
                                      )
                                    : InsertPhotoWidget(
                                        isProfile: true,
                                        size: 50.h,
                                        value: controller.imageProfile.value,
                                        useValueBase64: true,
                                        onImageSelected: (ImageData imgResult) {
                                          // debugPrint('imageString ${imgResult.filePath}');
                                          // debugPrint('base64Value ${imgResult.base64Value}');
                                          controller.profileImage = imgResult;
                                        },
                                        placeholderWidget: CircleAvatar(
                                          backgroundColor: const Color(0xffD9D9D9),
                                          radius: 30.h,
                                          child: AssetImageWidget(
                                            assets: 'assets/icon_person.png',
                                            height: 30.h,
                                            width: 30.h,
                                          ),
                                        ),
                                      );
                          }),
                          SizedBox(height: 8.h),
                          InkWell(
                            onTap: () {
                              //
                            },
                            child: Text(
                              'Upload Foto',
                              style: AppTheme.textStyle.blackTextStyle.copyWith(
                                color: AppTheme.colors.secondaryColor3,
                                fontSize: AppTheme.textConfig.size.ml,
                                fontWeight: AppTheme.textConfig.weight.regular,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Nama Panggilan',
                      style: AppTheme.textStyle.blackTextStyle.copyWith(
                        fontSize: AppTheme.textConfig.size.ml,
                        fontWeight: AppTheme.textConfig.weight.regular,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Obx(() {
                      if (controller.getRemoteDataLoading.value) {
                        return SkeletonLine(
                          style: SkeletonLineStyle(
                            height: 14.h,
                            width: 100.w,
                            borderRadius: BorderRadius.circular(8.h),
                          ),
                        );
                      } else {
                        controller.namaPanggilanController.text = controller.resultUserData?.shortname ?? "";
                        return UnderlineTextFieldWidget(
                          // hintText: '',
                          label: 'hintText',
                          filled: true,
                          controller: controller.namaPanggilanController,
                          onChanged: (String value) {
                            // setState(() {
                            controller.fieldChanged = true;
                            // });
                          },
                        );
                      }
                    }),
                    SizedBox(height: 16.h),
                    Text(
                      'Email',
                      style: AppTheme.textStyle.blackTextStyle.copyWith(
                        fontSize: AppTheme.textConfig.size.ml,
                        fontWeight: AppTheme.textConfig.weight.regular,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Obx(() {
                      if (controller.getRemoteDataLoading.value) {
                        return SkeletonLine(
                          style: SkeletonLineStyle(
                            height: 14.h,
                            width: 100.w,
                            borderRadius: BorderRadius.circular(8.h),
                          ),
                        );
                      } else {
                        controller.emailController.text = controller.resultUserData!.email!;
                        return UnderlineTextFieldWidget(
                          // hintText: 'agungazharii@gmail.com',
                          label: 'example@email.com',
                          filled: true,
                          controller: controller.emailController,
                          onChanged: (String value) {
                            // setState(() {
                            controller.fieldChanged = true;
                            // });
                          },
                        );
                      }
                    }),
                    SizedBox(height: 16.h),
                    Text(
                      'No Handphone',
                      style: AppTheme.textStyle.blackTextStyle.copyWith(
                        fontSize: AppTheme.textConfig.size.ml,
                        fontWeight: AppTheme.textConfig.weight.regular,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Obx(() {
                      if (controller.getRemoteDataLoading.value) {
                        return SkeletonLine(
                          style: SkeletonLineStyle(
                            height: 14.h,
                            width: 100.w,
                            borderRadius: BorderRadius.circular(8.h),
                          ),
                        );
                      } else {
                        controller.noHandphoneController.text = controller.resultUserData!.handphone ?? "";
                        return UnderlineTextFieldWidget(
                          prefixIcon: Container(
                            padding: EdgeInsets.all(10.h),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  '+62',
                                  style: AppTheme.textStyle.blackTextStyle.copyWith(
                                    fontSize: AppTheme.textConfig.size.ml,
                                    fontWeight: AppTheme.textConfig.weight.regular,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Container(
                                  width: 1.w,
                                  height: 20,
                                  color: const Color(0xff86909C),
                                ),
                              ],
                            ),
                          ),
                          // hintText: '811222333444',
                          hintText: '',
                          keyboardType: TextInputType.phone,
                          label: '811222333444',
                          filled: true,
                          controller: controller.noHandphoneController,
                          onChanged: (String value) {
                            controller.fieldChanged = true;
                          },
                        );
                      }
                    }),
                    SizedBox(height: 16.h),
                    Text(
                      'Alamat Lengkap',
                      style: AppTheme.textStyle.blackTextStyle.copyWith(
                        fontSize: AppTheme.textConfig.size.ml,
                        fontWeight: AppTheme.textConfig.weight.regular,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Obx(() {
                      if (controller.getRemoteDataLoading.value) {
                        return SkeletonLine(
                          style: SkeletonLineStyle(
                            height: 14.h,
                            width: 100.w,
                            borderRadius: BorderRadius.circular(8.h),
                          ),
                        );
                      } else {
                        controller.alamatController.text = controller.resultUserData!.addressAccordingToId ?? "";
                        return UnderlineTextFieldWidget(
                          // hintText: 'Jl. Duren Sawit, RT.11/RW.12, duren sawit, Kec. Rawamangun, Kota Jakarta Timur, DKI Jakarta, 12820',
                          label: 'Address',
                          filled: true,
                          maxLines: null,
                          controller: controller.alamatController,
                          onChanged: (String value) {
                            // setState(() {
                            controller.fieldChanged = true;
                            // });
                          },
                        );
                      }
                    }),
                  ],
                ),
              ),
            )),
            InkWell(
              onTap: () async {
                // await controller.editProfile(
                //   requestData: EditProfileCompanyRequestModel(),
                //   onSuccess: (data) {
                //     DialogsUtils().showSuccessDialog(
                //       title: 'Berhasil',
                //       description: "Selamat edit profil telah berhasil",
                //       context: context,
                //       isDismissible: true,
                //       primaryButtonText: 'Kembali',
                //       primaryOnTap: () {
                //         Get.back();
                //       },
                //     );
                //   },
                //   onFailed: (errorMessage) {
                //     DialogsUtils().showFailedDialog(
                //       context: context,
                //       title: 'Terjadi kesalahan',
                //       description: errorMessage,
                //       primaryButtonText: 'Kembali',
                //       primaryOnTap: () {
                //         Get.back();
                //       },
                //     );
                //   },
                // );
                if (controller.profileImage == null) {
                  if (controller.fieldChanged == true) {
                    await controller.editProfile(
                      data: EditProfileCompanyRequestModel(
                        shortname: controller.namaPanggilanController.text,
                        email: controller.emailController.text,
                        handphone: controller.noHandphoneController.text,
                        // addressAccordingToId: '',
                      ),
                      onSuccess: (EditProfileCompanyResponseModel data) {
                        DialogsUtils().showSuccessDialog(
                          context: context,
                          title: 'Berhasil',
                          description: 'Profil kamu berhasil diperbarui',
                          descriptionColor: const Color(0xff616E7C),
                        );
                      },
                      onFailed: (String errorMessage) {
                        DialogsUtils().showFailedDialog(
                          context: context,
                          title: 'Error',
                          description: errorMessage,
                          descriptionColor: const Color(0xff616E7C),
                        );
                      },
                    );
                  } else {
                    DialogsUtils().showFailedDialog(
                      context: context,
                      title: 'Error',
                      description: 'Silakan ganti foto terlebih dahulu',
                      descriptionColor: const Color(0xff616E7C),
                    );
                  }
                } else {
                  // debugPrint('profileImage $profileImage');
                  if (controller.fieldChanged == true) {
                    await controller.editProfile(
                      data: EditProfileCompanyRequestModel(
                        shortname: controller.namaPanggilanController.text,
                        email: controller.emailController.text,
                        handphone: controller.noHandphoneController.text,
                        // addressAccordingToId: '',
                      ),
                      onSuccess: (EditProfileCompanyResponseModel data) {
                        DialogsUtils().showSuccessDialog(
                          context: context,
                          title: 'Berhasil',
                          description: 'Profil kamu berhasil diperbarui',
                          descriptionColor: const Color(0xff616E7C),
                        );
                      },
                      onFailed: (String errorMessage) {
                        DialogsUtils().showFailedDialog(
                          context: context,
                          title: 'Error',
                          description: errorMessage,
                          descriptionColor: const Color(0xff616E7C),
                        );
                      },
                    );
                  }
                  await controller.uploadPhotoProfile(
                    controller.profileImage!,
                    onSuccess: () {
                      DialogsUtils().showSuccessDialog(
                        context: context,
                        title: 'Berhasil',
                        description: 'Profil kamu berhasil diperbarui',
                        descriptionColor: const Color(0xff616E7C),
                      );
                    },
                    onFailed: (String errorMessage) {
                      DialogsUtils().showFailedDialog(
                        context: context,
                        title: 'Error',
                        description: errorMessage,
                        descriptionColor: const Color(0xff616E7C),
                      );
                    },
                  );
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 48.h,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFF00),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Edit',
                  style: GoogleFonts.mukta(
                    color: const Color(0xFF42526D),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
