import 'package:bo_acc_form/domain/enitites/autherize_entity.dart';
import 'package:bo_acc_form/domain/enitites/bank_info_entity.dart';
import 'package:bo_acc_form/domain/enitites/nominee_entity.dart';
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
          bankInfoEntity: BankInfoEntity(
            bankName: "",
            bankBranch: "",
            bankDistrict: "",
            bankAccountNumber: "",
          ),
          authorizeEntity: AuthorizeEntity(
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
          ),
          nomineeEntities: []
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
  //bank

  void bankInfoUpdateBankName(String bankName) {
    final updatedEntity = state.bankInfoEntity.copyWith(bankName: bankName);
    emit(state.copyWith(bankInfoEntity: updatedEntity));
  }

  void bankInfoUpdateBankBranch(String bankBranch) {
    final updatedEntity = state.bankInfoEntity.copyWith(bankBranch: bankBranch);
    emit(state.copyWith(bankInfoEntity: updatedEntity));
  }

  void bankInfoUpdateBankDistrict(String bankDistrict) {
    final updatedEntity = state.bankInfoEntity.copyWith(
      bankDistrict: bankDistrict,
    );
    emit(state.copyWith(bankInfoEntity: updatedEntity));
  }

  void bankInfoUpdateBankAccountNumber(String bankAccountNumber) {
    final updatedEntity = state.bankInfoEntity.copyWith(
      bankAccountNumber: bankAccountNumber,
    );
    emit(state.copyWith(bankInfoEntity: updatedEntity));
  }
  //auth

  void authorizeUpdateCourtesyTitle(String courtesyTitle) {
    final updatedEntity = state.authorizeEntity.copyWith(courtesyTitle: courtesyTitle);
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateFirstName(String firstName) {
    final updatedEntity = state.authorizeEntity.copyWith(firstName: firstName);
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateLastName(String lastName) {
    final updatedEntity = state.authorizeEntity.copyWith(lastName: lastName);
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateOccupation(String occupation) {
    final updatedEntity = state.authorizeEntity.copyWith(occupation: occupation);
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateDateOfBirth(String dateOfBirth) {
    final updatedEntity = state.authorizeEntity.copyWith(dateOfBirth: dateOfBirth);
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateFatherName(String fatherName) {
    final updatedEntity = state.authorizeEntity.copyWith(fatherName: fatherName);
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateMotherName(String motherName) {
    final updatedEntity = state.authorizeEntity.copyWith(motherName: motherName);
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateAddressLine1(String addressLine1) {
    final updatedEntity = state.authorizeEntity.copyWith(addressLine1: addressLine1);
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateAddressLine2(String addressLine2) {
    final updatedEntity = state.authorizeEntity.copyWith(addressLine2: addressLine2);
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateAddressLine3(String addressLine3) {
    final updatedEntity = state.authorizeEntity.copyWith(addressLine3: addressLine3);
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateCity(String city) {
    final updatedEntity = state.authorizeEntity.copyWith(city: city);
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdatePostCode(String postCode) {
    final updatedEntity = state.authorizeEntity.copyWith(postCode: postCode);
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateDivision(String division) {
    final updatedEntity = state.authorizeEntity.copyWith(division: division);
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateCountry(String country) {
    final updatedEntity = state.authorizeEntity.copyWith(country: country);
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateMobileNumber(String mobileNumber) {
    final updatedEntity = state.authorizeEntity.copyWith(mobileNumber: mobileNumber);
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateEmail(String email) {
    final updatedEntity = state.authorizeEntity.copyWith(email: email);
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateTelephone(String telephone) {
    final updatedEntity = state.authorizeEntity.copyWith(telephone: telephone);
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateFax(String fax) {
    final updatedEntity = state.authorizeEntity.copyWith(fax: fax);
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateNid(String nid) {
    final updatedEntity = state.authorizeEntity.copyWith(nid: nid);
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void onSubmit() {
    final accountHolder = state.accountHolderEntity;
    final bankInfo = state.bankInfoEntity;
    final authorize = state.authorizeEntity;


    print('=== ACCOUNT HOLDER INFORMATION ===');
    print('BO Type: ${accountHolder.boType}');
    print('BO ID: ${accountHolder.boID}');
    print('Referral: ${accountHolder.referral}');
    print('Client Type: ${accountHolder.clientType}');
    print('Courtesy Title: ${accountHolder.courtesyTitle}');
    print('First Name: ${accountHolder.firstName}');
    print('Last Name: ${accountHolder.lastName}');
    print('Occupation: ${accountHolder.occupation}');
    print('Date of Birth: ${accountHolder.dateOfBirth}');
    print('Father Name: ${accountHolder.fatherName}');
    print('Mother Name: ${accountHolder.motherName}');
    print('Address Line 1: ${accountHolder.addressLine1}');
    print('Address Line 2: ${accountHolder.addressLine2}');
    print('Address Line 3: ${accountHolder.addressLine3}');
    print('City: ${accountHolder.city}');
    print('Post Code: ${accountHolder.postCode}');
    print('District: ${accountHolder.district}');
    print('Country: ${accountHolder.country}');
    print('Mobile Number: ${accountHolder.mobileNumber}');
    print('Email: ${accountHolder.email}');
    print('Telephone: ${accountHolder.telephone}');
    print('Fax: ${accountHolder.fax}');
    print('Nationality: ${accountHolder.nationality}');
    print('NID: ${accountHolder.nid}');
    print('TIN: ${accountHolder.tin}');
    print('Broker Office: ${accountHolder.brokerOffice}');
    print('Residential Status: ${accountHolder.residentialStatus}');
    print('Gender: ${accountHolder.gender}');
    print(
      'Is Officer/Director/Authorized Representative: ${accountHolder.isOfficerOrDirectorOrAuthorizedRepresentative}',
    );

    print('\n=== BANK INFORMATION ===');
    print('Bank Name: ${bankInfo.bankName}');
    print('Bank Branch: ${bankInfo.bankBranch}');
    print('Bank District: ${bankInfo.bankDistrict}');
    print('Bank Account Number: ${bankInfo.bankAccountNumber}');


    print('\n=== AUTHORIZE INFORMATION ===');
    print('Courtesy Title: ${authorize.courtesyTitle}');
    print('First Name: ${authorize.firstName}');
    print('Last Name: ${authorize.lastName}');
    print('Occupation: ${authorize.occupation}');
    print('Date of Birth: ${authorize.dateOfBirth}');
    print('Father Name: ${authorize.fatherName}');
    print('Mother Name: ${authorize.motherName}');
    print('Address Line 1: ${authorize.addressLine1}');
    print('Address Line 2: ${authorize.addressLine2}');
    print('Address Line 3: ${authorize.addressLine3}');
    print('City: ${authorize.city}');
    print('Post Code: ${authorize.postCode}');
    print('Division: ${authorize.division}');
    print('Country: ${authorize.country}');
    print('Mobile Number: ${authorize.mobileNumber}');
    print('Email: ${authorize.email}');
    print('Telephone: ${authorize.telephone}');
    print('Fax: ${authorize.fax}');
    print('NID: ${authorize.nid}');

    print('\n=== FORM SUBMITTED SUCCESSFULLY ===');
  }
}
