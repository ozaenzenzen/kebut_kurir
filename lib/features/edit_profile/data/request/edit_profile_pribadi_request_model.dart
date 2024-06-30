class EditProfilePribadiRequestModel {
  String shortname;
  String email;
  String handphone;
  String addressAccordingToId;

  EditProfilePribadiRequestModel({
    required this.shortname,
    required this.email,
    required this.handphone,
    required this.addressAccordingToId,
  });

  factory EditProfilePribadiRequestModel.fromJson(Map<String, dynamic> json) => EditProfilePribadiRequestModel(
        shortname: json['shortname'],
        email: json['email'],
        handphone: json['handphone'],
        addressAccordingToId: json['address_according_to_id'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'shortname': shortname,
        'email': email,
        'handphone': handphone,
        'address_according_to_id': addressAccordingToId,
      };
}
