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

class NomineeForm extends StatelessWidget {
  final int index;
  final String mode;

  const NomineeForm({super.key, required this.index, required this.mode});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        // Rebuild if the number of nominees changes or the specific nominee changes
        if (index >= previous.nominees.length || index >= current.nominees.length) {
          return true;
        }
        return previous.nominees[index] != current.nominees[index];
      },
      builder: (context, state) {
        if (index >= state.nominees.length) {
          return const SizedBox.shrink();
        }

        final nominee = state.nominees[index];

        return SectionBox(
          title: Text(
            mode == 'guardian' ? "Guardian Details" : "Nominee ${index + 1}",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (mode != 'guardian') ...[
                  NomineeCourtesyTitleDropdown(nomineeIndex: index),
                  NomineeFirstNameTextField(nomineeIndex: index),
                  NomineeLastNameTextField(nomineeIndex: index),
                  NomineeRelationshipTextField(nomineeIndex: index),
                  NomineePercentageTextField(nomineeIndex: index),
                ],
                NomineeResidentialStatusSelector(nomineeIndex: index),
                NomineeDateOfBirthPicker(nomineeIndex: index),
                NomineeNidTextField(nomineeIndex: index),
                NomineeAddressLine1TextField(nomineeIndex: index),
                NomineeAddressLine2TextField(nomineeIndex: index),
                NomineeAddressLine3TextField(nomineeIndex: index),
                NomineeCityTextField(nomineeIndex: index),
                NomineePostCodeTextField(nomineeIndex: index),
                NomineeDivisionTextField(nomineeIndex: index),
                NomineeCountryDropdown(nomineeIndex: index),
                NomineeEmailTextField(nomineeIndex: index),
                NomineeMobileTextField(nomineeIndex: index),
                NomineeTelephoneTextField(nomineeIndex: index),
                NomineeFaxTextField(nomineeIndex: index),
                if (mode != 'guardian')
                  NomineeIsMinorToggle(nomineeIndex: index),
                if (nominee.isNomineeMinor && mode != 'guardian')
                  GuardianForm(nomineeIndex: index),
                if (mode == 'primary')
                  SecondNomineeToggle(),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Individual widget components for NomineeForm

class NomineeCourtesyTitleDropdown extends StatelessWidget {
  final int nomineeIndex;

  const NomineeCourtesyTitleDropdown({
    super.key,
    required this.nomineeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        if (nomineeIndex >= previous.nominees.length ||
            nomineeIndex >= current.nominees.length) {
          return false;
        }
        return previous.nominees[nomineeIndex].courtesyTitle !=
            current.nominees[nomineeIndex].courtesyTitle;
      },
      builder: (context, state) {
        if (nomineeIndex >= state.nominees.length) {
          return const SizedBox.shrink();
        }
        final nominee = state.nominees[nomineeIndex];
        return CustomDropdown(
          labelText: "Courtesy Title",
          hintText: "Select an option",
          values: const ["Mr", "Mrs", "Ms", "Dr"],
          selectedValue: nominee.courtesyTitle.isEmpty
              ? null
              : nominee.courtesyTitle,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateCourtesyTitle(
              nomineeIndex,
              value!,
            );
          },
        );
      },
    );
  }
}

class NomineeFirstNameTextField extends StatefulWidget {
  final int nomineeIndex;

  const NomineeFirstNameTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<NomineeFirstNameTextField> createState() =>
      _NomineeFirstNameTextFieldState();
}

class _NomineeFirstNameTextFieldState extends State<NomineeFirstNameTextField> {
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
        if (widget.nomineeIndex >= previous.nominees.length ||
            widget.nomineeIndex >= current.nominees.length) {
          return false;
        }
        return previous.nominees[widget.nomineeIndex].firstName !=
            current.nominees[widget.nomineeIndex].firstName;
      },
      builder: (context, state) {
        if (widget.nomineeIndex >= state.nominees.length) {
          return const SizedBox.shrink();
        }
        final nominee = state.nominees[widget.nomineeIndex];
        if (_controller.text != nominee.firstName) {
          _controller.text = nominee.firstName;
        }
        return CustomTextField(
          hintText: "Enter First Name",
          label: "First Name",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateFirstName(
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
}

class NomineeLastNameTextField extends StatefulWidget {
  final int nomineeIndex;

  const NomineeLastNameTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<NomineeLastNameTextField> createState() =>
      _NomineeLastNameTextFieldState();
}

class _NomineeLastNameTextFieldState extends State<NomineeLastNameTextField> {
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
        if (widget.nomineeIndex >= previous.nominees.length ||
            widget.nomineeIndex >= current.nominees.length) {
          return false;
        }
        return previous.nominees[widget.nomineeIndex].lastName !=
            current.nominees[widget.nomineeIndex].lastName;
      },
      builder: (context, state) {
        if (widget.nomineeIndex >= state.nominees.length) {
          return const SizedBox.shrink();
        }
        final nominee = state.nominees[widget.nomineeIndex];
        if (_controller.text != nominee.lastName) {
          _controller.text = nominee.lastName;
        }
        return CustomTextField(
          hintText: "Enter Last Name",
          label: "Last Name",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateLastName(
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
}

class NomineeRelationshipTextField extends StatefulWidget {
  final int nomineeIndex;

  const NomineeRelationshipTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<NomineeRelationshipTextField> createState() =>
      _NomineeRelationshipTextFieldState();
}

class _NomineeRelationshipTextFieldState
    extends State<NomineeRelationshipTextField> {
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
        if (widget.nomineeIndex >= previous.nominees.length ||
            widget.nomineeIndex >= current.nominees.length) {
          return false;
        }
        return previous.nominees[widget.nomineeIndex].relationship !=
            current.nominees[widget.nomineeIndex].relationship;
      },
      builder: (context, state) {
        if (widget.nomineeIndex >= state.nominees.length) {
          return const SizedBox.shrink();
        }
        final nominee = state.nominees[widget.nomineeIndex];
        if (_controller.text != nominee.relationship) {
          _controller.text = nominee.relationship;
        }
        return CustomTextField(
          hintText: "Relationship with A/C Holder",
          label: "Relationship",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateRelationship(
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
}

class NomineePercentageTextField extends StatefulWidget {
  final int nomineeIndex;

  const NomineePercentageTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<NomineePercentageTextField> createState() =>
      _NomineePercentageTextFieldState();
}

class _NomineePercentageTextFieldState
    extends State<NomineePercentageTextField> {
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
        if (widget.nomineeIndex >= previous.nominees.length ||
            widget.nomineeIndex >= current.nominees.length) {
          return false;
        }
        return previous.nominees[widget.nomineeIndex].percentage !=
            current.nominees[widget.nomineeIndex].percentage;
      },
      builder: (context, state) {
        if (widget.nomineeIndex >= state.nominees.length) {
          return const SizedBox.shrink();
        }
        final nominee = state.nominees[widget.nomineeIndex];
        if (_controller.text != nominee.percentage) {
          _controller.text = nominee.percentage;
        }
        return CustomTextField(
          hintText: "Enter Percentage",
          label: "Percentage",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdatePercentage(
              widget.nomineeIndex,
              value,
            );
          },
          isRequired: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a percentage.';
            }
            return null;
          },
        );
      },
    );
  }
}

class NomineeResidentialStatusSelector extends StatelessWidget {
  final int nomineeIndex;

  const NomineeResidentialStatusSelector({
    super.key,
    required this.nomineeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        if (nomineeIndex >= previous.nominees.length ||
            nomineeIndex >= current.nominees.length) {
          return false;
        }
        return previous.nominees[nomineeIndex].residentialStatus !=
            current.nominees[nomineeIndex].residentialStatus;
      },
      builder: (context, state) {
        if (nomineeIndex >= state.nominees.length) {
          return const SizedBox.shrink();
        }
        final nominee = state.nominees[nomineeIndex];
        return CustomCheckSelector(
          label: "Residential Status",
          listOfValues: const ["Resident", "Non Resident", "Foreigner"],
          selectedValue: nominee.residentialStatus.isNotEmpty
              ? nominee.residentialStatus
              : null,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateResidentialStatus(
              nomineeIndex,
              value!,
            );
          },
          isRequired: true,
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
}

class NomineeDateOfBirthPicker extends StatelessWidget {
  final int nomineeIndex;

  const NomineeDateOfBirthPicker({
    super.key,
    required this.nomineeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        if (nomineeIndex >= previous.nominees.length ||
            nomineeIndex >= current.nominees.length) {
          return false;
        }
        return previous.nominees[nomineeIndex].dateOfBirth !=
            current.nominees[nomineeIndex].dateOfBirth;
      },
      builder: (context, state) {
        if (nomineeIndex >= state.nominees.length) {
          return const SizedBox.shrink();
        }
        final nominee = state.nominees[nomineeIndex];
        return CustomDatePicker(
          labelText: "Date of Birth (YYYY-MM-DD)",
          selectedDate: nominee.dateOfBirth,
          formatter: DateFormat('yyyy-MM-dd'),
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              context.read<FormDataCubit>().nomineeUpdateDateOfBirth(
                nomineeIndex,
                picked,
              );
            }
          },
          hintText: "YYYY-MM-DD",
          isRequired: true,
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
}

class NomineeNidTextField extends StatefulWidget {
  final int nomineeIndex;

  const NomineeNidTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<NomineeNidTextField> createState() => _NomineeNidTextFieldState();
}

class _NomineeNidTextFieldState extends State<NomineeNidTextField> {
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
        if (widget.nomineeIndex >= previous.nominees.length ||
            widget.nomineeIndex >= current.nominees.length) {
          return false;
        }
        return previous.nominees[widget.nomineeIndex].nid !=
            current.nominees[widget.nomineeIndex].nid;
      },
      builder: (context, state) {
        if (widget.nomineeIndex >= state.nominees.length) {
          return const SizedBox.shrink();
        }
        final nominee = state.nominees[widget.nomineeIndex];
        if (_controller.text != nominee.nid) {
          _controller.text = nominee.nid;
        }
        return CustomTextField(
          hintText: "Enter National Identity Card Number",
          label: "National ID",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateNid(
              widget.nomineeIndex,
              value,
            );
          },
          isRequired: true,
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
}

class NomineeAddressLine1TextField extends StatefulWidget {
  final int nomineeIndex;

  const NomineeAddressLine1TextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<NomineeAddressLine1TextField> createState() =>
      _NomineeAddressLine1TextFieldState();
}

class _NomineeAddressLine1TextFieldState
    extends State<NomineeAddressLine1TextField> {
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
        if (widget.nomineeIndex >= previous.nominees.length ||
            widget.nomineeIndex >= current.nominees.length) {
          return false;
        }
        return previous.nominees[widget.nomineeIndex].addressLine1 !=
            current.nominees[widget.nomineeIndex].addressLine1;
      },
      builder: (context, state) {
        if (widget.nomineeIndex >= state.nominees.length) {
          return const SizedBox.shrink();
        }
        final nominee = state.nominees[widget.nomineeIndex];
        if (_controller.text != nominee.addressLine1) {
          _controller.text = nominee.addressLine1;
        }
        return CustomTextField(
          hintText: "Enter Address Line 1",
          label: "Address Line 1",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateAddressLine1(
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
}

class NomineeAddressLine2TextField extends StatefulWidget {
  final int nomineeIndex;

  const NomineeAddressLine2TextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<NomineeAddressLine2TextField> createState() =>
      _NomineeAddressLine2TextFieldState();
}

class _NomineeAddressLine2TextFieldState
    extends State<NomineeAddressLine2TextField> {
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
        if (widget.nomineeIndex >= previous.nominees.length ||
            widget.nomineeIndex >= current.nominees.length) {
          return false;
        }
        return previous.nominees[widget.nomineeIndex].addressLine2 !=
            current.nominees[widget.nomineeIndex].addressLine2;
      },
      builder: (context, state) {
        if (widget.nomineeIndex >= state.nominees.length) {
          return const SizedBox.shrink();
        }
        final nominee = state.nominees[widget.nomineeIndex];
        if (_controller.text != nominee.addressLine2) {
          _controller.text = nominee.addressLine2;
        }
        return CustomTextField(
          hintText: "Enter Address Line 2",
          label: "Address Line 2",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateAddressLine2(
              widget.nomineeIndex,
              value,
            );
          },
        );
      },
    );
  }
}

class NomineeAddressLine3TextField extends StatefulWidget {
  final int nomineeIndex;

  const NomineeAddressLine3TextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<NomineeAddressLine3TextField> createState() =>
      _NomineeAddressLine3TextFieldState();
}

class _NomineeAddressLine3TextFieldState
    extends State<NomineeAddressLine3TextField> {
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
        if (widget.nomineeIndex >= previous.nominees.length ||
            widget.nomineeIndex >= current.nominees.length) {
          return false;
        }
        return previous.nominees[widget.nomineeIndex].addressLine3 !=
            current.nominees[widget.nomineeIndex].addressLine3;
      },
      builder: (context, state) {
        if (widget.nomineeIndex >= state.nominees.length) {
          return const SizedBox.shrink();
        }
        final nominee = state.nominees[widget.nomineeIndex];
        if (_controller.text != nominee.addressLine3) {
          _controller.text = nominee.addressLine3;
        }
        return CustomTextField(
          hintText: "Enter Address Line 3",
          label: "Address Line 3",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateAddressLine3(
              widget.nomineeIndex,
              value,
            );
          },
        );
      },
    );
  }
}

