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
  DateTime? _dob;

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

    if (nominee.dateOfBirth.isNotEmpty) {
      try {
        _dob = DateFormat('yyyy-MM-dd').parse(nominee.dateOfBirth);
      } catch (e) {
        _dob = null;
      }
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
      buildWhen: (previous, current) {
        return previous.nominees[widget.index] !=
                current.nominees[widget.index] ||
            previous.isSecondNomineeAvailable !=
                current.isSecondNomineeAvailable;
      },
      builder: (context, state) {
        final nominee = state.nominees[widget.index];

        return SectionBox(
          title: Text(
            widget.mode == 'guardian'
                ? "Guardian Details"
                : "Nominee ${widget.index + 1}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.mode != 'guardian') ...[
                  CustomDropdown(
                    labelText: "Courtesy Title",
                    hintText: "Select an option",
                    values: const ["Mr", "Mrs", "Ms", "Dr"],
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
                    hintText: "Enter First Name",
                    label: "First Name",
                    controller: _firstNameController,
                    onChanged: (value) {
                      context.read<FormDataCubit>().nomineeUpdateFirstName(
                        widget.index,
                        value,
                      );
                    },
                  ),
                  CustomTextField(
                    hintText: "Enter Last Name",
                    label: "Last Name",
                    controller: _lastNameController,
                    onChanged: (value) {
                      context.read<FormDataCubit>().nomineeUpdateLastName(
                        widget.index,
                        value,
                      );
                    },
                  ),
                  CustomTextField(
                    hintText: "Relationship with A/C Holder",
                    label: "Relationship",
                    controller: _relationshipController,
                    onChanged: (value) {
                      context.read<FormDataCubit>().nomineeUpdateRelationship(
                        widget.index,
                        value,
                      );
                    },
                  ),
                  CustomTextField(
                    hintText: "Enter Percentage",
                    label: "Percentage",
                    controller: _percentageController,
                    onChanged: (value) {
                      context.read<FormDataCubit>().nomineeUpdatePercentage(
                        widget.index,
                        value,
                      );
                    },
                  ),
                ],

                CustomCheckSelector(
                  label: "Residential Status",
                  listOfValues: const ["Resident", "Non Resident", "Foreigner"],
                  selectedValue: _selectedResidentialStatus,
                  onChanged: (value) {
                    _selectedResidentialStatus = value;
                    context
                        .read<FormDataCubit>()
                        .nomineeUpdateResidentialStatus(widget.index, value!);
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
                      cubit.nomineeUpdateDateOfBirth(
                        widget.index,
                        DateFormat('yyyy-MM-dd').format(picked),
                      );
                    }
                  },
                  hintText: "YYYY-MM-DD",
                ),

                CustomTextField(
                  hintText: "Enter National Identity Card Number",
                  label: "National ID",
                  controller: _nidController,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdateNid(
                      widget.index,
                      value,
                    );
                  },
                ),

                CustomTextField(
                  hintText: "Enter Address Line 1",
                  label: "Address Line 1",
                  controller: _addressLine1Controller,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdateAddressLine1(
                      widget.index,
                      value,
                    );
                  },
                ),

                CustomTextField(
                  hintText: "Enter Address Line 2",
                  label: "Address Line 2",
                  controller: _addressLine2Controller,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdateAddressLine2(
                      widget.index,
                      value,
                    );
                  },
                ),

                CustomTextField(
                  hintText: "Enter Address Line 3",
                  label: "Address Line 3",
                  controller: _addressLine3Controller,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdateAddressLine3(
                      widget.index,
                      value,
                    );
                  },
                ),

                CustomTextField(
                  hintText: "Enter City",
                  label: "City",
                  controller: _cityController,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdateCity(
                      widget.index,
                      value,
                    );
                  },
                ),

                CustomTextField(
                  hintText: "Enter Post Code",
                  label: "Post Code",
                  controller: _postCodeController,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdatePostCode(
                      widget.index,
                      value,
                    );
                  },
                ),

                CustomTextField(
                  hintText: "Enter Division",
                  label: "Division",
                  controller: _divisionController,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdateDivision(
                      widget.index,
                      value,
                    );
                  },
                ),

                CustomDropdown(
                  labelText: "Country",
                  hintText: "Select an option",
                  values: const ["USA", "Canada", "India", "UK", "Bangladesh"],
                  selectedValue: _selectedCountry,
                  onChanged: (value) {
                    _selectedCountry = value;
                    context.read<FormDataCubit>().nomineeUpdateCountry(
                      widget.index,
                      value!,
                    );
                  },
                ),

                CustomTextField(
                  hintText: "Enter Mobile",
                  label: "Mobile",
                  controller: _mobileController,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdateMobileNumber(
                      widget.index,
                      value,
                    );
                  },
                ),

                CustomTextField(
                  hintText: "Enter Email Address",
                  label: "Email",
                  controller: _emailController,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdateEmail(
                      widget.index,
                      value,
                    );
                  },
                ),

                CustomTextField(
                  hintText: "Enter Telephone Number",
                  label: "Telephone",
                  controller: _telephoneController,
                  onChanged: (value) {
                    context.read<FormDataCubit>().nomineeUpdateTelephone(
                      widget.index,
                      value,
                    );
                  },
                ),

                CustomTextField(
                  hintText: "Enter FAX Number",
                  label: "FAX",
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
                    label: "Is Nominee ${widget.index + 1} a Minor?",
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
                    label: "Do you want to add a 2nd Nominee",
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
