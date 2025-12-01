class BankInfoEntity {
  final String bankName;
  final String bankBranch;
  final String bankDistrict;
  final String bankAccountNumber;

  const BankInfoEntity({
    required this.bankName,
    required this.bankBranch,
    required this.bankDistrict,
    required this.bankAccountNumber,
  });

  factory BankInfoEntity.empty() {
    return const BankInfoEntity(
      bankName: "",
      bankBranch: "",
      bankDistrict: "",
      bankAccountNumber: "",
    );
  }

  BankInfoEntity copyWith({
    String? bankName,
    String? bankBranch,
    String? bankDistrict,
    String? bankAccountNumber,
  }) {
    return BankInfoEntity(
      bankName: bankName ?? this.bankName,
      bankBranch: bankBranch ?? this.bankBranch,
      bankDistrict: bankDistrict ?? this.bankDistrict,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
    );
  }
}
