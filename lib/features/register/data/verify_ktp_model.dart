class VerifyKtpBodyModel {
  String? state;
  String? nik;
  String? fullname;
  String? national;
  String? placeOfBirth;
  String? dateOfBirth;
  String? uuidGenders;
  String? uuidMaritalStatus;
  String? uuidReligions;
  String? work;
  String? addressAccordingToId;
  String? rt;
  String? rw;
  String? uuidProvinces;
  String? uuidRegencies;
  String? uuidDistricts;
  String? uuidVillages;
  String? bloodType;

  VerifyKtpBodyModel(
      {this.state,
      this.nik,
      this.fullname,
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
      this.bloodType});

  VerifyKtpBodyModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    nik = json['nik'];
    fullname = json['fullname'];
    national = json['national'];
    placeOfBirth = json['place_of_birth'];
    dateOfBirth = json['date_of_birth'];
    uuidGenders = json['uuid_genders'];
    uuidMaritalStatus = json['uuid_marital_status'];
    uuidReligions = json['uuid_religions'];
    work = json['work'];
    addressAccordingToId = json['address_according_to_id'];
    rt = json['rt'];
    rw = json['rw'];
    uuidProvinces = json['uuid_provinces'];
    uuidRegencies = json['uuid_regencies'];
    uuidDistricts = json['uuid_districts'];
    uuidVillages = json['uuid_villages'];
    bloodType = json['blood_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['nik'] = this.nik;
    data['fullname'] = this.fullname;
    data['national'] = this.national;
    data['place_of_birth'] = this.placeOfBirth;
    data['date_of_birth'] = this.dateOfBirth;
    data['uuid_genders'] = this.uuidGenders;
    data['uuid_marital_status'] = this.uuidMaritalStatus;
    data['uuid_religions'] = this.uuidReligions;
    data['work'] = this.work;
    data['address_according_to_id'] = this.addressAccordingToId;
    data['rt'] = this.rt;
    data['rw'] = this.rw;
    data['uuid_provinces'] = this.uuidProvinces;
    data['uuid_regencies'] = this.uuidRegencies;
    data['uuid_districts'] = this.uuidDistricts;
    data['uuid_villages'] = this.uuidVillages;
    data['blood_type'] = this.bloodType;
    return data;
  }
}
