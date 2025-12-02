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

class GuardianForm extends StatelessWidget {
  final int nomineeIndex;

  const GuardianForm({
    super.key,
    required this.nomineeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SectionBox(
      title: const Text(
        "Guardian Details",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GuardianCourtesyTitleDropdown(nomineeIndex: nomineeIndex),
            GuardianFirstNameTextField(nomineeIndex: nomineeIndex),
            GuardianLastNameTextField(nomineeIndex: nomineeIndex),
            GuardianRelationshipTextField(nomineeIndex: nomineeIndex),
            GuardianMaturityDatePicker(nomineeIndex: nomineeIndex),
            GuardianResidentialStatusSelector(nomineeIndex: nomineeIndex),
            GuardianDateOfBirthPicker(nomineeIndex: nomineeIndex),
            GuardianNidTextField(nomineeIndex: nomineeIndex),
            GuardianAddressLine1TextField(nomineeIndex: nomineeIndex),
            GuardianAddressLine2TextField(nomineeIndex: nomineeIndex),
            GuardianAddressLine3TextField(nomineeIndex: nomineeIndex),
            GuardianCityTextField(nomineeIndex: nomineeIndex),
            GuardianPostCodeTextField(nomineeIndex: nomineeIndex),
            GuardianDivisionTextField(nomineeIndex: nomineeIndex),
            GuardianCountryDropdown(nomineeIndex: nomineeIndex),
            GuardianEmailTextField(nomineeIndex: nomineeIndex),
            GuardianMobileTextField(nomineeIndex: nomineeIndex),
            GuardianTelephoneTextField(nomineeIndex: nomineeIndex),
            GuardianFaxTextField(nomineeIndex: nomineeIndex),
          ],
        ),
      ),
    );
  }
}

// Individual widget components for GuardianForm

class GuardianCourtesyTitleDropdown extends StatelessWidget {
  final int nomineeIndex;

  const GuardianCourtesyTitleDropdown({
    super.key,
    required this.nomineeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        final prevNominee = _getNominee(previous, nomineeIndex);
        final currNominee = _getNominee(current, nomineeIndex);
        return prevNominee.guardianCourtesyTitle != currNominee.guardianCourtesyTitle;
      },
      builder: (context, state) {
        final nominee = _getNominee(state, nomineeIndex);
        return CustomDropdown(
          labelText: "Courtesy Title",
          hintText: "Select an option",
          values: const ["Mr", "Mrs", "Ms", "Dr"],
          selectedValue: nominee.guardianCourtesyTitle.isEmpty
              ? null
              : nominee.guardianCourtesyTitle,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateGuardianCourtesyTitle(
              nomineeIndex,
              value!,
            );
          },
        );
      },
    );
  }

  NomineeEntity _getNominee(FormDataState state, int index) {
    if (index >= 0 && index < state.nominees.length) {
      return state.nominees[index];
    }
    return NomineeEntity.empty();
  }
}

class GuardianFirstNameTextField extends StatefulWidget {
  final int nomineeIndex;

  const GuardianFirstNameTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<GuardianFirstNameTextField> createState() =>
      _GuardianFirstNameTextFieldState();
}

class _GuardianFirstNameTextFieldState
    extends State<GuardianFirstNameTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        final prevNominee = _getNominee(previous, widget.nomineeIndex);
        final currNominee = _getNominee(current, widget.nomineeIndex);
        return prevNominee.guardianFirstName != currNominee.guardianFirstName;
      },
      builder: (context, state) {
        final nominee = _getNominee(state, widget.nomineeIndex);
        if (_controller.text != nominee.guardianFirstName) {
          _controller.text = nominee.guardianFirstName;
        }
        return CustomTextField(
          hintText: "Enter First Name",
          label: "First Name",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateGuardianFirstName(
              widget.nomineeIndex,
              value,
            );
          },
          isRequired: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a first name.';
            }
            return null;
          },
        );
      },
    );
  }

  NomineeEntity _getNominee(FormDataState state, int index) {
    if (index >= 0 && index < state.nominees.length) {
      return state.nominees[index];
    }
    return NomineeEntity.empty();
  }
}

