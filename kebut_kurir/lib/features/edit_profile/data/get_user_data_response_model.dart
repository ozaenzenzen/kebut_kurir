class GetUserDataResponseModel {
  int? status;
  List<ResultUserData>? result;

  GetUserDataResponseModel({
    this.status,
    this.result,
  });

  factory GetUserDataResponseModel.fromJson(Map<String, dynamic> json) => GetUserDataResponseModel(
        status: json['status'],
        result: json['result'] == null
            ? null
            : List<ResultUserData>.from(
                json['result'].map(
                  // ignore: always_specify_types
                  (x) => ResultUserData.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'status': status,
        'result': List<dynamic>.from(
          result!.map(
            (ResultUserData x) => x.toJson(),
          ),
        ),
      };
}

class ResultUserData {
  String? uuidUsers;
  String? email;
  String? uuidTypeCustomers;
  String? photoProfile;
  dynamic nik;
  String? handphone;
  dynamic fullname;
  String? shortname;
  dynamic national;
  dynamic placeOfBirth;
  dynamic dateOfBirth;
  dynamic uuidGenders;
  dynamic uuidMaritalStatus;
  dynamic uuidReligions;
  dynamic work;
  String? addressAccordingToId;
  dynamic rt;
  dynamic rw;
  dynamic uuidProvinces;
  dynamic uuidRegencies;
  dynamic uuidDistricts;
  dynamic uuidVillages;
  dynamic bloodType;
  List<Company>? company;

  ResultUserData({
    this.uuidUsers,
    this.email,
    this.uuidTypeCustomers,
    this.photoProfile,
    this.nik,
    this.handphone,
    this.fullname,
    this.shortname,
    this.national,
    this.placeOfBirth,
    this.dateOfBirth,
    this.uuidGenders,
    this.uuidMaritalStatus,
    this.uuidReligions,
    this.work,
    this.addressAccordingToId,
    this.rt,
    this.rw,
    this.uuidProvinces,
    this.uuidRegencies,
    this.uuidDistricts,
    this.uuidVillages,
    this.bloodType,
    this.company,
  });

  factory ResultUserData.fromJson(Map<String, dynamic> json) => ResultUserData(
        uuidUsers: json['uuid_users'],
        email: json['email'],
        uuidTypeCustomers: json['uuid_type_customers'],
        photoProfile: json['photo_profile'],
        nik: json['nik'],
        handphone: json['handphone'],
        fullname: json['fullname'],
        shortname: json['shortname'],
        national: json['national'],
        placeOfBirth: json['place_of_birth'],
        dateOfBirth: json['date_of_birth'],
        uuidGenders: json['uuid_genders'],
        uuidMaritalStatus: json['uuid_marital_status'],
        uuidReligions: json['uuid_religions'],
        work: json['work'],
        addressAccordingToId: json['address_according_to_id'],
        rt: json['rt'],
        rw: json['rw'],
        uuidProvinces: json['uuid_provinces'],
        uuidRegencies: json['uuid_regencies'],
        uuidDistricts: json['uuid_districts'],
        uuidVillages: json['uuid_villages'],
        bloodType: json['blood_type'],
        company: json['company'] == null
            ? null
            : List<Company>.from(
                json['company'].map(
                  // ignore: always_specify_types
                  (x) => Company.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'uuid_users': uuidUsers,
        'email': email,
        'uuid_type_customers': uuidTypeCustomers,
        'photo_profile': photoProfile,
        'nik': nik,
        'handphone': handphone,
        'fullname': fullname,
        'shortname': shortname,
        'national': national,
        'place_of_birth': placeOfBirth,
        'date_of_birth': dateOfBirth,
        'uuid_genders': uuidGenders,
        'uuid_marital_status': uuidMaritalStatus,
        'uuid_religions': uuidReligions,
        'work': work,
        'address_according_to_id': addressAccordingToId,
        'rt': rt,
        'rw': rw,
        'uuid_provinces': uuidProvinces,
        'uuid_regencies': uuidRegencies,
        'uuid_districts': uuidDistricts,
        'uuid_villages': uuidVillages,
        'blood_type': bloodType,
        'company': List<dynamic>.from(
          company!.map(
            (Company x) => x.toJson(),
          ),
        ),
      };
}

class Company {
  dynamic officeEmail;
  dynamic officeAddress;
  dynamic officePhone;

  Company({
    this.officeEmail,
    this.officeAddress,
    this.officePhone,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        officeEmail: json['office_email'],
        officeAddress: json['office_address'],
        officePhone: json['office_phone'],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'office_email': officeEmail,
        'office_address': officeAddress,
        'office_phone': officePhone,
      };
}
