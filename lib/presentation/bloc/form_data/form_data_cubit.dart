import 'package:bo_acc_form/domain/entities/autherize_entity.dart';
import 'package:bo_acc_form/domain/entities/bank_info_entity.dart';
import 'package:bo_acc_form/domain/entities/nominee_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bo_acc_form/domain/entities/account_holder_entity.dart';

part 'form_data_state.dart';

class FormDataCubit extends Cubit<FormDataState> {
  GlobalKey<FormState>? formKey;

  FormDataCubit()
    : super(
        FormDataState(
          accountHolderEntity: AccountHolderEntity.empty(),
          bankInfoEntity: BankInfoEntity.empty(),
          authorizeEntity: AuthorizeEntity.empty(),
          nominees: [NomineeEntity.empty()],
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
    final updatedEntity = state.authorizeEntity.copyWith(
      courtesyTitle: courtesyTitle,
    );
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
    final updatedEntity = state.authorizeEntity.copyWith(
      occupation: occupation,
    );
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateDateOfBirth(String dateOfBirth) {
    final updatedEntity = state.authorizeEntity.copyWith(
      dateOfBirth: dateOfBirth,
    );
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateFatherName(String fatherName) {
    final updatedEntity = state.authorizeEntity.copyWith(
      fatherName: fatherName,
    );
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateMotherName(String motherName) {
    final updatedEntity = state.authorizeEntity.copyWith(
      motherName: motherName,
    );
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateAddressLine1(String addressLine1) {
    final updatedEntity = state.authorizeEntity.copyWith(
      addressLine1: addressLine1,
    );
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateAddressLine2(String addressLine2) {
    final updatedEntity = state.authorizeEntity.copyWith(
      addressLine2: addressLine2,
    );
    emit(state.copyWith(authorizeEntity: updatedEntity));
  }

  void authorizeUpdateAddressLine3(String addressLine3) {
    final updatedEntity = state.authorizeEntity.copyWith(
      addressLine3: addressLine3,
    );
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
    final updatedEntity = state.authorizeEntity.copyWith(
      mobileNumber: mobileNumber,
    );
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

  //nominee

  void addNominee() {
    final newNominees = List<NomineeEntity>.from(state.nominees);
    newNominees.add(NomineeEntity.empty());
    emit(state.copyWith(nominees: newNominees));
  }

  void toggleSecondNominee() {
    final newNominees = [state.nominees.first];

    if (!state.isSecondNomineeAvailable) {
      newNominees.add(NomineeEntity.empty());
    }

    emit(
      state.copyWith(
        nominees: newNominees,
        isSecondNomineeAvailable: !state.isSecondNomineeAvailable,
      ),
    );
  }

  void _updateNomineeField(
    int index,
    NomineeEntity Function(NomineeEntity) updateFunction,
  ) {
    if (index >= 0 && index < state.nominees.length) {
      final updatedNominee = updateFunction(state.nominees[index]);
      final updatedNominees = List<NomineeEntity>.from(state.nominees);
      updatedNominees[index] = updatedNominee;
      emit(state.copyWith(nominees: updatedNominees));
    }
  }

  void nomineeUpdateCourtesyTitle(int index, String courtesyTitle) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(courtesyTitle: courtesyTitle);
    });
  }

  void nomineeUpdateFirstName(int index, String firstName) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(firstName: firstName);
    });
  }

  void nomineeUpdateLastName(int index, String lastName) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(lastName: lastName);
    });
  }

  void nomineeUpdateRelationship(int index, String relationship) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(relationship: relationship);
    });
  }

  void nomineeUpdatePercentage(int index, String percentage) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(percentage: percentage);
    });
  }

  void nomineeUpdateResidentialStatus(int index, String residentialStatus) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(residentialStatus: residentialStatus);
    });
  }

  void nomineeUpdateDateOfBirth(int index, String dateOfBirth) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(dateOfBirth: dateOfBirth);
    });
  }

  void nomineeUpdateNid(int index, String nid) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(nid: nid);
    });
  }

  void nomineeUpdateAddressLine1(int index, String addressLine1) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(addressLine1: addressLine1);
    });
  }

  void nomineeUpdateAddressLine2(int index, String addressLine2) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(addressLine2: addressLine2);
    });
  }

  void nomineeUpdateAddressLine3(int index, String addressLine3) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(addressLine3: addressLine3);
    });
  }

  void nomineeUpdateCity(int index, String city) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(city: city);
    });
  }

  void nomineeUpdatePostCode(int index, String postCode) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(postCode: postCode);
    });
  }

  void nomineeUpdateDivision(int index, String division) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(division: division);
    });
  }

  void nomineeUpdateCountry(int index, String country) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(country: country);
    });
  }

  void nomineeUpdateMobileNumber(int index, String mobileNumber) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(mobileNumber: mobileNumber);
    });
  }

  void nomineeUpdateEmail(int index, String email) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(email: email);
    });
  }

  void nomineeUpdateTelephone(int index, String telephone) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(telephone: telephone);
    });
  }

  void nomineeUpdateFax(int index, String fax) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(fax: fax);
    });
  }

  void nomineeUpdateIsNomineeMinor(int index, bool isNomineeMinor) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(isNomineeMinor: isNomineeMinor);
    });
  }

  //guardian
  void nomineeUpdateGuardianCourtesyTitle(
    int index,
    String guardianCourtesyTitle,
  ) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(guardianCourtesyTitle: guardianCourtesyTitle);
    });
  }

  void nomineeUpdateGuardianFirstName(int index, String guardianFirstName) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(guardianFirstName: guardianFirstName);
    });
  }

  void nomineeUpdateGuardianLastName(int index, String guardianLastName) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(guardianLastName: guardianLastName);
    });
  }

  void nomineeUpdateGuardianRelationship(
    int index,
    String guardianRelationship,
  ) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(guardianRelationship: guardianRelationship);
    });
  }

  void nomineeUpdateGuardianDateOfMaturity(
    int index,
    String guardianDateOfMaturity,
  ) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(guardianDateOfMaturity: guardianDateOfMaturity);
    });
  }

  void nomineeUpdateGuardianResidentialStatus(
    int index,
    String guardianResidentialStatus,
  ) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(
        guardianResidentialStatus: guardianResidentialStatus,
      );
    });
  }

  void nomineeUpdateGuardianDateOfBirth(int index, String guardianDateOfBirth) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(guardianDateOfBirth: guardianDateOfBirth);
    });
  }

  void nomineeUpdateGuardianNid(int index, String guardianNid) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(guardianNid: guardianNid);
    });
  }

  void nomineeUpdateGuardianAddressLine1(
    int index,
    String guardianAddressLine1,
  ) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(guardianAddressLine1: guardianAddressLine1);
    });
  }

  void nomineeUpdateGuardianAddressLine2(
    int index,
    String guardianAddressLine2,
  ) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(guardianAddressLine2: guardianAddressLine2);
    });
  }

  void nomineeUpdateGuardianAddressLine3(
    int index,
    String guardianAddressLine3,
  ) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(guardianAddressLine3: guardianAddressLine3);
    });
  }

  void nomineeUpdateGuardianCity(int index, String guardianCity) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(guardianCity: guardianCity);
    });
  }

  void nomineeUpdateGuardianPostCode(int index, String guardianPostCode) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(guardianPostCode: guardianPostCode);
    });
  }

  void nomineeUpdateGuardianDivision(int index, String guardianDivision) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(guardianDivision: guardianDivision);
    });
  }

  void nomineeUpdateGuardianCountry(int index, String guardianCountry) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(guardianCountry: guardianCountry);
    });
  }

  void nomineeUpdateGuardianMobileNumber(
    int index,
    String guardianMobileNumber,
  ) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(guardianMobileNumber: guardianMobileNumber);
    });
  }

  void nomineeUpdateGuardianEmail(int index, String guardianEmail) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(guardianEmail: guardianEmail);
    });
  }

  void nomineeUpdateGuardianTelephone(int index, String guardianTelephone) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(guardianTelephone: guardianTelephone);
    });
  }

  void nomineeUpdateGuardianFax(int index, String guardianFax) {
    _updateNomineeField(index, (nominee) {
      return nominee.copyWith(guardianFax: guardianFax);
    });
  }

  void onSubmit() {
    final accountHolder = state.accountHolderEntity;
    final bankInfo = state.bankInfoEntity;
    final authorize = state.authorizeEntity;
    final nominees = state.nominees;

    print('\n=== FORM SUBMISSION DATA ===');
    print('Submission Time: ${DateTime.now()}');

    print('\n=== ACCOUNT HOLDER INFORMATION ===');
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

    print('\n=== NOMINEE INFORMATION ===');
    print('Total Nominees: ${nominees.length}');
    print('Second Nominee Available: ${state.isSecondNomineeAvailable}');

    for (int i = 0; i < nominees.length; i++) {
      final nominee = nominees[i];
      print('\n--- Nominee ${i + 1} ---');
      print('  Courtesy Title: ${nominee.courtesyTitle}');
      print('  First Name: ${nominee.firstName}');
      print('  Last Name: ${nominee.lastName}');
      print('  Relationship: ${nominee.relationship}');
      print('  Percentage: ${nominee.percentage}');
      print('  Residential Status: ${nominee.residentialStatus}');
      print('  Date of Birth: ${nominee.dateOfBirth}');
      print('  NID: ${nominee.nid}');
      print('  Address Line 1: ${nominee.addressLine1}');
      print('  Address Line 2: ${nominee.addressLine2}');
      print('  Address Line 3: ${nominee.addressLine3}');
      print('  City: ${nominee.city}');
      print('  Post Code: ${nominee.postCode}');
      print('  Division: ${nominee.division}');
      print('  Country: ${nominee.country}');
      print('  Mobile: ${nominee.mobileNumber}');
      print('  Email: ${nominee.email}');
      print('  Telephone: ${nominee.telephone}');
      print('  Fax: ${nominee.fax}');
      print('  Is Nominee Minor: ${nominee.isNomineeMinor}');

      if (nominee.isNomineeMinor) {
        print('\n  --- Guardian Details ---');
        print('    Guardian Courtesy Title: ${nominee.guardianCourtesyTitle}');
        print('    Guardian First Name: ${nominee.guardianFirstName}');
        print('    Guardian Last Name: ${nominee.guardianLastName}');
        print('    Guardian Relationship: ${nominee.guardianRelationship}');
        print('    Guardian Date of Birth: ${nominee.guardianDateOfMaturity}');

        print(
          '    Guardian Residential Status: ${nominee.guardianResidentialStatus}',
        );
        print('    Guardian Date of Birth: ${nominee.guardianDateOfBirth}');
        print('    Guardian NID: ${nominee.guardianNid}');
        print('    Guardian Address Line 1: ${nominee.guardianAddressLine1}');
        print('    Guardian Address Line 2: ${nominee.guardianAddressLine2}');
        print('    Guardian Address Line 3: ${nominee.guardianAddressLine3}');
        print('    Guardian City: ${nominee.guardianCity}');
        print('    Guardian Post Code: ${nominee.guardianPostCode}');
        print('    Guardian Division: ${nominee.guardianDivision}');
        print('    Guardian Country: ${nominee.guardianCountry}');
        print('    Guardian Mobile: ${nominee.guardianMobileNumber}');
        print('    Guardian Email: ${nominee.guardianEmail}');
        print('    Guardian Telephone: ${nominee.guardianTelephone}');
        print('    Guardian Fax: ${nominee.guardianFax}');
      }
    }

    print('\n=== FORM SUBMITTED SUCCESSFULLY ===');
  }
}
