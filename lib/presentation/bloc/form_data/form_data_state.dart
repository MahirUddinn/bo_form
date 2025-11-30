part of 'form_data_cubit.dart';

class FormDataState {
  final AccountHolderEntity accountHolderEntity;
  final BankInfoEntity bankInfoEntity;
  final AuthorizeEntity authorizeEntity;

  const FormDataState({
    required this.accountHolderEntity,
    required this.bankInfoEntity,
    required this.authorizeEntity,
  });

  FormDataState copyWith({
    AccountHolderEntity? accountHolderEntity,
    BankInfoEntity? bankInfoEntity,
    AuthorizeEntity? authorizeEntity,
  }) {
    return FormDataState(
      accountHolderEntity: accountHolderEntity ?? this.accountHolderEntity,
      bankInfoEntity: bankInfoEntity ?? this.bankInfoEntity,
      authorizeEntity: authorizeEntity ?? this.authorizeEntity,
    );
  }
}