class GuardianLastNameTextField extends StatefulWidget {
  final int nomineeIndex;

  const GuardianLastNameTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<GuardianLastNameTextField> createState() =>
      _GuardianLastNameTextFieldState();
}

class _GuardianLastNameTextFieldState extends State<GuardianLastNameTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        final prevNominee = _getNominee(previous, widget.nomineeIndex);
        final currNominee = _getNominee(current, widget.nomineeIndex);
        return prevNominee.guardianLastName != currNominee.guardianLastName;
      },
      builder: (context, state) {
        final nominee = _getNominee(state, widget.nomineeIndex);
        if (_controller.text != nominee.guardianLastName) {
          _controller.text = nominee.guardianLastName;
        }
        return CustomTextField(
          hintText: "Enter Last Name",
          label: "Last Name",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateGuardianLastName(
              widget.nomineeIndex,
              value,
            );
          },
          isRequired: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a last name.';
            }
            return null;
          },
        );
      },
    );
  }

  NomineeEntity _getNominee(FormDataState state, int index) {
    if (index >= 0 && index < state.nominees.length) {
      return state.nominees[index];
    }
    return NomineeEntity.empty();
  }
}

class GuardianRelationshipTextField extends StatefulWidget {
  final int nomineeIndex;

  const GuardianRelationshipTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<GuardianRelationshipTextField> createState() =>
      _GuardianRelationshipTextFieldState();
}

class _GuardianRelationshipTextFieldState
    extends State<GuardianRelationshipTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        final prevNominee = _getNominee(previous, widget.nomineeIndex);
        final currNominee = _getNominee(current, widget.nomineeIndex);
        return prevNominee.guardianRelationship != currNominee.guardianRelationship;
      },
      builder: (context, state) {
        final nominee = _getNominee(state, widget.nomineeIndex);
        if (_controller.text != nominee.guardianRelationship) {
          _controller.text = nominee.guardianRelationship;
        }
        return CustomTextField(
          hintText: "Relationship with Nominee",
          label: "Relationship",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateGuardianRelationship(
              widget.nomineeIndex,
              value,
            );
          },
          isRequired: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a relationship.';
            }
            return null;
          },
        );
      },
    );
  }

  NomineeEntity _getNominee(FormDataState state, int index) {
    if (index >= 0 && index < state.nominees.length) {
      return state.nominees[index];
    }
    return NomineeEntity.empty();
  }
}

class GuardianMaturityDatePicker extends StatelessWidget {
  final int nomineeIndex;

  const GuardianMaturityDatePicker({
    super.key,
    required this.nomineeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        final prevNominee = _getNominee(previous, nomineeIndex);
        final currNominee = _getNominee(current, nomineeIndex);
        return prevNominee.guardianDateOfMaturity != currNominee.guardianDateOfMaturity;
      },
      builder: (context, state) {
        final nominee = _getNominee(state, nomineeIndex);
        return CustomDatePicker(
          labelText: "Maturity Date of Minor(YYYY-MM-DD)",
          selectedDate: nominee.guardianDateOfMaturity,
          formatter: DateFormat('yyyy-MM-dd'),
          isRequired: true,
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              lastDate: DateTime(DateTime.now().year + 18),
            );
            if (picked != null) {
              context.read<FormDataCubit>().nomineeUpdateGuardianDateOfMaturity(
                nomineeIndex,
                picked,
              );
            }
          },
          hintText: "YYYY-MM-DD",
          validator: (value) {
            if (value == null) {
              return 'Please select a maturity date.';
            }
            return null;
          },
        );
      },
    );
  }

  NomineeEntity _getNominee(FormDataState state, int index) {
    if (index >= 0 && index < state.nominees.length) {
      return state.nominees[index];
    }
    return NomineeEntity.empty();
  }
}

class GuardianResidentialStatusSelector extends StatelessWidget {
  final int nomineeIndex;

