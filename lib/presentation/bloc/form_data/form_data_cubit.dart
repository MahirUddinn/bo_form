import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bo_acc_form/domain/enitites/account_holder_entity.dart';

part 'form_data_state.dart';

class FormDataCubit extends Cubit<FormDataState> {
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
        accountFormCompleted: false
    ),
  );

  void _checkFormCompletion() {
    final entity = state.accountHolderEntity;
    final isFormCompleted =
        entity.boType.isNotEmpty &&
            (entity.boType != "Link BO" || entity.boID.isNotEmpty) &&
            entity.clientType.isNotEmpty &&
            entity.courtesyTitle.isNotEmpty &&
            entity.firstName.isNotEmpty &&
            entity.lastName.isNotEmpty &&
            entity.occupation.isNotEmpty &&
            entity.dateOfBirth.isNotEmpty &&
            entity.fatherName.isNotEmpty &&
            entity.motherName.isNotEmpty &&
            entity.addressLine1.isNotEmpty &&
            entity.city.isNotEmpty &&
            entity.postCode.isNotEmpty &&
            entity.district.isNotEmpty &&
            entity.country.isNotEmpty &&
            entity.mobileNumber.isNotEmpty &&
            entity.email.isNotEmpty &&
            entity.nationality.isNotEmpty &&
            entity.nid.isNotEmpty &&
            entity.brokerOffice.isNotEmpty &&
            entity.residentialStatus.isNotEmpty &&
            entity.gender.isNotEmpty;

    if (state.accountFormCompleted != isFormCompleted) {
      emit(state.copyWith(accountFormCompleted: isFormCompleted));
    }
  }

  void accountHolderUpdateBoType(String boType) {
    final updatedEntity = state.accountHolderEntity.copyWith(boType: boType);
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateBoID(String boID) {
    final updatedEntity = state.accountHolderEntity.copyWith(boID: boID);
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateReferral(String referral) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      referral: referral,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateClientType(String clientType) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      clientType: clientType,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateCourtesyTitle(String courtesyTitle) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      courtesyTitle: courtesyTitle,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateFirstName(String firstName) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      firstName: firstName,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateLastName(String lastName) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      lastName: lastName,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateOccupation(String occupation) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      occupation: occupation,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateDateOfBirth(String dateOfBirth) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      dateOfBirth: dateOfBirth,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateFatherName(String fatherName) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      fatherName: fatherName,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateMotherName(String motherName) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      motherName: motherName,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateAddressLine1(String addressLine1) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      addressLine1: addressLine1,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateAddressLine2(String addressLine2) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      addressLine2: addressLine2,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateAddressLine3(String addressLine3) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      addressLine3: addressLine3,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateCity(String city) {
    final updatedEntity = state.accountHolderEntity.copyWith(city: city);
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdatePostCode(String postCode) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      postCode: postCode,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateDistrict(String district) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      district: district,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateCountry(String country) {
    final updatedEntity = state.accountHolderEntity.copyWith(country: country);
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateMobileNumber(String mobileNumber) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      mobileNumber: mobileNumber,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateEmail(String email) {
    final updatedEntity = state.accountHolderEntity.copyWith(email: email);
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateTelephone(String telephone) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      telephone: telephone,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateFax(String fax) {
    final updatedEntity = state.accountHolderEntity.copyWith(fax: fax);
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateNationality(String nationality) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      nationality: nationality,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateNid(String nid) {
    final updatedEntity = state.accountHolderEntity.copyWith(nid: nid);
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateTin(String tin) {
    final updatedEntity = state.accountHolderEntity.copyWith(tin: tin);
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateBrokerOffice(String brokerOffice) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      brokerOffice: brokerOffice,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateResidentialStatus(String residentialStatus) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      residentialStatus: residentialStatus,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateGender(String gender) {
    final updatedEntity = state.accountHolderEntity.copyWith(gender: gender);
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void accountHolderUpdateIsOfficerOrDirectorOrAuthorizedRepresentative(
      bool value,
      ) {
    final updatedEntity = state.accountHolderEntity.copyWith(
      isOfficerOrDirectorOrAuthorizedRepresentative: value,
    );
    emit(state.copyWith(accountHolderEntity: updatedEntity));
    _checkFormCompletion();
  }

  void onSubmit() {
    final entity = state.accountHolderEntity;

    print('=== ACCOUNT HOLDER ENTITY DATA ===');
    print('BO Type: ${entity.boType}');
    print("BOID: ${entity.boID}");
    print('Referral: ${entity.referral}');
    print('Client Type: ${entity.clientType}');
    print('Courtesy Title: ${entity.courtesyTitle}');
    print('First Name: ${entity.firstName}');
    print('Last Name: ${entity.lastName}');
    print('Occupation: ${entity.occupation}');
    print('Date of Birth: ${entity.dateOfBirth}');
    print('Father Name: ${entity.fatherName}');
    print('Mother Name: ${entity.motherName}');
    print('Address Line 1: ${entity.addressLine1}');
    print('Address Line 2: ${entity.addressLine2}');
    print('Address Line 3: ${entity.addressLine3}');
    print('City: ${entity.city}');
    print('Post Code: ${entity.postCode}');
    print('District: ${entity.district}');
    print('Country: ${entity.country}');
    print('Mobile Number: ${entity.mobileNumber}');
    print('Email: ${entity.email}');
    print('Telephone: ${entity.telephone}');
    print('Fax: ${entity.fax}');
    print('Nationality: ${entity.nationality}');
    print('NID: ${entity.nid}');
    print('TIN: ${entity.tin}');
    print('Broker Office: ${entity.brokerOffice}');
    print('Residential Status: ${entity.residentialStatus}');
    print('Gender: ${entity.gender}');
    print(
      'Is Officer/Director/Authorized Representative: ${entity.isOfficerOrDirectorOrAuthorizedRepresentative}',
    );
    print('Account Form Completed: ${state.accountFormCompleted}');
    print('===================================');
  }
}