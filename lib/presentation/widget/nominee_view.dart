import 'package:bo_acc_form/common/widget/custom_slider_toggle.dart';
import 'package:bo_acc_form/common/widget/section_box.dart';
import 'package:bo_acc_form/presentation/bloc/form_data/form_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bo_acc_form/common/widget/custom_date_picker.dart';
import 'package:bo_acc_form/common/widget/custom_check_selector.dart';
import 'package:bo_acc_form/common/widget/custom_dropdown.dart';
import 'package:bo_acc_form/common/widget/custom_text_field.dart';
import 'package:intl/intl.dart';

class NomineeView extends StatefulWidget {
  const NomineeView({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  State<NomineeView> createState() => _NomineeViewState();
}

class _NomineeViewState extends State<NomineeView> {
  DateTime? _dob;

  String? _selectedCourtesyTitle;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _relationshipController = TextEditingController();
  final TextEditingController _percentageController = TextEditingController();
  String? _selectedResidentialStatus;
  String? _formattedDateOfBirth;
  final TextEditingController _nidController = TextEditingController();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _addressLine3Controller = TextEditingController();
  final TextEditingController _cityNameController = TextEditingController();
  final TextEditingController _postCodeController = TextEditingController();
  final TextEditingController _divisionNameController = TextEditingController();
  String? _selectedCountry;
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _telephoneNumberController =
      TextEditingController();
  final TextEditingController _faxNumberController = TextEditingController();
  bool isSecondNomineeAvailable = false;
  bool isNomineeMinor = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _relationshipController.dispose();
    _percentageController.dispose();
    _nidController.dispose();
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    _addressLine3Controller.dispose();
    _cityNameController.dispose();
    _postCodeController.dispose();
    _divisionNameController.dispose();
    _mobileNumberController.dispose();
    _emailAddressController.dispose();
    _telephoneNumberController.dispose();
    _faxNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: widget.key,
            child: Column(
              children: [
                SectionBox(
                  title: Text(
                    "Nominee 1",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  child: _buildNominee(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  //make a separate widget to show these items and so that when you turn isNomineeMinor to true it shows the widget with its own controllers so that its easier to handle
  Widget _buildNominee() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            onChanged: (value) {},
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
            onChanged: (value) {},
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a last name.';
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: "Relationship with A/C Holder",
            isRequired: true,
            label: "Relationship",
            controller: _relationshipController,
            onChanged: (value) {},
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a relationship.';
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: "Enter Percentage",
            isRequired: true,
            label: "Percentage",
            controller: _percentageController,
            onChanged: (value) {},
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter percentage.';
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
                  _formattedDateOfBirth = DateFormat(
                    'yyyy-MM-dd',
                  ).format(picked);
                  _dob = picked;
                });
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
            hintText: "Enter National Identity Card Number",
            isRequired: true,
            label: "National ID",
            controller: _nidController,
            onChanged: (value) {},
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a national ID.';
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: "Enter Address Line 1",
            isRequired: true,
            label: "Address Line 1",
            controller: _addressLine1Controller,
            onChanged: (value) {},
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
            onChanged: (value) {},
          ),
          CustomTextField(
            hintText: "Enter Address Line 3",
            isRequired: false,
            label: "Address Line 3",
            controller: _addressLine3Controller,
            onChanged: (value) {},
          ),
          CustomTextField(
            hintText: "Enter City",
            isRequired: true,
            label: "City",
            controller: _cityNameController,
            onChanged: (value) {},
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
            onChanged: (value) {},
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a post code.';
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: "Enter Division",
            isRequired: true,
            label: "Division",
            controller: _divisionNameController,
            onChanged: (value) {},
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a Division.';
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
            onChanged: (value) {},
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
            onChanged: (value) {},
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
            onChanged: (value) {},
          ),
          CustomTextField(
            hintText: "Enter FAX Number",
            isRequired: false,
            label: "FAX",
            controller: _faxNumberController,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  _buildSecondNomineePrompt() {
    return CustomSliderToggle(
      label: "Do you want to add a 2nd Nominee",
      selectedValue: isSecondNomineeAvailable,
      onChanged: (value) {
        isSecondNomineeAvailable = value!;
      },
    );
  }

  _buildMinorPrompt() {
    return CustomSliderToggle(
      label: "Do you want to add Nominee 1 Guardian (If Nominee is A Minor) ?",
      selectedValue: isNomineeMinor,
      onChanged: (value) {
        isNomineeMinor = value!;
      },
    );
  }
}