  const GuardianResidentialStatusSelector({
    super.key,
    required this.nomineeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        final prevNominee = _getNominee(previous, nomineeIndex);
        final currNominee = _getNominee(current, nomineeIndex);
        return prevNominee.guardianResidentialStatus != currNominee.guardianResidentialStatus;
      },
      builder: (context, state) {
        final nominee = _getNominee(state, nomineeIndex);
        return CustomCheckSelector(
          label: "Residential Status",
          listOfValues: const ["Resident", "Non Resident", "Foreigner"],
          selectedValue: nominee.guardianResidentialStatus.isNotEmpty
              ? nominee.guardianResidentialStatus
              : null,
          isRequired: true,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateGuardianResidentialStatus(
              nomineeIndex,
              value!,
            );
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a residential status.';
            }
            return null;
          },
        );
      },
    );
  }

  NomineeEntity _getNominee(FormDataState state, int index) {
    if (index >= 0 && index < state.nominees.length) {
      return state.nominees[index];
    }
    return NomineeEntity.empty();
  }
}

class GuardianDateOfBirthPicker extends StatelessWidget {
  final int nomineeIndex;

  const GuardianDateOfBirthPicker({
    super.key,
    required this.nomineeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        final prevNominee = _getNominee(previous, nomineeIndex);
        final currNominee = _getNominee(current, nomineeIndex);
        return prevNominee.guardianDateOfBirth != currNominee.guardianDateOfBirth;
      },
      builder: (context, state) {
        final nominee = _getNominee(state, nomineeIndex);
        return CustomDatePicker(
          labelText: "Date of Birth (YYYY-MM-DD)",
          selectedDate: nominee.guardianDateOfBirth,
          formatter: DateFormat('yyyy-MM-dd'),
          isRequired: true,
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              context.read<FormDataCubit>().nomineeUpdateGuardianDateOfBirth(
                nomineeIndex,
                picked,
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
        );
      },
    );
  }

  NomineeEntity _getNominee(FormDataState state, int index) {
    if (index >= 0 && index < state.nominees.length) {
      return state.nominees[index];
    }
    return NomineeEntity.empty();
  }
}

class GuardianNidTextField extends StatefulWidget {
  final int nomineeIndex;

  const GuardianNidTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<GuardianNidTextField> createState() => _GuardianNidTextFieldState();
}

class _GuardianNidTextFieldState extends State<GuardianNidTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        final prevNominee = _getNominee(previous, widget.nomineeIndex);
        final currNominee = _getNominee(current, widget.nomineeIndex);
        return prevNominee.guardianNid != currNominee.guardianNid;
      },
      builder: (context, state) {
        final nominee = _getNominee(state, widget.nomineeIndex);
        if (_controller.text != nominee.guardianNid) {
          _controller.text = nominee.guardianNid;
        }
        return CustomTextField(
          hintText: "Enter National Identity Card Number",
          label: "National ID",
          controller: _controller,
          isRequired: true,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateGuardianNid(
              widget.nomineeIndex,
              value,
            );
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a NID.';
            }
            return null;
          },
        );
      },
    );
  }

  NomineeEntity _getNominee(FormDataState state, int index) {
    if (index >= 0 && index < state.nominees.length) {
      return state.nominees[index];
    }
    return NomineeEntity.empty();
  }
}

class GuardianAddressLine1TextField extends StatefulWidget {
  final int nomineeIndex;

  const GuardianAddressLine1TextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<GuardianAddressLine1TextField> createState() =>
      _GuardianAddressLine1TextFieldState();
}

class _GuardianAddressLine1TextFieldState
    extends State<GuardianAddressLine1TextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        final prevNominee = _getNominee(previous, widget.nomineeIndex);
        final currNominee = _getNominee(current, widget.nomineeIndex);
        return prevNominee.guardianAddressLine1 != currNominee.guardianAddressLine1;
      },
      builder: (context, state) {
        final nominee = _getNominee(state, widget.nomineeIndex);
        if (_controller.text != nominee.guardianAddressLine1) {
          _controller.text = nominee.guardianAddressLine1;
        }
        return CustomTextField(
          hintText: "Enter Address Line 1",
          label: "Address Line 1",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateGuardianAddressLine1(
              widget.nomineeIndex,
              value,
            );
          },
          isRequired: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an address.';
            }
            return null;
          },
        );
      },
    );
  }

  NomineeEntity _getNominee(FormDataState state, int index) {
    if (index >= 0 && index < state.nominees.length) {
      return state.nominees[index];
    }
    return NomineeEntity.empty();
  }
}

