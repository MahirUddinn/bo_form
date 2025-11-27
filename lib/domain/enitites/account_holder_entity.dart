class AccountHolderEntity {
  final String boType;
  final String referral;
  final String clientType;
  final String courtesyTitle;
  final String firstName;
  final String lastName;
  final String occupation;
  final DateTime dob;
  final String fatherName;
  final String motherName;
  final String addressLine1;
  final String addressLine2;
  final String addressLine3;
  final String city;
  final String postCode;
  final String district;
  final String country;
  final String mobileNumber;
  final String email;
  final String telephone;
  final String fax;
  final String nationality;
  final String nid;
  final String tin;
  final String brokerOffice;
  final String residentialStatus;
  final String gender;
  final bool isOfficerOrDirectorOrAuthorizedRepresentative;

  const AccountHolderEntity({
    required this.boType,
    required this.referral,
    required this.clientType,
    required this.courtesyTitle,
    required this.firstName,
    required this.lastName,
    required this.occupation,
    required this.dob,
    required this.fatherName,
    required this.motherName,
    required this.addressLine1,
    required this.addressLine2,
    required this.addressLine3,
    required this.city,
    required this.postCode,
    required this.district,
    required this.country,
    required this.mobileNumber,
    required this.email,
    required this.telephone,
    required this.fax,
    required this.nationality,
    required this.nid,
    required this.tin,
    required this.brokerOffice,
    required this.residentialStatus,
    required this.gender,
    required this.isOfficerOrDirectorOrAuthorizedRepresentative,
  });

  AccountHolderEntity copyWith({
    String? boType,
    String? referral,
    String? clientType,
    String? courtesyTitle,
    String? firstName,
    String? lastName,
    String? occupation,
    DateTime? dob,
    String? fatherName,
    String? motherName,
    String? addressLine1,
    String? addressLine2,
    String? addressLine3,
    String? city,
    String? postCode,
    String? district,
    String? country,
    String? mobileNumber,
    String? email,
    String? telephone,
    String? fax,
    String? nationality,
    String? nid,
    String? tin,
    String? brokerOffice,
    String? residentialStatus,
    String? gender,
    bool? isOfficerOrDirectorOrAuthorizedRepresentative,
  }) {
    return AccountHolderEntity(
      boType: boType ?? this.boType,
      referral: referral ?? this.referral,
      clientType: clientType ?? this.clientType,
      courtesyTitle: courtesyTitle ?? this.courtesyTitle,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      occupation: occupation ?? this.occupation,
      dob: dob ?? this.dob,
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
      addressLine1: addressLine1 ?? this.addressLine1,
      addressLine2: addressLine2 ?? this.addressLine2,
      addressLine3: addressLine3 ?? this.addressLine3,
      city: city ?? this.city,
      postCode: postCode ?? this.postCode,
      district: district ?? this.district,
      country: country ?? this.country,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      email: email ?? this.email,
      telephone: telephone ?? this.telephone,
      fax: fax ?? this.fax,
      nationality: nationality ?? this.nationality,
      nid: nid ?? this.nid,
      tin: tin ?? this.tin,
      brokerOffice: brokerOffice ?? this.brokerOffice,
      residentialStatus: residentialStatus ?? this.residentialStatus,
      gender: gender ?? this.gender,
      isOfficerOrDirectorOrAuthorizedRepresentative:
      isOfficerOrDirectorOrAuthorizedRepresentative ??
          this.isOfficerOrDirectorOrAuthorizedRepresentative,
    );
  }

  @override
  String toString() {
    return 'AccountHolderEntity(boType: $boType, referral: $referral, clientType: $clientType, courtesyTitle: $courtesyTitle, firstName: $firstName, lastName: $lastName, occupation: $occupation, dob: $dob, fatherName: $fatherName, motherName: $motherName, addressLine1: $addressLine1, addressLine2: $addressLine2, addressLine3: $addressLine3, city: $city, postCode: $postCode, district: $district, country: $country, mobileNumber: $mobileNumber, email: $email, telephone: $telephone, fax: $fax, nationality: $nationality, nid: $nid, tin: $tin, brokerOffice: $brokerOffice, residentialStatus: $residentialStatus, gender: $gender, isOfficerOrDirectorOrAuthorizedRepresentative: $isOfficerOrDirectorOrAuthorizedRepresentative)';
  }
}