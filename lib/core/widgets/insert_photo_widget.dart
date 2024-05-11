import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kebut_kurir/core/utils/dialog_utils.dart';
import 'package:kebut_kurir/core/utils/picture_utils.dart';

class InsertPhotoWidget extends StatefulWidget {
  final double size;
  final String? value;
  final bool useValueBase64;
  final Widget placeholderWidget;
  // final Function(String filePath, String base64Image)? onImageSelected;
  final Function(ImageData imageData)? onImageSelected;

  final bool isProfile;
  const InsertPhotoWidget({
    Key? key,
    this.value,
    this.useValueBase64 = false,
    this.onImageSelected,
    required this.size,
    this.isProfile = false,
    required this.placeholderWidget,
  }) : super(key: key);

  @override
  State<InsertPhotoWidget> createState() => _InsertPhotoWidgetState();
}

class _InsertPhotoWidgetState extends State<InsertPhotoWidget> {
  final ImagePickerUtils _profilePictureUtils = ImagePickerUtils();
  final DialogsUtils _dialogsUtils = DialogsUtils();
  ImageData? imageData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTypeImagePicker(),
      child: pictureWidget(),
    );
  }

  Widget pictureWidget() {
    if (imageData != null) {
      return widget.isProfile
          ? Container(
              width: widget.size.w,
              height: widget.size.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: MemoryImage(base64Decode(imageData!.base64Value!)),
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
              ),
            )
          : Container(
              width: widget.size,
              height: 108.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: MemoryImage(base64Decode(imageData!.base64Value!)),
                  fit: BoxFit.cover,
                ),
              ),
            );
    } else if (widget.value != null && widget.value != '') {
      if (widget.useValueBase64) {
        return Container(
          width: widget.size.w,
          height: widget.size.w,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: MemoryImage(base64Decode(widget.value!)),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
          ),
        );
      } else {
        return CachedNetworkImage(
          imageUrl: widget.value!,
          width: widget.size,
          imageBuilder: (BuildContext context, ImageProvider<Object> imageProvider) => Container(
            width: widget.size.w,
            height: widget.size.w,
            // width: 79.w,
            // height: 108.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,
            ),
          ),
          height: widget.size,
          errorWidget: (BuildContext context, String url, dynamic error) => Image.network(
            'https://icon-library.com/images/default-profile-icon/default-profile-icon-24.jpg',
            width: widget.size,
            height: widget.size,
          ),
        );
      }
    } else {
      return widget.placeholderWidget;
    }
  }

  void processImage() {
    ImageData? imgResult = _profilePictureUtils.getImageData();
    if (imgResult != null) {
      if (widget.onImageSelected != null) {
        // widget.onImageSelected!(imgResult.filePath!, imgResult.base64Value!);
        widget.onImageSelected!(imgResult);
      }
      setState(() {
        imageData = imgResult;
      });
    }
  }

  void selectTypeImagePicker() async {
    Get.bottomSheet(
      Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextButton(
            child: const Text('Select Image From Gallery'),
            onPressed: () async {
              _dialogsUtils.showLoading();
              await _profilePictureUtils.setImageData(ImageSource.gallery).whenComplete(() {
                processImage();
                Get.back();
              });
              _dialogsUtils.hideLoading();
            },
          ),
          TextButton(
            child: const Text('Select Image From Camera'),
            onPressed: () async {
              _dialogsUtils.showLoading();
              await _profilePictureUtils.setImageData(ImageSource.camera).whenComplete(() {
                processImage();
                Get.back();
              });
              _dialogsUtils.hideLoading();
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