class GuardianAddressLine2TextField extends StatefulWidget {
  final int nomineeIndex;

  const GuardianAddressLine2TextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<GuardianAddressLine2TextField> createState() =>
      _GuardianAddressLine2TextFieldState();
}

class _GuardianAddressLine2TextFieldState
    extends State<GuardianAddressLine2TextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        final prevNominee = _getNominee(previous, widget.nomineeIndex);
        final currNominee = _getNominee(current, widget.nomineeIndex);
        return prevNominee.guardianAddressLine2 != currNominee.guardianAddressLine2;
      },
      builder: (context, state) {
        final nominee = _getNominee(state, widget.nomineeIndex);
        if (_controller.text != nominee.guardianAddressLine2) {
          _controller.text = nominee.guardianAddressLine2;
        }
        return CustomTextField(
          hintText: "Enter Address Line 2",
          label: "Address Line 2",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateGuardianAddressLine2(
              widget.nomineeIndex,
              value,
            );
          },
        );
      },
    );
  }

  NomineeEntity _getNominee(FormDataState state, int index) {
    if (index >= 0 && index < state.nominees.length) {
      return state.nominees[index];
    }
    return NomineeEntity.empty();
  }
}

class GuardianAddressLine3TextField extends StatefulWidget {
  final int nomineeIndex;

  const GuardianAddressLine3TextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<GuardianAddressLine3TextField> createState() =>
      _GuardianAddressLine3TextFieldState();
}

class _GuardianAddressLine3TextFieldState
    extends State<GuardianAddressLine3TextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        final prevNominee = _getNominee(previous, widget.nomineeIndex);
        final currNominee = _getNominee(current, widget.nomineeIndex);
        return prevNominee.guardianAddressLine3 != currNominee.guardianAddressLine3;
      },
      builder: (context, state) {
        final nominee = _getNominee(state, widget.nomineeIndex);
        if (_controller.text != nominee.guardianAddressLine3) {
          _controller.text = nominee.guardianAddressLine3;
        }
        return CustomTextField(
          hintText: "Enter Address Line 3",
          label: "Address Line 3",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateGuardianAddressLine3(
              widget.nomineeIndex,
              value,
            );
          },
        );
      },
    );
  }

  NomineeEntity _getNominee(FormDataState state, int index) {
    if (index >= 0 && index < state.nominees.length) {
      return state.nominees[index];
    }
    return NomineeEntity.empty();
  }
}

class GuardianCityTextField extends StatefulWidget {
  final int nomineeIndex;

  const GuardianCityTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<GuardianCityTextField> createState() => _GuardianCityTextFieldState();
}

class _GuardianCityTextFieldState extends State<GuardianCityTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        final prevNominee = _getNominee(previous, widget.nomineeIndex);
        final currNominee = _getNominee(current, widget.nomineeIndex);
        return prevNominee.guardianCity != currNominee.guardianCity;
      },
      builder: (context, state) {
        final nominee = _getNominee(state, widget.nomineeIndex);
        if (_controller.text != nominee.guardianCity) {
          _controller.text = nominee.guardianCity;
        }
        return CustomTextField(
          hintText: "Enter City",
          label: "City",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateGuardianCity(
              widget.nomineeIndex,
              value,
            );
          },
          isRequired: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a city.';
            }
            return null;
          },
        );
      },
    );
  }

  NomineeEntity _getNominee(FormDataState state, int index) {
    if (index >= 0 && index < state.nominees.length) {
      return state.nominees[index];
    }
    return NomineeEntity.empty();
  }
}

