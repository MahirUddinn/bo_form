import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bo_acc_form/domain/enitites/account_holder_entity.dart';

part 'form_data_state.dart';

class FormDataCubit extends Cubit<FormDataState> {
  GlobalKey<FormState>? formKey;

  FormDataCubit()
      : super(
    FormDataState(
        accountHolderEntity: AccountHolderEntity(
          boType: "",
          boID: "",
          referral: "",
          clientType: "",
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
          district: "",
          country: "",
          mobileNumber: "",
          email: "",
          telephone: "",
          fax: "",
          nationality: "",
          nid: "",
          tin: "",
          brokerOffice: "",
          residentialStatus: "",
          gender: "",
          isOfficerOrDirectorOrAuthorizedRepresentative: false,
        ),
    ),
  );

  bool validateAccountHolderForm() {
    return formKey?.currentState?.validate() ?? false;
  }

  void accountHolderUpdateBoType(String boType) {
    final updatedEntity = state.accountHolderEntity.copyWith(boType: boType);
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateBoID(String boID) {
    final updatedEntity = state.accountHolderEntity.copyWith(boID: boID);
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateReferral(String referral) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      referral: referral,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateClientType(String clientType) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      clientType: clientType,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateCourtesyTitle(String courtesyTitle) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      courtesyTitle: courtesyTitle,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateFirstName(String firstName) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      firstName: firstName,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateLastName(String lastName) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      lastName: lastName,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateOccupation(String occupation) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      occupation: occupation,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateDateOfBirth(String dateOfBirth) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      dateOfBirth: dateOfBirth,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateFatherName(String fatherName) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      fatherName: fatherName,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateMotherName(String motherName) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      motherName: motherName,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateAddressLine1(String addressLine1) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      addressLine1: addressLine1,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateAddressLine2(String addressLine2) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      addressLine2: addressLine2,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateAddressLine3(String addressLine3) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      addressLine3: addressLine3,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateCity(String city) {
    final updatedEntity = state.accountHolderEntity.copyWith(city: city);
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdatePostCode(String postCode) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      postCode: postCode,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateDistrict(String district) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      district: district,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateCountry(String country) {
    final updatedEntity = state.accountHolderEntity.copyWith(country: country);
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateMobileNumber(String mobileNumber) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      mobileNumber: mobileNumber,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateEmail(String email) {
    final updatedEntity = state.accountHolderEntity.copyWith(email: email);
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateTelephone(String telephone) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      telephone: telephone,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateFax(String fax) {
    final updatedEntity = state.accountHolderEntity.copyWith(fax: fax);
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateNationality(String nationality) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      nationality: nationality,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateNid(String nid) {
    final updatedEntity = state.accountHolderEntity.copyWith(nid: nid);
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateTin(String tin) {
    final updatedEntity = state.accountHolderEntity.copyWith(tin: tin);
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateBrokerOffice(String brokerOffice) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      brokerOffice: brokerOffice,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateResidentialStatus(String residentialStatus) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      residentialStatus: residentialStatus,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateGender(String gender) {
    final updatedEntity = state.accountHolderEntity.copyWith(gender: gender);
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void accountHolderUpdateIsOfficerOrDirectorOrAuthorizedRepresentative(
      bool value,
      ) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      isOfficerOrDirectorOrAuthorizedRepresentative: value,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
  }

  void onSubmit() {}
}