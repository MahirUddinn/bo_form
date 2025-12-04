import 'package:bo_acc_form/common/constants/app_sizes.dart';
import 'package:bo_acc_form/common/constants/app_strings.dart';
import 'package:bo_acc_form/common/widget/custom_date_picker.dart';
import 'package:bo_acc_form/common/widget/custom_check_selector.dart';
import 'package:bo_acc_form/common/widget/custom_dropdown.dart';

import 'package:bo_acc_form/common/widget/custom_slider_toggle.dart';
import 'package:bo_acc_form/common/widget/custom_text_field.dart';
import 'package:bo_acc_form/common/widget/section_box.dart';
import 'package:bo_acc_form/presentation/bloc/form_data/form_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AccountHolderView extends StatefulWidget {
  const AccountHolderView({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<AccountHolderView> createState() => _AccountHolderViewState();
}

class _AccountHolderViewState extends State<AccountHolderView> {
  String? _selectedBoType;
  final TextEditingController _boIdController = TextEditingController();
  String? _selectedReferral;
  String? _selectedClientType;
  String? _selectedCourtesyTitle;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _motherNameController = TextEditingController();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _addressLine3Controller = TextEditingController();
  final TextEditingController _cityNameController = TextEditingController();
  final TextEditingController _postCodeController = TextEditingController();
  final TextEditingController _districtNameController = TextEditingController();
  String? _selectedCountry;
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _telephoneNumberController =
      TextEditingController();
  final TextEditingController _faxNumberController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _nidController = TextEditingController();
  final TextEditingController _tinController = TextEditingController();
  String? _selectedBrokerOffice;
  String? _selectedResidentialStatus;
  String? _selectedGender;
  bool? isOfficerOrDirectorOrAuthorizedRepresentative = false;

  @override
  void initState() {
    super.initState();
    _initiateFromCubit();
  }

  void _initiateFromCubit() {
    final cubit = context.read<FormDataCubit>();
    final entity = cubit.state.accountHolderEntity;

    _selectedBoType = entity.boType.isNotEmpty ? entity.boType : null;

    _selectedReferral = entity.referral.isNotEmpty ? entity.referral : null;
    _selectedClientType = entity.clientType.isNotEmpty
        ? entity.clientType
        : null;
    _selectedCourtesyTitle = entity.courtesyTitle.isNotEmpty
        ? entity.courtesyTitle
        : null;
    _selectedCountry = entity.country.isNotEmpty ? entity.country : null;
    _selectedBrokerOffice = entity.brokerOffice.isNotEmpty
        ? entity.brokerOffice
        : null;
    _selectedResidentialStatus = entity.residentialStatus.isNotEmpty
        ? entity.residentialStatus
        : null;
    _selectedGender = entity.gender.isNotEmpty ? entity.gender : null;

    _boIdController.text = entity.boID;
    _firstNameController.text = entity.firstName;
    _lastNameController.text = entity.lastName;
    _occupationController.text = entity.occupation;
    _fatherNameController.text = entity.fatherName;
    _motherNameController.text = entity.motherName;
    _addressLine1Controller.text = entity.addressLine1;
    _addressLine2Controller.text = entity.addressLine2;
    _addressLine3Controller.text = entity.addressLine3;
    _cityNameController.text = entity.city;
    _postCodeController.text = entity.postCode;
    _districtNameController.text = entity.district;
    _mobileNumberController.text = entity.mobileNumber;
    _emailAddressController.text = entity.email;
    _telephoneNumberController.text = entity.telephone;
    _faxNumberController.text = entity.fax;
    _nationalityController.text = entity.nationality;
    _nidController.text = entity.nid;
    _tinController.text = entity.tin;

    isOfficerOrDirectorOrAuthorizedRepresentative =
        entity.isOfficerOrDirectorOrAuthorizedRepresentative;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _occupationController.dispose();
    _fatherNameController.dispose();
    _motherNameController.dispose();
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    _addressLine3Controller.dispose();
    _cityNameController.dispose();
    _districtNameController.dispose();
    _postCodeController.dispose();
    _mobileNumberController.dispose();
    _emailAddressController.dispose();
    _telephoneNumberController.dispose();
    _faxNumberController.dispose();
    _nationalityController.dispose();
    _nidController.dispose();
    _tinController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: widget.formKey,
            child: Column(
              children: [
                SectionBox(
                  title: Text(
                    AppStrings.accountHolder,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  child: Column(
                    children: [
                      _buildAccountHolder(state),
                      SectionBox(
                        title: Text(
                          AppStrings.firstACHolder,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        child: _buildFirstACHolder(state),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFirstACHolder(FormDataState state) {
    return Container(
      margin: EdgeInsets.all(AppSizes.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCheckSelector(
            label: AppStrings.typeOfClient,
            listOfValues: [AppStrings.individual, AppStrings.joint],
            isRequired: true,
            selectedValue: _selectedClientType,
            onChanged: (value) {
              _selectedClientType = value;
              context.read<FormDataCubit>().accountHolderUpdateClientType(
                value!,
              );
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.selectClientType;
              }
              return null;
            },
          ),
          CustomDropdown(
            labelText: AppStrings.courtesyTitle,
            hintText: AppStrings.selectOption,
            values: [AppStrings.mr, AppStrings.mrs, AppStrings.ms, AppStrings.dr],
            selectedValue: _selectedCourtesyTitle,
            onChanged: (value) {
              _selectedCourtesyTitle = value;
              context.read<FormDataCubit>().accountHolderUpdateCourtesyTitle(
                value!,
              );
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.selectCourtesyTitle;
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterFirstName,
            isRequired: true,
            label: AppStrings.firstName,
            controller: _firstNameController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateFirstName(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.enterFirstNameError;
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterLastName,
            isRequired: true,
            label: AppStrings.lastName,
            controller: _lastNameController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateLastName(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.enterLastNameError;
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterOccupation,
            isRequired: true,
            label: AppStrings.occupation,
            controller: _occupationController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateOccupation(
                value,
              );
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.enterOccupationError;
              }
              return null;
            },
          ),
          CustomDatePicker(
            isRequired: true,
            labelText: AppStrings.dobLabel,
            selectedDate: state.accountHolderEntity.dateOfBirth,
            formatter: DateFormat('yyyy-MM-dd'),
            onTap: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (picked != null) {
                context.read<FormDataCubit>().accountHolderUpdateDateOfBirth(
                  picked,
                );
              }
            },
            hintText: AppStrings.dobHint,
            validator: (value) {
              if (value == null) {
                return AppStrings.selectDobError;
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterFatherName,
            isRequired: true,
            label: AppStrings.fatherName,
            controller: _fatherNameController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateFatherName(
                value,
              );
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.enterFatherNameError;
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterMotherName,
            isRequired: true,
            label: AppStrings.motherName,
            controller: _motherNameController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateMotherName(
                value,
              );
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.enterMotherNameError;
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterAddressLine1,
            isRequired: true,
            label: AppStrings.addressLine1,
            controller: _addressLine1Controller,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateAddressLine1(
                value,
              );
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.enterAddressError;
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterAddressLine2,
            isRequired: false,
            label: AppStrings.addressLine2,
            controller: _addressLine2Controller,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateAddressLine2(
                value,
              );
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterAddressLine3,
            isRequired: false,
            label: AppStrings.addressLine3,
            controller: _addressLine3Controller,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateAddressLine3(
                value,
              );
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterCity,
            isRequired: true,
            label: AppStrings.city,
            controller: _cityNameController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateCity(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.enterCityError;
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterPostCode,
            isRequired: true,
            label: AppStrings.postCode,
            controller: _postCodeController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdatePostCode(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.enterPostCodeError;
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterDistrict,
            isRequired: true,
            label: AppStrings.district,
            controller: _districtNameController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateDistrict(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.enterDistrictError;
              }
              return null;
            },
          ),
          CustomDropdown(
            labelText: AppStrings.country,
            hintText: AppStrings.selectOption,
            selectedValue: _selectedCountry,
            isRequired: true,
            values: [
              AppStrings.usa,
              AppStrings.canada,
              AppStrings.india,
              AppStrings.uk,
              AppStrings.bangladesh
            ],
            onChanged: (value) {
              _selectedCountry = value;
              context.read<FormDataCubit>().accountHolderUpdateCountry(value!);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.selectCountryError;
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterMobile,
            isRequired: true,
            label: AppStrings.mobile,
            controller: _mobileNumberController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateMobileNumber(
                value,
              );
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.enterMobileError;
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterEmail,
            isRequired: true,
            label: AppStrings.email,
            controller: _emailAddressController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateEmail(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.enterEmailError;
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterTelephone,
            isRequired: false,
            label: AppStrings.telephone,
            controller: _telephoneNumberController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateTelephone(value);
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterFax,
            isRequired: false,
            label: AppStrings.fax,
            controller: _faxNumberController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateFax(value);
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterNationality,
            isRequired: true,
            label: AppStrings.nationality,
            controller: _nationalityController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateNationality(
                value,
              );
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.enterNationalityError;
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterNationalId,
            isRequired: true,
            label: AppStrings.nationalId,
            controller: _nidController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateNid(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.enterNationalIdError;
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterTin,
            isRequired: false,
            label: AppStrings.tin,
            controller: _tinController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateTin(value);
            },
          ),
          CustomDropdown(
            labelText: AppStrings.brokerBranch,
            hintText: AppStrings.selectOption,
            selectedValue: _selectedBrokerOffice,
            isRequired: true,
            values: [
              AppStrings.headOffice,
              AppStrings.sylhet,
              AppStrings.bogura,
              AppStrings.bmsl,
              AppStrings.tangail
            ],
            onChanged: (value) {
              _selectedBrokerOffice = value;
              context.read<FormDataCubit>().accountHolderUpdateBrokerOffice(
                value!,
              );
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.selectBrokerBranchError;
              }
              return null;
            },
          ),
          CustomCheckSelector(
            label: AppStrings.residentialStatus,
            listOfValues: [
              AppStrings.resident,
              AppStrings.nonResident,
              AppStrings.foreigner
            ],
            isRequired: true,
            selectedValue: _selectedResidentialStatus,
            onChanged: (value) {
              _selectedResidentialStatus = value;
              context
                  .read<FormDataCubit>()
                  .accountHolderUpdateResidentialStatus(value!);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.selectResidentialStatusError;
              }
              return null;
            },
          ),
          CustomCheckSelector(
            label: AppStrings.gender,
            listOfValues: [AppStrings.male, AppStrings.female],
            isRequired: true,
            selectedValue: _selectedGender,
            onChanged: (value) {
              _selectedGender = value;
              context.read<FormDataCubit>().accountHolderUpdateGender(value!);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.selectGenderError;
              }
              return null;
            },
          ),
          CustomSliderToggle(
            label: AppStrings.officerDirectorLabel,
            selectedValue: isOfficerOrDirectorOrAuthorizedRepresentative,
            onChanged: (value) {
              isOfficerOrDirectorOrAuthorizedRepresentative = value;
              context
                  .read<FormDataCubit>()
                  .accountHolderUpdateIsOfficerOrDirectorOrAuthorizedRepresentative(
                    value!,
                  );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAccountHolder(FormDataState state) {
    return Container(
      margin: EdgeInsets.all(AppSizes.p16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCheckSelector(
            isRequired: true,
            label: AppStrings.boType,
            listOfValues: [AppStrings.newBo, AppStrings.linkBo],
            selectedValue: _selectedBoType,
            onChanged: (value) {
              _selectedBoType = value;
              context.read<FormDataCubit>().accountHolderUpdateBoType(value!);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.selectBoTypeError;
              }
              return null;
            },
          ),
          _selectedBoType == AppStrings.linkBo
              ? CustomTextField(
                  hintText: AppStrings.enterBoId,
                  controller: _boIdController,
                  onChanged: (value) {
                    context.read<FormDataCubit>().accountHolderUpdateBoID(
                      value,
                    );
                  },
                  validator: (value) {
                    if (_selectedBoType == AppStrings.linkBo &&
                        (value == null || value.isEmpty)) {
                      return AppStrings.enterBoIdError;
                    }
                    return null;
                  },
                )
              : Container(),
          SizedBox(height: AppSizes.h8),
          Text(
            AppStrings.referralLabel,
          ),
          CustomDropdown(
            hintText: AppStrings.selectOption,
            selectedValue: _selectedReferral,
            values: [
              AppStrings.socialMedia,
              AppStrings.offlineEvent,
              AppStrings.dealer,
              AppStrings.associate,
              AppStrings.friendRecommendation,
            ],
            onChanged: (referral) {
              _selectedReferral = referral;
              context.read<FormDataCubit>().accountHolderUpdateReferral(
                referral!,
              );
            },
          ),
        ],
      ),
    );
  }
}
