import 'package:bo_acc_form/common/constants/app_sizes.dart';
import 'package:bo_acc_form/common/constants/app_strings.dart';
import 'package:bo_acc_form/presentation/bloc/form_data/form_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bo_acc_form/common/widget/custom_slider_toggle.dart';
import 'package:bo_acc_form/common/widget/section_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bo_acc_form/common/widget/custom_date_picker.dart';
import 'package:bo_acc_form/common/widget/custom_check_selector.dart';
import 'package:bo_acc_form/common/widget/custom_dropdown.dart';
import 'package:bo_acc_form/common/widget/custom_text_field.dart';
import 'package:intl/intl.dart';
import 'package:bo_acc_form/presentation/widget/guardian_form.dart';

class NomineeForm extends StatefulWidget {
  final int index;
  final String mode;

  const NomineeForm({super.key, required this.index, required this.mode});

  @override
  State<NomineeForm> createState() => _NomineeFormState();
}

class _NomineeFormState extends State<NomineeForm> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _relationshipController = TextEditingController();
  final _percentageController = TextEditingController();
  final _nidController = TextEditingController();
  final _addressLine1Controller = TextEditingController();
  final _addressLine2Controller = TextEditingController();
  final _addressLine3Controller = TextEditingController();
  final _cityController = TextEditingController();
  final _postCodeController = TextEditingController();
  final _divisionController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _faxController = TextEditingController();

  String? _selectedResidentialStatus;
  String? _selectedCountry;

  @override
  void initState() {
    super.initState();
    _initiateFromCubit();
  }

  void _initiateFromCubit() {
    final cubit = context.read<FormDataCubit>();
    final nominees = cubit.state.nominees;

    if (widget.index >= nominees.length) {
      for (int i = nominees.length; i <= widget.index; i++) {
        cubit.addNominee();
      }
    }
    if (widget.index < cubit.state.nominees.length) {
      final nominee = cubit.state.nominees[widget.index];

      _selectedResidentialStatus = nominee.residentialStatus.isNotEmpty
          ? nominee.residentialStatus
          : null;
      _selectedCountry = nominee.country.isNotEmpty ? nominee.country : null;

      _firstNameController.text = nominee.firstName;
      _lastNameController.text = nominee.lastName;
      _relationshipController.text = nominee.relationship;
      _percentageController.text = nominee.percentage;
      _nidController.text = nominee.nid;
      _addressLine1Controller.text = nominee.addressLine1;
      _addressLine2Controller.text = nominee.addressLine2;
      _addressLine3Controller.text = nominee.addressLine3;
      _cityController.text = nominee.city;
      _postCodeController.text = nominee.postCode;
      _divisionController.text = nominee.division;
      _mobileController.text = nominee.mobileNumber;
      _emailController.text = nominee.email;
      _telephoneController.text = nominee.telephone;
      _faxController.text = nominee.fax;
    }
  }

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
    _cityController.dispose();
    _postCodeController.dispose();
    _divisionController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _telephoneController.dispose();
    _faxController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) {
        if (widget.index >= state.nominees.length) {
          return SizedBox.shrink();
        }

        final nominee = state.nominees[widget.index];

        return SectionBox(
          title: Text(
            widget.mode == 'guardian'
                ? AppStrings.guardianDetails
                : "${AppStrings.nomineeLabel} ${widget.index + 1}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppSizes.fs16),
          ),
          child: Container(
            padding: EdgeInsets.all(AppSizes.mp16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.mode != 'guardian') ...[
                  CustomDropdown(
                    labelText: AppStrings.courtesyTitle,
                    hintText: AppStrings.selectOption,
                    values: [AppStrings.mr, AppStrings.mrs, AppStrings.ms, AppStrings.dr],
                    selectedValue: nominee.courtesyTitle.isEmpty
                        ? null
                        : nominee.courtesyTitle,
                    onChanged: (value) {
                      context.read<FormDataCubit>().nomineeUpdateCourtesyTitle(
                        widget.index,
                        value!,
                      );
                    },
                  ),
                  CustomTextField(
                    hintText: AppStrings.enterFirstName,
                    label: AppStrings.firstName,
                    controller: _firstNameController,
                    onChanged: (value) {
                      context.read<FormDataCubit>().nomineeUpdateFirstName(
                        widget.index,
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
                    controller: _lastNameController,
                    onChanged: (value) {
                      context.read<FormDataCubit>().nomineeUpdateLastName(
                        widget.index,
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
                    hintText: AppStrings.relationshipHint,
                    label: AppStrings.relationship,
                    controller: _relationshipController,
                    onChanged: (value) {
                      context.read<FormDataCubit>().nomineeUpdateRelationship(
                        widget.index,
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
                  CustomTextField(
                    hintText: AppStrings.enterPercentage,
                    label: AppStrings.percentage,
                    controller: _percentageController,
                    onChanged: (value) {
                      context.read<FormDataCubit>().nomineeUpdatePercentage(
                        widget.index,
                        value,
                      );
                    },
                    isRequired: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return AppStrings.enterPercentageError;
                      }
                      return null;
                    },
                  ),
                ],
                CustomCheckSelector(
                  label: AppStrings.residentialStatus,
                  listOfValues: [AppStrings.resident, AppStrings.nonResident, AppStrings.foreigner],
                  selectedValue: _selectedResidentialStatus,
                  onChanged: (value) {
                    _selectedResidentialStatus = value;
                    context
                        .read<FormDataCubit>()
                        .nomineeUpdateResidentialStatus(widget.index, value!);
                  },
                  isRequired: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.selectResidentialStatusError;
                    }
                    return null;
                  },
                ),
                CustomDatePicker(
                  labelText: AppStrings.dobLabel,
                  selectedDate: nominee.dateOfBirth,
                  formatter: DateFormat('yyyy-MM-dd'),
                  onTap: () async {
                    final cubit = context.read<FormDataCubit>();
                    final picked = await showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      cubit.nomineeUpdateDateOfBirth(widget.index, picked);
                    }
                  },
                  hintText: AppStrings.dobHint,
                  isRequired: true,
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
                  controller: _nidController,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdateNid(
                      widget.index,
                      value,
                    );
                  },
                  isRequired: true,
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
                  controller: _addressLine1Controller,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdateAddressLine1(
                      widget.index,
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
                  controller: _addressLine2Controller,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdateAddressLine2(
                      widget.index,
                      value,
                    );
                  },
                ),
                CustomTextField(
                  hintText: AppStrings.enterAddressLine3,
                  label: AppStrings.addressLine3,
                  controller: _addressLine3Controller,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdateAddressLine3(
                      widget.index,
                      value,
                    );
                  },
                ),
                CustomTextField(
                  hintText: AppStrings.enterCity,
                  label: AppStrings.city,
                  controller: _cityController,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdateCity(
                      widget.index,
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
                  controller: _postCodeController,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdatePostCode(
                      widget.index,
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
                  controller: _divisionController,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdateDivision(
                      widget.index,
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
                    setState(() {
                      _selectedCountry = value;
                    });
                    context.read<FormDataCubit>().nomineeUpdateCountry(
                      widget.index,
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
                  controller: _emailController,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdateEmail(
                      widget.index,
                      value,
                    );
                  },
                ),
                CustomTextField(
                  hintText: AppStrings.enterMobile,
                  label: AppStrings.mobile,
                  controller: _mobileController,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdateMobileNumber(
                      widget.index,
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
                  controller: _telephoneController,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdateTelephone(
                      widget.index,
                      value,
                    );
                  },
                ),
                CustomTextField(
                  hintText: AppStrings.enterFax,
                  label: AppStrings.fax,
                  controller: _faxController,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdateFax(
                      widget.index,
                      value,
                    );
                  },
                ),
                if (widget.mode != 'guardian')
                  CustomSliderToggle(
                    label: "${AppStrings.isNomineeMinorPrefix}${widget.index + 1}${AppStrings.isNomineeMinorSuffix}",
                    selectedValue: nominee.isNomineeMinor,
                    onChanged: (value) {
                      context.read<FormDataCubit>().nomineeUpdateIsNomineeMinor(
                        widget.index,
                        value!,
                      );
                    },
                  ),
                if (nominee.isNomineeMinor && widget.mode != 'guardian')
                  GuardianForm(nominee: nominee, nomineeIndex: widget.index),
                if (widget.mode == 'primary')
                  CustomSliderToggle(
                    label: AppStrings.addSecondNominee,
                    selectedValue: state.isSecondNomineeAvailable,
                    onChanged: (value) {
                      context.read<FormDataCubit>().toggleSecondNominee();
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
