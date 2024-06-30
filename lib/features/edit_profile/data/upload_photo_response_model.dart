class UploadPhotoResponseModel {
  dynamic status;
  dynamic result;

  UploadPhotoResponseModel({
    required this.status,
    required this.result,
  });

  factory UploadPhotoResponseModel.fromJson(Map<String, dynamic> json) => UploadPhotoResponseModel(
        status: json['status'],
        result: json['result'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'status': status,
        'result': result,
      };
}