part of 'form_data_cubit.dart';

class FormDataState {
  AccountHolderEntity accountHolderEntity;
  bool accountFormCompleted;

  FormDataState({required this.accountHolderEntity, required this.accountFormCompleted});

  FormDataState copyWith({AccountHolderEntity? accountHolderEntity, bool? accountFormCompleted}) {
    return FormDataState(
      accountHolderEntity: accountHolderEntity ?? this.accountHolderEntity,
      accountFormCompleted: accountFormCompleted ?? this.accountFormCompleted
    );
  }
}
