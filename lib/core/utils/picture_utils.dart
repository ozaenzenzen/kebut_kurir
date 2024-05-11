import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:kebut_kurir/core/utils/compress_utils.dart';

class ImageData {
  final String? fileName;
  final String? base64Value;
  String? filePath;

  ImageData({
    this.fileName,
    this.filePath,
    this.base64Value,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'fileName': fileName,
      'base64Value': base64Value,
    };
  }

  @override
  String toString() {
    return 'FileUploadResult{fileName: $fileName, base64Value: $base64Value, filePath: $filePath}';
  }

  static ImageData fromJson(Map<String, dynamic> json) {
    return ImageData(
      fileName: json['fileName'],
      base64Value: json['base64Value'],
    );
  }
}

class ImagePickerUtils {
  final ImagePicker _imagePicker = ImagePicker();
  ImageData? imageData;

  Future<void> setImageData(
    ImageSource imageSource, {
    int imageQuality = 100,
  }) async {
    try {
      final XFile? xFile = await _imagePicker.pickImage(
        source: imageSource,
        maxWidth: 1080,
        maxHeight: 1080,
        imageQuality: imageQuality,
      );

      if (xFile != null) {
        File pickedFile = File(xFile.path);
        String pickedFileName = pickedFile.path.split('/').last;
        Uint8List? img = await CompressionUtils.compressToMaxSize(pickedFile, 40000);
        pickedFile.writeAsBytesSync(img!);
        imageData = ImageData(
          fileName: pickedFileName,
          base64Value: base64Encode(img),
          filePath: pickedFile.path,
        );
      } else {
        imageData = null;
      }
    } catch (e) {
      imageData = null;
    }
  }

  ImageData? getImageData() => imageData;

  String getImageBase64(ImageData imageData) {
    String? imageType = imageData.fileName?.split('.').last;
    if (imageType != null) {
      return 'data:image/$imageType;base64,${imageData.base64Value}';
    }
    return '';
  }
}
