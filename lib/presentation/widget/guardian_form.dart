import 'package:bo_acc_form/common/constants/app_sizes.dart';
import 'package:bo_acc_form/common/constants/app_strings.dart';
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

  const GuardianForm({
    super.key,
    required this.nominee,
    required this.nomineeIndex,
  });

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
        AppStrings.guardianDetails,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppSizes.fs16),
      ),
      child: Container(
        padding: EdgeInsets.all(AppSizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropdown(
              labelText: AppStrings.courtesyTitle,
              hintText: AppStrings.selectOption,
              values: [AppStrings.mr, AppStrings.mrs, AppStrings.ms, AppStrings.dr],
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
              hintText: AppStrings.enterFirstName,
              label: AppStrings.firstName,
              controller: _guardianFirstNameController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianFirstName(
                  widget.nomineeIndex,
                  value,
                );
              },
              isRequired: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.enterFirstNameError;
                }
                return null;
              },
            ),
            CustomTextField(
              hintText: AppStrings.enterLastName,
              label: AppStrings.lastName,
              controller: _guardianLastNameController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianLastName(
                  widget.nomineeIndex,
                  value,
                );
              },
              isRequired: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.enterLastNameError;
                }
                return null;
              },
            ),
            CustomTextField(
              hintText: AppStrings.relationshipWithNominee,
              label: AppStrings.relationship,
              controller: _guardianRelationshipController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianRelationship(
                  widget.nomineeIndex,
                  value,
                );
              },
              isRequired: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.enterRelationshipError;
                }
                return null;
              },
            ),
            CustomDatePicker(
              labelText: AppStrings.maturityDateLabel,
              selectedDate: widget.nominee.guardianDateOfMaturity,
              formatter: DateFormat('yyyy-MM-dd'),
              isRequired: true,
              onTap: () async {
                final cubit = context.read<FormDataCubit>();
                final picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(DateTime.now().year + 18),
                );
                if (picked != null) {
                  cubit.nomineeUpdateGuardianDateOfMaturity(
                    widget.nomineeIndex,
                    picked,
                  );
                }
              },
              hintText: AppStrings.dobHint,
              validator: (value) {
                if (value == null) {
                  return AppStrings.selectMaturityDateError;
                }
                return null;
              },
            ),
            CustomCheckSelector(
              label: AppStrings.residentialStatus,
              listOfValues: [AppStrings.resident, AppStrings.nonResident, AppStrings.foreigner],
              selectedValue: _selectedResidentialStatus,
              isRequired: true,
              onChanged: (value) {
                _selectedResidentialStatus = value;
                context
                    .read<FormDataCubit>()
                    .nomineeUpdateGuardianResidentialStatus(
                      widget.nomineeIndex,
                      value!,
                    );
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.selectResidentialStatusError;
                }
                return null;
              },
            ),
            CustomDatePicker(
              labelText: AppStrings.dobLabel,
              selectedDate: widget.nominee.guardianDateOfBirth,
              formatter: DateFormat('yyyy-MM-dd'),
              isRequired: true,
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (picked != null) {
                  context
                      .read<FormDataCubit>()
                      .nomineeUpdateGuardianDateOfBirth(
                        widget.nomineeIndex,
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
              label: AppStrings.nationalId,
              controller: _guardianNidController,
              isRequired: true,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianNid(
                  widget.nomineeIndex,
                  value,
                );
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.enterNationalIdError;
                }
                return null;
              },
            ),
            CustomTextField(
              hintText: AppStrings.enterAddressLine1,
              label: AppStrings.addressLine1,
              controller: _guardianAddressLine1Controller,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianAddressLine1(
                  widget.nomineeIndex,
                  value,
                );
              },
              isRequired: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.enterAddressError;
                }
                return null;
              },
            ),
            CustomTextField(
              hintText: AppStrings.enterAddressLine2,
              label: AppStrings.addressLine2,
              controller: _guardianAddressLine2Controller,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianAddressLine2(
                  widget.nomineeIndex,
                  value,
                );
              },
            ),
            CustomTextField(
              hintText: AppStrings.enterAddressLine3,
              label: AppStrings.addressLine3,
              controller: _guardianAddressLine3Controller,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianAddressLine3(
                  widget.nomineeIndex,
                  value,
                );
              },
            ),
            CustomTextField(
              hintText: AppStrings.enterCity,
              label: AppStrings.city,
              controller: _guardianCityController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianCity(
                  widget.nomineeIndex,
                  value,
                );
              },
              isRequired: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.enterCityError;
                }
                return null;
              },
            ),
            CustomTextField(
              hintText: AppStrings.enterPostCode,
              label: AppStrings.postCode,
              controller: _guardianPostCodeController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianPostCode(
                  widget.nomineeIndex,
                  value,
                );
              },
              isRequired: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.enterPostCodeError;
                }
                return null;
              },
            ),
            CustomTextField(
              hintText: AppStrings.enterDivision,
              label: AppStrings.division,
              controller: _guardianDivisionController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianDivision(
                  widget.nomineeIndex,
                  value,
                );
              },
              isRequired: true,
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
              values: [
                AppStrings.usa,
                AppStrings.canada,
                AppStrings.india,
                AppStrings.uk,
                AppStrings.bangladesh
              ],
              selectedValue: _selectedCountry,
              onChanged: (value) {
                _selectedCountry = value;

                context.read<FormDataCubit>().nomineeUpdateGuardianCountry(
                  widget.nomineeIndex,
                  value!,
                );
              },
              isRequired: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.selectCountryError;
                }
                return null;
              },
            ),
            CustomTextField(
              hintText: AppStrings.enterEmail,
              label: AppStrings.email,
              controller: _guardianEmailController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianEmail(
                  widget.nomineeIndex,
                  value,
                );
              },
            ),
            CustomTextField(
              hintText: AppStrings.enterMobile,
              label: AppStrings.mobile,
              controller: _guardianMobileController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianMobileNumber(
                  widget.nomineeIndex,
                  value,
                );
              },
              isRequired: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.enterMobileError;
                }
                return null;
              },
            ),
            CustomTextField(
              hintText: AppStrings.enterTelephone,
              label: AppStrings.telephone,
              controller: _guardianTelephoneController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianTelephone(
                  widget.nomineeIndex,
                  value,
                );
              },
            ),
            CustomTextField(
              hintText: AppStrings.enterFax,
              label: AppStrings.fax,
              controller: _guardianFaxController,
              onChanged: (value) {
                context.read<FormDataCubit>().nomineeUpdateGuardianFax(
                  widget.nomineeIndex,
                  value,
                );
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.enterFaxError;
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
