class NomineeEntity {
  final String courtesyTitle;
  final String firstName;
  final String lastName;
  final String relationship;
  final String percentage;
  final String residentialStatus;
  final String dateOfBirth;
  final String nid;
  final String addressLine1;
  final String addressLine2;
  final String addressLine3;
  final String city;
  final String postCode;
  final String division;
  final String country;
  final String mobileNumber;
  final String email;
  final String telephone;
  final String fax;
  final bool isNomineeMinor;
  final bool isSecondNomineeAvailable;

  const NomineeEntity({
    required this.courtesyTitle,
    required this.firstName,
    required this.lastName,
    required this.relationship,
    required this.percentage,
    required this.residentialStatus,
    required this.dateOfBirth,
    required this.nid,
    required this.addressLine1,
    required this.addressLine2,
    required this.addressLine3,
    required this.city,
    required this.postCode,
    required this.division,
    required this.country,
    required this.mobileNumber,
    required this.email,
    required this.telephone,
    required this.fax,
    required this.isNomineeMinor,
    required this.isSecondNomineeAvailable,
  });

  NomineeEntity copyWith({
    String? courtesyTitle,
    String? firstName,
    String? lastName,
    String? relationship,
    String? percentage,
    String? residentialStatus,
    String? dateOfBirth,
    String? nid,
    String? addressLine1,
    String? addressLine2,
    String? addressLine3,
    String? city,
    String? postCode,
    String? division,
    String? country,
    String? mobileNumber,
    String? email,
    String? telephone,
    String? fax,
    bool? isNomineeMinor,
    bool? isSecondNomineeAvailable,
  }) {
    return NomineeEntity(
      courtesyTitle: courtesyTitle ?? this.courtesyTitle,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      relationship: relationship ?? this.relationship,
      percentage: percentage ?? this.percentage,
      residentialStatus: residentialStatus ?? this.residentialStatus,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      nid: nid ?? this.nid,
      addressLine1: addressLine1 ?? this.addressLine1,
      addressLine2: addressLine2 ?? this.addressLine2,
      addressLine3: addressLine3 ?? this.addressLine3,
      city: city ?? this.city,
      postCode: postCode ?? this.postCode,
      division: division ?? this.division,
      country: country ?? this.country,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      email: email ?? this.email,
      telephone: telephone ?? this.telephone,
      fax: fax ?? this.fax,
      isNomineeMinor: isNomineeMinor ?? this.isNomineeMinor,
      isSecondNomineeAvailable:
          isSecondNomineeAvailable ?? this.isSecondNomineeAvailable,
    );
  }
}
