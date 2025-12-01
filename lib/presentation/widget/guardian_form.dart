import 'package:flutter/material.dart';
import 'package:bo_acc_form/presentation/bloc/form_data/form_data_cubit.dart';
import 'package:bo_acc_form/domain/entities/nominee_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:bo_acc_form/common/widget/custom_date_picker.dart';
import 'package:bo_acc_form/common/widget/custom_check_selector.dart';
import 'package:bo_acc_form/common/widget/custom_dropdown.dart';
import 'package:bo_acc_form/common/widget/custom_text_field.dart';
import 'package:bo_acc_form/common/widget/section_box.dart';

class GuardianForm extends StatefulWidget {
  final NomineeEntity nominee;
  final int nomineeIndex;

  const GuardianForm({super.key, required this.nominee, required this.nomineeIndex});

  @override
  State<GuardianForm> createState() => _GuardianFormState();
}

class _GuardianFormState extends State<GuardianForm> {
  final _guardianFirstNameController = TextEditingController();
  final _guardianLastNameController = TextEditingController();
  final _guardianRelationshipController = TextEditingController();
  final _guardianNidController = TextEditingController();
  final _guardianAddressLine1Controller = TextEditingController();
  final _guardianAddressLine2Controller = TextEditingController();
  final _guardianAddressLine3Controller = TextEditingController();
  final _guardianCityController = TextEditingController();
  final _guardianPostCodeController = TextEditingController();
  final _guardianDivisionController = TextEditingController();
  final _guardianMobileController = TextEditingController();
  final _guardianEmailController = TextEditingController();
  final _guardianTelephoneController = TextEditingController();
  final _guardianFaxController = TextEditingController();

  String? _selectedResidentialStatus;
  String? _selectedCountry;
  DateTime? _dob;
  DateTime? _dom;


  @override
  void initState() {
    super.initState();
    _initiateFromCubit(widget.nominee);
  }

  void _initiateFromCubit(NomineeEntity nominee) {
    _selectedResidentialStatus = nominee.guardianResidentialStatus.isNotEmpty
        ? nominee.guardianResidentialStatus
        : null;
    _selectedCountry = nominee.guardianCountry.isNotEmpty
        ? nominee.guardianCountry
        : null;

    _guardianFirstNameController.text = nominee.guardianFirstName;
    _guardianLastNameController.text = nominee.guardianLastName;
    _guardianRelationshipController.text = nominee.guardianRelationship;
    _guardianNidController.text = nominee.guardianNid;
    _guardianAddressLine1Controller.text = nominee.guardianAddressLine1;
    _guardianAddressLine2Controller.text = nominee.guardianAddressLine2;
    _guardianAddressLine3Controller.text = nominee.guardianAddressLine3;
    _guardianCityController.text = nominee.guardianCity;
    _guardianPostCodeController.text = nominee.guardianPostCode;
    _guardianDivisionController.text = nominee.guardianDivision;
    _guardianMobileController.text = nominee.guardianMobileNumber;
    _guardianEmailController.text = nominee.guardianEmail;
    _guardianTelephoneController.text = nominee.guardianTelephone;
    _guardianFaxController.text = nominee.guardianFax;

    if (nominee.guardianDateOfBirth.isNotEmpty) {
      try {
        _dob = DateFormat('yyyy-MM-dd').parse(nominee.guardianDateOfBirth);
      } catch (e) {
        _dob = null;
      }
    }
  }