class GuardianPostCodeTextField extends StatefulWidget {
  final int nomineeIndex;

  const GuardianPostCodeTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<GuardianPostCodeTextField> createState() =>
      _GuardianPostCodeTextFieldState();
}

class _GuardianPostCodeTextFieldState extends State<GuardianPostCodeTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        final prevNominee = _getNominee(previous, widget.nomineeIndex);
        final currNominee = _getNominee(current, widget.nomineeIndex);
        return prevNominee.guardianPostCode != currNominee.guardianPostCode;
      },
      builder: (context, state) {
        final nominee = _getNominee(state, widget.nomineeIndex);
        if (_controller.text != nominee.guardianPostCode) {
          _controller.text = nominee.guardianPostCode;
        }
        return CustomTextField(
          hintText: "Enter Post Code",
          label: "Post Code",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateGuardianPostCode(
              widget.nomineeIndex,
              value,
            );
          },
          isRequired: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a post code.';
            }
            return null;
          },
        );
      },
    );
  }

  NomineeEntity _getNominee(FormDataState state, int index) {
    if (index >= 0 && index < state.nominees.length) {
      return state.nominees[index];
    }
    return NomineeEntity.empty();
  }
}

class GuardianDivisionTextField extends StatefulWidget {
  final int nomineeIndex;

  const GuardianDivisionTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<GuardianDivisionTextField> createState() =>
      _GuardianDivisionTextFieldState();
}

class _GuardianDivisionTextFieldState extends State<GuardianDivisionTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        final prevNominee = _getNominee(previous, widget.nomineeIndex);
        final currNominee = _getNominee(current, widget.nomineeIndex);
        return prevNominee.guardianDivision != currNominee.guardianDivision;
      },
      builder: (context, state) {
        final nominee = _getNominee(state, widget.nomineeIndex);
        if (_controller.text != nominee.guardianDivision) {
          _controller.text = nominee.guardianDivision;
        }
        return CustomTextField(
          hintText: "Enter Division",
          label: "Division",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateGuardianDivision(
              widget.nomineeIndex,
              value,
            );
          },
          isRequired: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a division.';
            }
            return null;
          },
        );
      },
    );
  }

  NomineeEntity _getNominee(FormDataState state, int index) {
    if (index >= 0 && index < state.nominees.length) {
      return state.nominees[index];
    }
    return NomineeEntity.empty();
  }
}

class GuardianCountryDropdown extends StatelessWidget {
  final int nomineeIndex;

  const GuardianCountryDropdown({
    super.key,
    required this.nomineeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        final prevNominee = _getNominee(previous, nomineeIndex);
        final currNominee = _getNominee(current, nomineeIndex);
        return prevNominee.guardianCountry != currNominee.guardianCountry;
      },
      builder: (context, state) {
        final nominee = _getNominee(state, nomineeIndex);
        return CustomDropdown(
          labelText: "Country",
          hintText: "Select an option",
          values: const ["USA", "Canada", "India", "UK", "Bangladesh"],
          selectedValue: nominee.guardianCountry.isNotEmpty
              ? nominee.guardianCountry
              : null,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateGuardianCountry(
              nomineeIndex,
              value!,
            );
          },
          isRequired: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a country.';
            }
            return null;
          },
        );
      },
    );
  }

  NomineeEntity _getNominee(FormDataState state, int index) {
    if (index >= 0 && index < state.nominees.length) {
      return state.nominees[index];
    }
    return NomineeEntity.empty();
  }
}

class GuardianEmailTextField extends StatefulWidget {
  final int nomineeIndex;

  const GuardianEmailTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<GuardianEmailTextField> createState() => _GuardianEmailTextFieldState();
}

