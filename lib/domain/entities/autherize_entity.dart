class AuthorizeEntity {
  final String courtesyTitle;
  final String firstName;
  final String lastName;
  final String occupation;
  final String dateOfBirth;
  final String fatherName;
  final String motherName;
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
  final String nid;

  const AuthorizeEntity({
    required this.courtesyTitle,
    required this.firstName,
    required this.lastName,
    required this.occupation,
    required this.dateOfBirth,
    required this.fatherName,
    required this.motherName,
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
    required this.nid,
  });

  factory AuthorizeEntity.empty() {
    return const AuthorizeEntity(
      courtesyTitle: "",
      firstName: "",
      lastName: "",
      occupation: "",
      dateOfBirth: "",
      fatherName: "",
      motherName: "",
      addressLine1: "",
      addressLine2: "",
      addressLine3: "",
      city: "",
      postCode: "",
      division: "",
      country: "",
      mobileNumber: "",
      email: "",
      telephone: "",
      fax: "",
      nid: "",
    );
  }

  AuthorizeEntity copyWith({
    String? courtesyTitle,
    String? firstName,
    String? lastName,
    String? occupation,
    String? dateOfBirth,
    String? fatherName,
    String? motherName,
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
    String? nid,
  }) {
    return AuthorizeEntity(
      courtesyTitle: courtesyTitle ?? this.courtesyTitle,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      occupation: occupation ?? this.occupation,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      fatherName: fatherName ?? this.fatherName,
      motherName: motherName ?? this.motherName,
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
      nid: nid ?? this.nid,
    );
  }
}