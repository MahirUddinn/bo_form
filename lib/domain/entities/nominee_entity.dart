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

  // Guardian fields
  final String guardianCourtesyTitle;
  final String guardianFirstName;
  final String guardianLastName;
  final String guardianRelationship;
  final String guardianDateOfMaturity;

  final String guardianResidentialStatus;
  final String guardianDateOfBirth;
  final String guardianNid;
  final String guardianAddressLine1;
  final String guardianAddressLine2;
  final String guardianAddressLine3;
  final String guardianCity;
  final String guardianPostCode;
  final String guardianDivision;
  final String guardianCountry;
  final String guardianMobileNumber;
  final String guardianEmail;
  final String guardianTelephone;
  final String guardianFax;

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
    required this.guardianCourtesyTitle,
    required this.guardianFirstName,
    required this.guardianLastName,
    required this.guardianRelationship,
    required this.guardianDateOfMaturity,
    required this.guardianResidentialStatus,
    required this.guardianDateOfBirth,
    required this.guardianNid,
    required this.guardianAddressLine1,
    required this.guardianAddressLine2,
    required this.guardianAddressLine3,
    required this.guardianCity,
    required this.guardianPostCode,
    required this.guardianDivision,
    required this.guardianCountry,
    required this.guardianMobileNumber,
    required this.guardianEmail,
    required this.guardianTelephone,
    required this.guardianFax,
  });

  factory NomineeEntity.empty() {
    return const NomineeEntity(
      courtesyTitle: '',
      firstName: '',
      lastName: '',
      relationship: '',
      percentage: '',
      residentialStatus: '',
      dateOfBirth: '',
      nid: '',
      addressLine1: '',
      addressLine2: '',
      addressLine3: '',
      city: '',
      postCode: '',
      division: '',
      country: '',
      mobileNumber: '',
      email: '',
      telephone: '',
      fax: '',
      isNomineeMinor: false,
      guardianCourtesyTitle: '',
      guardianFirstName: '',
      guardianLastName: '',
      guardianRelationship: '',
      guardianDateOfMaturity: '',
      guardianResidentialStatus: '',
      guardianDateOfBirth: '',
      guardianNid: '',
      guardianAddressLine1: '',
      guardianAddressLine2: '',
      guardianAddressLine3: '',
      guardianCity: '',
      guardianPostCode: '',
      guardianDivision: '',
      guardianCountry: '',
      guardianMobileNumber: '',
      guardianEmail: '',
      guardianTelephone: '',
      guardianFax: '',
    );
  }

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
    String? guardianCourtesyTitle,
    String? guardianFirstName,
    String? guardianLastName,
    String? guardianRelationship,
    String? guardianDateOfMaturity,
    String? guardianResidentialStatus,
    String? guardianDateOfBirth,
    String? guardianNid,
    String? guardianAddressLine1,
    String? guardianAddressLine2,
    String? guardianAddressLine3,
    String? guardianCity,
    String? guardianPostCode,
    String? guardianDivision,
    String? guardianCountry,
    String? guardianMobileNumber,
    String? guardianEmail,
    String? guardianTelephone,
    String? guardianFax,
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
      guardianCourtesyTitle:
          guardianCourtesyTitle ?? this.guardianCourtesyTitle,
      guardianFirstName: guardianFirstName ?? this.guardianFirstName,
      guardianLastName: guardianLastName ?? this.guardianLastName,
      guardianRelationship: guardianRelationship ?? this.guardianRelationship,
      guardianDateOfMaturity:
          guardianDateOfMaturity ?? this.guardianDateOfMaturity,
      guardianResidentialStatus:
          guardianResidentialStatus ?? this.guardianResidentialStatus,
      guardianDateOfBirth: guardianDateOfBirth ?? this.guardianDateOfBirth,
      guardianNid: guardianNid ?? this.guardianNid,
      guardianAddressLine1: guardianAddressLine1 ?? this.guardianAddressLine1,
      guardianAddressLine2: guardianAddressLine2 ?? this.guardianAddressLine2,
      guardianAddressLine3: guardianAddressLine3 ?? this.guardianAddressLine3,
      guardianCity: guardianCity ?? this.guardianCity,
      guardianPostCode: guardianPostCode ?? this.guardianPostCode,
      guardianDivision: guardianDivision ?? this.guardianDivision,
      guardianCountry: guardianCountry ?? this.guardianCountry,
      guardianMobileNumber: guardianMobileNumber ?? this.guardianMobileNumber,
      guardianEmail: guardianEmail ?? this.guardianEmail,
      guardianTelephone: guardianTelephone ?? this.guardianTelephone,
      guardianFax: guardianFax ?? this.guardianFax,
    );
  }
}