class NomineeCityTextField extends StatefulWidget {
  final int nomineeIndex;

  const NomineeCityTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<NomineeCityTextField> createState() => _NomineeCityTextFieldState();
}

class _NomineeCityTextFieldState extends State<NomineeCityTextField> {
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
        if (widget.nomineeIndex >= previous.nominees.length ||
            widget.nomineeIndex >= current.nominees.length) {
          return false;
        }
        return previous.nominees[widget.nomineeIndex].city !=
            current.nominees[widget.nomineeIndex].city;
      },
      builder: (context, state) {
        if (widget.nomineeIndex >= state.nominees.length) {
          return const SizedBox.shrink();
        }
        final nominee = state.nominees[widget.nomineeIndex];
        if (_controller.text != nominee.city) {
          _controller.text = nominee.city;
        }
        return CustomTextField(
          hintText: "Enter City",
          label: "City",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateCity(
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
}

class NomineePostCodeTextField extends StatefulWidget {
  final int nomineeIndex;

  const NomineePostCodeTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<NomineePostCodeTextField> createState() =>
      _NomineePostCodeTextFieldState();
}

class _NomineePostCodeTextFieldState extends State<NomineePostCodeTextField> {
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
        if (widget.nomineeIndex >= previous.nominees.length ||
            widget.nomineeIndex >= current.nominees.length) {
          return false;
        }
        return previous.nominees[widget.nomineeIndex].postCode !=
            current.nominees[widget.nomineeIndex].postCode;
      },
      builder: (context, state) {
        if (widget.nomineeIndex >= state.nominees.length) {
          return const SizedBox.shrink();
        }
        final nominee = state.nominees[widget.nomineeIndex];
        if (_controller.text != nominee.postCode) {
          _controller.text = nominee.postCode;
        }
        return CustomTextField(
          hintText: "Enter Post Code",
          label: "Post Code",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdatePostCode(
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
}

class NomineeDivisionTextField extends StatefulWidget {
  final int nomineeIndex;

  const NomineeDivisionTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<NomineeDivisionTextField> createState() =>
      _NomineeDivisionTextFieldState();
}

class _NomineeDivisionTextFieldState extends State<NomineeDivisionTextField> {
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
        if (widget.nomineeIndex >= previous.nominees.length ||
            widget.nomineeIndex >= current.nominees.length) {
          return false;
        }
        return previous.nominees[widget.nomineeIndex].division !=
            current.nominees[widget.nomineeIndex].division;
      },
      builder: (context, state) {
        if (widget.nomineeIndex >= state.nominees.length) {
          return const SizedBox.shrink();
        }
        final nominee = state.nominees[widget.nomineeIndex];
        if (_controller.text != nominee.division) {
          _controller.text = nominee.division;
        }
        return CustomTextField(
          hintText: "Enter Division",
          label: "Division",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateDivision(
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
}

class NomineeCountryDropdown extends StatelessWidget {
  final int nomineeIndex;

  const NomineeCountryDropdown({
    super.key,
    required this.nomineeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        if (nomineeIndex >= previous.nominees.length ||
            nomineeIndex >= current.nominees.length) {
          return false;
        }
        return previous.nominees[nomineeIndex].country !=
            current.nominees[nomineeIndex].country;
      },
      builder: (context, state) {
        if (nomineeIndex >= state.nominees.length) {
          return const SizedBox.shrink();
        }
        final nominee = state.nominees[nomineeIndex];
        return CustomDropdown(
          labelText: "Country",
          hintText: "Select an option",
          values: const ["USA", "Canada", "India", "UK", "Bangladesh"],
          selectedValue: nominee.country.isNotEmpty ? nominee.country : null,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateCountry(
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
}

class NomineeEmailTextField extends StatefulWidget {
  final int nomineeIndex;

  const NomineeEmailTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<NomineeEmailTextField> createState() => _NomineeEmailTextFieldState();
}

class _NomineeEmailTextFieldState extends State<NomineeEmailTextField> {
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
        if (widget.nomineeIndex >= previous.nominees.length ||
            widget.nomineeIndex >= current.nominees.length) {
          return false;
        }
        return previous.nominees[widget.nomineeIndex].email !=
            current.nominees[widget.nomineeIndex].email;
      },
      builder: (context, state) {
        if (widget.nomineeIndex >= state.nominees.length) {
          return const SizedBox.shrink();
        }
        final nominee = state.nominees[widget.nomineeIndex];
        if (_controller.text != nominee.email) {
          _controller.text = nominee.email;
        }
        return CustomTextField(
          hintText: "Enter Email Address",
          label: "Email",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateEmail(
              widget.nomineeIndex,
              value,
            );
          },
        );
      },
    );
  }
}

class NomineeMobileTextField extends StatefulWidget {
  final int nomineeIndex;

  const NomineeMobileTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<NomineeMobileTextField> createState() => _NomineeMobileTextFieldState();
}

class _NomineeMobileTextFieldState extends State<NomineeMobileTextField> {
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
        if (widget.nomineeIndex >= previous.nominees.length ||
            widget.nomineeIndex >= current.nominees.length) {
          return false;
        }
        return previous.nominees[widget.nomineeIndex].mobileNumber !=
            current.nominees[widget.nomineeIndex].mobileNumber;
      },
      builder: (context, state) {
        if (widget.nomineeIndex >= state.nominees.length) {
          return const SizedBox.shrink();
        }
        final nominee = state.nominees[widget.nomineeIndex];
        if (_controller.text != nominee.mobileNumber) {
          _controller.text = nominee.mobileNumber;
        }
        return CustomTextField(
          hintText: "Enter Mobile",
          label: "Mobile",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateMobileNumber(
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
}

class NomineeTelephoneTextField extends StatefulWidget {
  final int nomineeIndex;

  const NomineeTelephoneTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<NomineeTelephoneTextField> createState() =>
      _NomineeTelephoneTextFieldState();
}

class _NomineeTelephoneTextFieldState extends State<NomineeTelephoneTextField> {
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
        if (widget.nomineeIndex >= previous.nominees.length ||
            widget.nomineeIndex >= current.nominees.length) {
          return false;
        }
        return previous.nominees[widget.nomineeIndex].telephone !=
            current.nominees[widget.nomineeIndex].telephone;
      },
      builder: (context, state) {
        if (widget.nomineeIndex >= state.nominees.length) {
          return const SizedBox.shrink();
        }
        final nominee = state.nominees[widget.nomineeIndex];
        if (_controller.text != nominee.telephone) {
          _controller.text = nominee.telephone;
        }
        return CustomTextField(
          hintText: "Enter Telephone Number",
          label: "Telephone",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateTelephone(
              widget.nomineeIndex,
              value,
            );
          },
        );
      },
    );
  }
}

class NomineeFaxTextField extends StatefulWidget {
  final int nomineeIndex;

  const NomineeFaxTextField({
    super.key,
    required this.nomineeIndex,
  });

  @override
  State<NomineeFaxTextField> createState() => _NomineeFaxTextFieldState();
}

class _NomineeFaxTextFieldState extends State<NomineeFaxTextField> {
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
        if (widget.nomineeIndex >= previous.nominees.length ||
            widget.nomineeIndex >= current.nominees.length) {
          return false;
        }
        return previous.nominees[widget.nomineeIndex].fax !=
            current.nominees[widget.nomineeIndex].fax;
      },
      builder: (context, state) {
        if (widget.nomineeIndex >= state.nominees.length) {
          return const SizedBox.shrink();
        }
        final nominee = state.nominees[widget.nomineeIndex];
        if (_controller.text != nominee.fax) {
          _controller.text = nominee.fax;
        }
        return CustomTextField(
          hintText: "Enter FAX Number",
          label: "FAX",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateFax(
              widget.nomineeIndex,
              value,
            );
          },
        );
      },
    );
  }
}

