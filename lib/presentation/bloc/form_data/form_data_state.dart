part of 'form_data_cubit.dart';

class FormDataState {
  final AccountHolderEntity accountHolderEntity;
  final BankInfoEntity bankInfoEntity;
  final AuthorizeEntity authorizeEntity;
  final List<NomineeEntity> nominees;
  final bool isSecondNomineeAvailable;

  const FormDataState({
    required this.accountHolderEntity,
    required this.bankInfoEntity,
    required this.authorizeEntity,
    required this.nominees,
    this.isSecondNomineeAvailable = false,
  });

  FormDataState copyWith({
    AccountHolderEntity? accountHolderEntity,
    BankInfoEntity? bankInfoEntity,
    AuthorizeEntity? authorizeEntity,
    List<NomineeEntity>? nominees,
    bool? isSecondNomineeAvailable,
  }) {
    return FormDataState(
      accountHolderEntity: accountHolderEntity ?? this.accountHolderEntity,
      bankInfoEntity: bankInfoEntity ?? this.bankInfoEntity,
      authorizeEntity: authorizeEntity ?? this.authorizeEntity,
      nominees: nominees ?? this.nominees,
      isSecondNomineeAvailable:
          isSecondNomineeAvailable ?? this.isSecondNomineeAvailable,
    );
  }
}
