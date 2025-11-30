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
  DateTime? _dob;

  String? _selectedBoType;
  final TextEditingController _boIdController = TextEditingController();
  String? _selectedReferral;
  String? _selectedClientType;
  String? _selectedCourtesyTitle;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  String? _dateOfBirth;
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
    context.read<FormDataCubit>().formKey = widget.formKey;
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

    if (entity.dateOfBirth.isNotEmpty) {
      try {
        _dob = DateFormat('yyyy-MM-dd').parse(entity.dateOfBirth);
        _dateOfBirth = entity.dateOfBirth;
      } catch (e) {
        _dob = null;
        _dateOfBirth = null;
      }
    }

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
                    "Account Holder",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  child: Column(
                    children: [
                      _buildAccountHolder(state),
                      SectionBox(
                        title: Text(
                          "First A/C Holder",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
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
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCheckSelector(
            label: "Type of Client",
            listOfValues: ["Individual", "Joint"],
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
                return 'Please select a client type.';
              }
              return null;
            },
          ),
          CustomDropdown(
            labelText: "Courtesy Title",
            hintText: "Select an option",
            values: ["Mr", "Mrs", "Ms", "Dr"],
            selectedValue: _selectedCourtesyTitle,
            onChanged: (value) {
              _selectedCourtesyTitle = value;
              context.read<FormDataCubit>().accountHolderUpdateCourtesyTitle(
                value!,
              );
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a courtesy title.';
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: "Enter First Name",
            isRequired: true,
            label: "First Name",
            controller: _firstNameController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateFirstName(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a first name.';
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: "Enter Last Name",
            isRequired: true,
            label: "Last Name",
            controller: _lastNameController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateLastName(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a last name.';
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: "Enter Occupation",
            isRequired: true,
            label: "Occupation",
            controller: _occupationController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateOccupation(
                value,
              );
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an occupation.';
              }
              return null;
            },
          ),
          CustomDatePicker(
            isRequired: true,
            labelText: "Date of Birth (YYYY-MM-DD)",
            selectedDate: _dob,
            formatter: DateFormat('yyyy-MM-dd'),
            onTap: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (picked != null) {
                setState(() {
                  _dateOfBirth = DateFormat('yyyy-MM-dd').format(picked);
                  _dob = picked;
                });
                if (!mounted) return;
                context.read<FormDataCubit>().accountHolderUpdateDateOfBirth(
                  _dateOfBirth!,
                );
              }
            },
            hintText: "YYYY-MM-DD",
            validator: (value) {
              if (value == null) {
                return 'Please select a date of birth.';
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: "Enter Father Name",
            isRequired: true,
            label: "Father's Name",
            controller: _fatherNameController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateFatherName(
                value,
              );
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a father's name.";
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: "Enter Mother Name",
            isRequired: true,
            label: "Mother's Name",
            controller: _motherNameController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateMotherName(
                value,
              );
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a mother's name.";
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: "Enter Address Line 1",
            isRequired: true,
            label: "Address Line 1",
            controller: _addressLine1Controller,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateAddressLine1(
                value,
              );
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an address.';
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: "Enter Address Line 2",
            isRequired: false,
            label: "Address Line 2",
            controller: _addressLine2Controller,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateAddressLine2(
                value,
              );
            },
          ),
          CustomTextField(
            hintText: "Enter Address Line 3",
            isRequired: false,
            label: "Address Line 3",
            controller: _addressLine3Controller,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateAddressLine3(
                value,
              );
            },
          ),
          CustomTextField(
            hintText: "Enter City",
            isRequired: true,
            label: "City",
            controller: _cityNameController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateCity(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a city.';
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: "Enter Post Code",
            isRequired: true,
            label: "Post Code",
            controller: _postCodeController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdatePostCode(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a post code.';
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: "Enter District",
            isRequired: true,
            label: "District",
            controller: _districtNameController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateDistrict(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a district.';
              }
              return null;
            },
          ),
          CustomDropdown(
            labelText: "Country",
            hintText: "Select an option",
            selectedValue: _selectedCountry,
            isRequired: true,
            values: ["USA", "Canada", "India", "UK", "Bangladesh"],
            onChanged: (value) {
              _selectedCountry = value;
              context.read<FormDataCubit>().accountHolderUpdateCountry(value!);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a country.';
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: "Enter Mobile",
            isRequired: true,
            label: "Mobile",
            controller: _mobileNumberController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateMobileNumber(
                value,
              );
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a mobile number.';
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: "Enter Email Address",
            isRequired: true,
            label: "Email",
            controller: _emailAddressController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateEmail(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email address.';
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: "Enter Telephone Number",
            isRequired: false,
            label: "Telephone",
            controller: _telephoneNumberController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateTelephone(value);
            },
          ),
          CustomTextField(
            hintText: "Enter FAX Number",
            isRequired: false,
            label: "FAX",
            controller: _faxNumberController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateFax(value);
            },
          ),
          CustomTextField(
            hintText: "Enter Nationality",
            isRequired: true,
            label: "Nationality",
            controller: _nationalityController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateNationality(
                value,
              );
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a nationality.';
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: "Enter National Identity Card Number",
            isRequired: true,
            label: "National ID",
            controller: _nidController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateNid(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a national ID.';
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: "Enter Tax Identification Number (TIN)",
            isRequired: false,
            label: "Tax Identification Number (TIN)",
            controller: _tinController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateTin(value);
            },
          ),
          CustomDropdown(
            labelText: "Broker Branch",
            hintText: "Select an option",
            selectedValue: _selectedBrokerOffice,
            isRequired: true,
            values: ["HEAD OFFICE", "SYLHET", "BOGURA", "BMSL", "TANGAIL"],
            onChanged: (value) {
              _selectedBrokerOffice = value;
              context.read<FormDataCubit>().accountHolderUpdateBrokerOffice(
                value!,
              );
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a broker branch.';
              }
              return null;
            },
          ),
          CustomCheckSelector(
            label: "Residential Status",
            listOfValues: ["Resident", "Non Resident", "Foreigner"],
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
                return 'Please select a residential status.';
              }
              return null;
            },
          ),
          CustomCheckSelector(
            label: "Gender",
            listOfValues: ["Male", "Female"],
            isRequired: true,
            selectedValue: _selectedGender,
            onChanged: (value) {
              _selectedGender = value;
              context.read<FormDataCubit>().accountHolderUpdateGender(value!);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a gender.';
              }
              return null;
            },
          ),
          CustomSliderToggle(
            label:
                "Whether the applicant is an officer or Director or Authorized Representative of any Stock Exchange/Listed Company/Brokerage Firm",
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
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCheckSelector(
            isRequired: true,
            label: "BO Type",
            listOfValues: ["New BO", "Link BO"],
            selectedValue: _selectedBoType,
            onChanged: (value) {
              setState(() {
                _selectedBoType = value;
              });
              context.read<FormDataCubit>().accountHolderUpdateBoType(value!);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please select a BO type.';
              }
              return null;
            },
          ),
          _selectedBoType == "Link BO"
              ? CustomTextField(
                  hintText: "Enter BOID",
                  controller: _boIdController,
                  onChanged: (value) {
                    context.read<FormDataCubit>().accountHolderUpdateBoID(
                      value,
                    );
                  },
                  validator: (value) {
                    if (_selectedBoType == "Link BO" &&
                        (value == null || value.isEmpty)) {
                      return 'Please enter a BOID.';
                    }
                    return null;
                  },
                )
              : Container(),
          SizedBox(height: 8),
          Text(
            "Referral(Lets us know where you heard of our BO account services)",
          ),
          CustomDropdown(
            hintText: "Select an option",
            selectedValue: _selectedReferral,
            values: [
              "Social Media",
              "Offline Event",
              "Dealer",
              "Associate",
              "Friend Recommendation",
            ],
            onChanged: (referral) {
              setState(() {
                _selectedReferral = referral;
              });
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