class _GuardianEmailTextFieldState extends State<GuardianEmailTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        final prevNominee = _getNominee(previous, widget.nomineeIndex);
        final currNominee = _getNominee(current, widget.nomineeIndex);
        return prevNominee.guardianEmail != currNominee.guardianEmail;
      },
      builder: (context, state) {
        final nominee = _getNominee(state, widget.nomineeIndex);
        if (_controller.text != nominee.guardianEmail) {
          _controller.text = nominee.guardianEmail;
        }
        return CustomTextField(
          hintText: "Enter Email Address",
          label: "Email",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateGuardianEmail(
              widget.nomineeIndex,
              value,
            );
          },
        );
      },
    );
  }

  NomineeEntity _getNominee(FormDataState state, int index) {
    if (index >= 0 && index < state.nominees.length) {
      return state.nominees[index];
    }
    return NomineeEntity.empty();
  }
}

class GuardianMobileTextField extends StatefulWidget {
  final int nomineeIndex;

  const GuardianMobileTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<GuardianMobileTextField> createState() =>
      _GuardianMobileTextFieldState();
}

class _GuardianMobileTextFieldState extends State<GuardianMobileTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        final prevNominee = _getNominee(previous, widget.nomineeIndex);
        final currNominee = _getNominee(current, widget.nomineeIndex);
        return prevNominee.guardianMobileNumber != currNominee.guardianMobileNumber;
      },
      builder: (context, state) {
        final nominee = _getNominee(state, widget.nomineeIndex);
        if (_controller.text != nominee.guardianMobileNumber) {
          _controller.text = nominee.guardianMobileNumber;
        }
        return CustomTextField(
          hintText: "Enter Mobile",
          label: "Mobile",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateGuardianMobileNumber(
              widget.nomineeIndex,
              value,
            );
          },
          isRequired: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a mobile number.';
            }
            return null;
          },
        );
      },
    );
  }

  NomineeEntity _getNominee(FormDataState state, int index) {
    if (index >= 0 && index < state.nominees.length) {
      return state.nominees[index];
    }
    return NomineeEntity.empty();
  }
}

class GuardianTelephoneTextField extends StatefulWidget {
  final int nomineeIndex;

  const GuardianTelephoneTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<GuardianTelephoneTextField> createState() =>
      _GuardianTelephoneTextFieldState();
}

class _GuardianTelephoneTextFieldState extends State<GuardianTelephoneTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        final prevNominee = _getNominee(previous, widget.nomineeIndex);
        final currNominee = _getNominee(current, widget.nomineeIndex);
        return prevNominee.guardianTelephone != currNominee.guardianTelephone;
      },
      builder: (context, state) {
        final nominee = _getNominee(state, widget.nomineeIndex);
        if (_controller.text != nominee.guardianTelephone) {
          _controller.text = nominee.guardianTelephone;
        }
        return CustomTextField(
          hintText: "Enter Telephone Number",
          label: "Telephone",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateGuardianTelephone(
              widget.nomineeIndex,
              value,
            );
          },
        );
      },
    );
  }

  NomineeEntity _getNominee(FormDataState state, int index) {
    if (index >= 0 && index < state.nominees.length) {
      return state.nominees[index];
    }
    return NomineeEntity.empty();
  }
}

class GuardianFaxTextField extends StatefulWidget {
  final int nomineeIndex;

  const GuardianFaxTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<GuardianFaxTextField> createState() => _GuardianFaxTextFieldState();
}

class _GuardianFaxTextFieldState extends State<GuardianFaxTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        final prevNominee = _getNominee(previous, widget.nomineeIndex);
        final currNominee = _getNominee(current, widget.nomineeIndex);
        return prevNominee.guardianFax != currNominee.guardianFax;
      },
      builder: (context, state) {
        final nominee = _getNominee(state, widget.nomineeIndex);
        if (_controller.text != nominee.guardianFax) {
          _controller.text = nominee.guardianFax;
        }
        return CustomTextField(
          hintText: "Enter FAX Number",
          label: "FAX",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateGuardianFax(
              widget.nomineeIndex,
              value,
            );
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a FAX number.';
            }
            return null;
          },
        );
      },
    );
  }

  NomineeEntity _getNominee(FormDataState state, int index) {
    if (index >= 0 && index < state.nominees.length) {
      return state.nominees[index];
    }
    return NomineeEntity.empty();
  }
}