  @override
  void dispose() {
    _guardianFirstNameController.dispose();
    _guardianLastNameController.dispose();
    _guardianRelationshipController.dispose();
    _guardianNidController.dispose();
    _guardianAddressLine1Controller.dispose();
    _guardianAddressLine2Controller.dispose();
    _guardianAddressLine3Controller.dispose();
    _guardianCityController.dispose();
    _guardianPostCodeController.dispose();
    _guardianDivisionController.dispose();
    _guardianMobileController.dispose();
    _guardianEmailController.dispose();
    _guardianTelephoneController.dispose();
    _guardianFaxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SectionBox(
      title: Text(
        "Guardian Details",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropdown(
              labelText: "Courtesy Title",
              hintText: "Select an option",
              values: ["Mr", "Mrs", "Ms", "Dr"],
              selectedValue: widget.nominee.guardianCourtesyTitle.isEmpty
                  ? null
                  : widget.nominee.guardianCourtesyTitle,
              onChanged: (value) {
                context
                    .read<FormDataCubit>()
                    .nomineeUpdateGuardianCourtesyTitle(
                      widget.nomineeIndex,
                      value!,
                    );
              },
            ),
            CustomTextField(
              hintText: "Enter First Name",
              label: "First Name",
              controller: _guardianFirstNameController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianFirstName(
                  widget.nomineeIndex,
                  value,
                );
              },
            ),
            CustomTextField(
              hintText: "Enter Last Name",
              label: "Last Name",
              controller: _guardianLastNameController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianLastName(
                  widget.nomineeIndex,
                  value,
                );
              },
            ),
            CustomTextField(
              hintText: "Relationship with Nominee",
              label: "Relationship",
              controller: _guardianRelationshipController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianRelationship(
                  widget.nomineeIndex,
                  value,
                );
              },
            ),
            CustomDatePicker(
              labelText: "Maturity Date of Minor(YYYY-MM-DD)",
              selectedDate: _dom,
              formatter: DateFormat('yyyy-MM-dd'),
              onTap: () async {
                final cubit = context.read<FormDataCubit>();
                final picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(DateTime.now().year+18),
                );
                if (picked != null) {
                  setState(() {
                    _dom = picked;
                  });
                  if (!mounted) return;
                  cubit.nomineeUpdateGuardianDateOfMaturity(
                    widget.nomineeIndex,
                    DateFormat('yyyy-MM-dd').format(picked),
                  );
                }
              },
              hintText: "YYYY-MM-DD",
            ),
            CustomCheckSelector(
              label: "Residential Status",
              listOfValues: ["Resident", "Non Resident", "Foreigner"],
              selectedValue: _selectedResidentialStatus,
              onChanged: (value) {
                _selectedResidentialStatus = value;
                context
                    .read<FormDataCubit>()
                    .nomineeUpdateGuardianResidentialStatus(
                      widget.nomineeIndex,
                      value!,
                    );
              },
            ),
            CustomDatePicker(
              labelText: "Date of Birth (YYYY-MM-DD)",
              selectedDate: _dob,
              formatter: DateFormat('yyyy-MM-dd'),
              onTap: () async {
                final cubit = context.read<FormDataCubit>();
                final picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (picked != null) {
                  setState(() {
                    _dob = picked;
                  });
                  if (!mounted) return;
                  cubit.nomineeUpdateGuardianDateOfBirth(
                    widget.nomineeIndex,
                    DateFormat('yyyy-MM-dd').format(picked),
                  );
                }
              },
              hintText: "YYYY-MM-DD",
            ),
            CustomTextField(
              hintText: "Enter National Identity Card Number",
              label: "National ID",
              controller: _guardianNidController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianNid(
                  widget.nomineeIndex,
                  value,
                );
              },
            ),
            CustomTextField(
              hintText: "Enter Address Line 1",
              label: "Address Line 1",
              controller: _guardianAddressLine1Controller,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianAddressLine1(
                  widget.nomineeIndex,
                  value,
                );
              },
            ),
            CustomTextField(
              hintText: "Enter Address Line 2",
              label: "Address Line 2",
              controller: _guardianAddressLine2Controller,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianAddressLine2(
                  widget.nomineeIndex,
                  value,
                );
              },
            ),
            CustomTextField(
              hintText: "Enter Address Line 3",
              label: "Address Line 3",
              controller: _guardianAddressLine3Controller,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianAddressLine3(
                  widget.nomineeIndex,
                  value,
                );
              },
            ),
            CustomTextField(
              hintText: "Enter City",
              label: "City",
              controller: _guardianCityController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianCity(
                  widget.nomineeIndex,
                  value,
                );
              },
            ),
            CustomTextField(
              hintText: "Enter Post Code",
              label: "Post Code",
              controller: _guardianPostCodeController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianPostCode(
                  widget.nomineeIndex,
                  value,
                );
              },
            ),
            CustomTextField(
              hintText: "Enter Division",
              label: "Division",
              controller: _guardianDivisionController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianDivision(
                  widget.nomineeIndex,
                  value,
                );
              },
            ),
            CustomDropdown(
              labelText: "Country",
              hintText: "Select an option",
              values: ["USA", "Canada", "India", "UK", "Bangladesh"],
              selectedValue: _selectedCountry,
              onChanged: (value) {
                _selectedCountry = value;

                context.read<FormDataCubit>().nomineeUpdateGuardianCountry(
                  widget.nomineeIndex,
                  value!,
                );
              },
            ),
            CustomTextField(
              hintText: "Enter Mobile",
              label: "Mobile",
              controller: _guardianMobileController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianMobileNumber(
                  widget.nomineeIndex,
                  value,
                );
              },
            ),
            CustomTextField(
              hintText: "Enter Email Address",
              label: "Email",
              controller: _guardianEmailController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianEmail(
                  widget.nomineeIndex,
                  value,
                );
              },
            ),
            CustomTextField(
              hintText: "Enter Telephone Number",
              label: "Telephone",
              controller: _guardianTelephoneController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianTelephone(
                  widget.nomineeIndex,
                  value,
                );
              },
            ),
            CustomTextField(
              hintText: "Enter FAX Number",
              label: "FAX",
              controller: _guardianFaxController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianFax(
                  widget.nomineeIndex,
                  value,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
