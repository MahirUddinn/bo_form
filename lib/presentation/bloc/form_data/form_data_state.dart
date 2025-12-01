part of 'form_data_cubit.dart';

class FormDataState {
  final AccountHolderEntity accountHolderEntity;
  final BankInfoEntity bankInfoEntity;
  final AuthorizeEntity authorizeEntity;
  final List<NomineeEntity> nomineeEntities;

  const FormDataState({
    required this.accountHolderEntity,
    required this.bankInfoEntity,
    required this.authorizeEntity,
    required this.nomineeEntities
  });

  FormDataState copyWith({
    AccountHolderEntity? accountHolderEntity,
    BankInfoEntity? bankInfoEntity,
    AuthorizeEntity? authorizeEntity,
    List<NomineeEntity>? nomineeEntities,
  }) {
    return FormDataState(
      accountHolderEntity: accountHolderEntity ?? this.accountHolderEntity,
      bankInfoEntity: bankInfoEntity ?? this.bankInfoEntity,
      authorizeEntity: authorizeEntity ?? this.authorizeEntity,
      nomineeEntities: nomineeEntities ?? this.nomineeEntities
    );
  }
}
