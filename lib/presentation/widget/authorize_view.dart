import 'package:bo_acc_form/presentation/bloc/form_data/form_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bo_acc_form/common/widget/custom_date_picker.dart';
import 'package:bo_acc_form/common/widget/custom_dropdown.dart';
import 'package:bo_acc_form/common/widget/custom_text_field.dart';
import 'package:intl/intl.dart';

class AuthorizeView extends StatefulWidget {
  const AuthorizeView({super.key});

  @override
  State<AuthorizeView> createState() => _AuthorizeViewState();
}

class _AuthorizeViewState extends State<AuthorizeView> {
  DateTime? _dob;

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
  final TextEditingController _divisionNameController = TextEditingController();
  String? _selectedCountry;
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _telephoneNumberController =
      TextEditingController();
  final TextEditingController _faxNumberController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _nidController = TextEditingController();
  final TextEditingController _tinController = TextEditingController();

  bool? isOfficerOrDirectorOrAuthorizedRepresentative = false;

  @override
  void initState() {
    super.initState();
    _initializeFromCubit();
  }

  void _initializeFromCubit() {
    final cubit = context.read<FormDataCubit>();
    final entity = cubit.state.accountHolderEntity;
    //make the cubits work for bank and auth// or juss make nominee and documents section and then make everything work
    // app performance seems ass, cubit is too complex cuz im a dumb fuck, only check the form for completion when the next button is pressed

    _selectedCourtesyTitle = entity.courtesyTitle.isNotEmpty
        ? entity.courtesyTitle
        : null;
    _selectedCountry = entity.country.isNotEmpty ? entity.country : null;

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
    _divisionNameController.text = entity.district;
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
    _divisionNameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<FormDataCubit, FormDataState>(
            builder: (context, state) {
              return _buildFirstACHolder(state);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFirstACHolder(FormDataState state) {
    return Container(
      margin: EdgeInsets.all(16),
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
          ),
          CustomTextField(
            hintText: "Enter First Name",
            isRequired: true,
            label: "First Name",
            controller: _firstNameController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateFirstName(value);
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
          ),
          CustomTextField(
            hintText: "Enter National Identity Card Number",
            isRequired: true,
            label: "National ID",
            controller: _nidController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateNid(value);
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
          ),
          CustomTextField(
            hintText: "Enter Post Code",
            isRequired: true,
            label: "Post Code",
            controller: _postCodeController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdatePostCode(value);
            },
          ),
          CustomTextField(
            hintText: "Enter Division",
            isRequired: true,
            label: "Division",
            controller: _divisionNameController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateDistrict(value);
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
          ),
          CustomTextField(
            hintText: "Enter Email Address",
            isRequired: true,
            label: "Email",
            controller: _emailAddressController,
            onChanged: (value) {
              context.read<FormDataCubit>().accountHolderUpdateEmail(value);
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
        ],
      ),
    );
  }
}
