part of 'form_data_cubit.dart';

class FormDataState {
  AccountHolderEntity accountHolderEntity;

  FormDataState({required this.accountHolderEntity});

  FormDataState copyWith({AccountHolderEntity? accountHolderEntity}) {
    return FormDataState(
      accountHolderEntity: accountHolderEntity ?? this.accountHolderEntity,
    );
  }
}