class NomineeIsMinorToggle extends StatelessWidget {
  final int nomineeIndex;

  const NomineeIsMinorToggle({
    super.key,
    required this.nomineeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) {
        if (nomineeIndex >= previous.nominees.length ||
            nomineeIndex >= current.nominees.length) {
          return false;
        }
        return previous.nominees[nomineeIndex].isNomineeMinor !=
            current.nominees[nomineeIndex].isNomineeMinor;
      },
      builder: (context, state) {
        if (nomineeIndex >= state.nominees.length) {
          return const SizedBox.shrink();
        }
        final nominee = state.nominees[nomineeIndex];
        return CustomSliderToggle(
          label: "Is Nominee ${nomineeIndex + 1} a Minor?",
          selectedValue: nominee.isNomineeMinor,
          onChanged: (value) {
            context.read<FormDataCubit>().nomineeUpdateIsNomineeMinor(
              nomineeIndex,
              value!,
            );
          },
        );
      },
    );
  }
}

class SecondNomineeToggle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
      previous.isSecondNomineeAvailable != current.isSecondNomineeAvailable,
      builder: (context, state) {
        return CustomSliderToggle(
          label: "Do you want to add a 2nd Nominee",
          selectedValue: state.isSecondNomineeAvailable,
          onChanged: (value) {
            context.read<FormDataCubit>().toggleSecondNominee();
          },
        );
      },
    );
  }
}