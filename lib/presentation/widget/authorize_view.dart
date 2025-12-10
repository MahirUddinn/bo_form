import 'package:bo_acc_form/common/constants/app_sizes.dart';
import 'package:bo_acc_form/common/constants/app_strings.dart';
import 'package:bo_acc_form/common/widget/section_box.dart';
import 'package:bo_acc_form/presentation/bloc/form_data/form_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bo_acc_form/common/widget/custom_date_picker.dart';
import 'package:bo_acc_form/common/widget/custom_dropdown.dart';
import 'package:bo_acc_form/common/widget/custom_text_field.dart';
import 'package:intl/intl.dart';

class AuthorizeView extends StatefulWidget {
  const AuthorizeView({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<AuthorizeView> createState() => _AuthorizeViewState();
}

class _AuthorizeViewState extends State<AuthorizeView> {
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
  final TextEditingController _divisionNameController = TextEditingController();
  String? _selectedCountry;
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _telephoneNumberController =
      TextEditingController();
  final TextEditingController _faxNumberController = TextEditingController();
  final TextEditingController _nidController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeFromCubit();
  }

  void _initializeFromCubit() {
    final cubit = context.read<FormDataCubit>();
    final entity = cubit.state.authorizeEntity;

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
    _divisionNameController.text = entity.division;
    _mobileNumberController.text = entity.mobileNumber;
    _emailAddressController.text = entity.email;
    _telephoneNumberController.text = entity.telephone;
    _faxNumberController.text = entity.fax;
    _nidController.text = entity.nid;
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
    _divisionNameController.dispose();
    _postCodeController.dispose();
    _mobileNumberController.dispose();
    _emailAddressController.dispose();
    _telephoneNumberController.dispose();
    _faxNumberController.dispose();
    _nidController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: SectionBox(
            title: Text(
              AppStrings.authorize,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppSizes.fs16),
            ),
            child: Form(
              key: widget.formKey,
              child: Column(children: [_buildFirstACHolder(state)]),
            ),
          ),
        );
      },
    );
  }

  Widget _buildFirstACHolder(FormDataState state) {
    return Container(
      margin: EdgeInsets.all(AppSizes.mp16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDropdown(
            labelText: AppStrings.courtesyTitle,
            hintText: AppStrings.selectOption,
            values: [AppStrings.mr, AppStrings.mrs, AppStrings.ms, AppStrings.dr],
            selectedValue: _selectedCourtesyTitle,
            isRequired: true,
            onChanged: (value) {
              setState(() {
                _selectedCourtesyTitle = value;
              });
              context.read<FormDataCubit>().authorizeUpdateCourtesyTitle(
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
              context.read<FormDataCubit>().authorizeUpdateFirstName(value);
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
              context.read<FormDataCubit>().authorizeUpdateLastName(value);
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
              context.read<FormDataCubit>().authorizeUpdateOccupation(value);
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
            selectedDate: state.authorizeEntity.dateOfBirth,
            formatter: DateFormat('yyyy-MM-dd'),
            onTap: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (picked != null) {
                context.read<FormDataCubit>().authorizeUpdateDateOfBirth(
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
            hintText: AppStrings.enterNationalId,
            isRequired: true,
            label: AppStrings.nationalId,
            controller: _nidController,
            onChanged: (value) {
              context.read<FormDataCubit>().authorizeUpdateNid(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.enterNationalIdError;
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
              context.read<FormDataCubit>().authorizeUpdateFatherName(value);
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
              context.read<FormDataCubit>().authorizeUpdateMotherName(value);
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
              context.read<FormDataCubit>().authorizeUpdateAddressLine1(value);
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
              context.read<FormDataCubit>().authorizeUpdateAddressLine2(value);
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterAddressLine3,
            isRequired: false,
            label: AppStrings.addressLine3,
            controller: _addressLine3Controller,
            onChanged: (value) {
              context.read<FormDataCubit>().authorizeUpdateAddressLine3(value);
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterCity,
            isRequired: true,
            label: AppStrings.city,
            controller: _cityNameController,
            onChanged: (value) {
              context.read<FormDataCubit>().authorizeUpdateCity(value);
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
              context.read<FormDataCubit>().authorizeUpdatePostCode(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.enterPostCodeError;
              }
              return null;
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterDivision,
            isRequired: true,
            label: AppStrings.division,
            controller: _divisionNameController,
            onChanged: (value) {
              context.read<FormDataCubit>().authorizeUpdateDivision(value);
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.enterDivisionError;
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
              setState(() {
                _selectedCountry = value;
              });
              context.read<FormDataCubit>().authorizeUpdateCountry(value!);
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
              context.read<FormDataCubit>().authorizeUpdateMobileNumber(value);
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
              context.read<FormDataCubit>().authorizeUpdateEmail(value);
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
              context.read<FormDataCubit>().authorizeUpdateTelephone(value);
            },
          ),
          CustomTextField(
            hintText: AppStrings.enterFax,
            isRequired: false,
            label: AppStrings.fax,
            controller: _faxNumberController,
            onChanged: (value) {
              context.read<FormDataCubit>().authorizeUpdateFax(value);
            },
          ),
        ],
      ),
    );
  }
}
