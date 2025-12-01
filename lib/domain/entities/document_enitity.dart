import 'dart:io';

class DocumentEntity {
  final File? firstApplicantPhoto;
  final File? firstApplicantNidFront;
  final File? firstApplicantNidBack;
  final File? firstApplicantSignature;
  final File? firstApplicantTinCertificate;
  final File? firstApplicantBankStatement;

  const DocumentEntity({
    required this.firstApplicantPhoto,
    required this.firstApplicantNidFront,
    required this.firstApplicantNidBack,
    required this.firstApplicantSignature,
    required this.firstApplicantTinCertificate,
    required this.firstApplicantBankStatement,
  });

  factory DocumentEntity.empty() {
    return const DocumentEntity(
      firstApplicantPhoto: null,
      firstApplicantNidFront: null,
      firstApplicantNidBack: null,
      firstApplicantSignature: null,
      firstApplicantTinCertificate: null,
      firstApplicantBankStatement: null,
    );
  }

  DocumentEntity copyWith({
    File? firstApplicantPhoto,
    File? firstApplicantNidFront,
    File? firstApplicantNidBack,
    File? firstApplicantSignature,
    File? firstApplicantTinCertificate,
    File? firstApplicantBankStatement,
  }) {
    return DocumentEntity(
      firstApplicantPhoto: firstApplicantPhoto ?? this.firstApplicantPhoto,
      firstApplicantNidFront: firstApplicantNidFront ?? this.firstApplicantNidFront,
      firstApplicantNidBack: firstApplicantNidBack ?? this.firstApplicantNidBack,
      firstApplicantSignature: firstApplicantSignature ?? this.firstApplicantSignature,
      firstApplicantTinCertificate: firstApplicantTinCertificate ?? this.firstApplicantTinCertificate,
      firstApplicantBankStatement: firstApplicantBankStatement ?? this.firstApplicantBankStatement,
    );
  }
}
