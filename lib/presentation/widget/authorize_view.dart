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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SectionBox(
        title: const Text(
          "Authorize",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        child: Form(
          key: widget.formKey,
          child: Column(children: [_buildFirstACHolder()]),
        ),
      ),
    );
  }

  Widget _buildFirstACHolder() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AuthorizeCourtesyTitleDropdown(),
          AuthorizeFirstNameTextField(),
          AuthorizeLastNameTextField(),
          AuthorizeOccupationTextField(),
          AuthorizeDateOfBirthPicker(),
          AuthorizeNidTextField(),
          AuthorizeFatherNameTextField(),
          AuthorizeMotherNameTextField(),
          AuthorizeAddressLine1TextField(),
          AuthorizeAddressLine2TextField(),
          AuthorizeAddressLine3TextField(),
          AuthorizeCityTextField(),
          AuthorizePostCodeTextField(),
          AuthorizeDivisionTextField(),
          AuthorizeCountryDropdown(),
          AuthorizeMobileNumberTextField(),
          AuthorizeEmailTextField(),
          AuthorizeTelephoneTextField(),
          AuthorizeFaxTextField(),
        ],
      ),
    );
  }
}

// Individual widget components for AuthorizeView

class AuthorizeCourtesyTitleDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
          previous.authorizeEntity.courtesyTitle !=
          current.authorizeEntity.courtesyTitle,
      builder: (context, state) {
        return CustomDropdown(
          labelText: "Courtesy Title",
          hintText: "Select an option",
          values: const ["Mr", "Mrs", "Ms", "Dr"],
          selectedValue: state.authorizeEntity.courtesyTitle.isNotEmpty
              ? state.authorizeEntity.courtesyTitle
              : null,
          isRequired: true,
          onChanged: (value) {
            context.read<FormDataCubit>().authorizeUpdateCourtesyTitle(value!);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a courtesy title.';
            }
            return null;
          },
        );
      },
    );
  }
}

class AuthorizeFirstNameTextField extends StatefulWidget {
  @override
  State<AuthorizeFirstNameTextField> createState() =>
      _AuthorizeFirstNameTextFieldState();
}

class _AuthorizeFirstNameTextFieldState
    extends State<AuthorizeFirstNameTextField> {
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
      buildWhen: (previous, current) =>
          previous.authorizeEntity.firstName !=
          current.authorizeEntity.firstName,
      builder: (context, state) {
        if (_controller.text != state.authorizeEntity.firstName) {
          _controller.text = state.authorizeEntity.firstName;
        }
        return CustomTextField(
          hintText: "Enter First Name",
          isRequired: true,
          label: "First Name",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().authorizeUpdateFirstName(value);
          },
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

class AuthorizeLastNameTextField extends StatefulWidget {
  @override
  State<AuthorizeLastNameTextField> createState() =>
      _AuthorizeLastNameTextFieldState();
}

class _AuthorizeLastNameTextFieldState
    extends State<AuthorizeLastNameTextField> {
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
      buildWhen: (previous, current) =>
          previous.authorizeEntity.lastName != current.authorizeEntity.lastName,
      builder: (context, state) {
        if (_controller.text != state.authorizeEntity.lastName) {
          _controller.text = state.authorizeEntity.lastName;
        }
        return CustomTextField(
          hintText: "Enter Last Name",
          isRequired: true,
          label: "Last Name",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().authorizeUpdateLastName(value);
          },
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

class AuthorizeOccupationTextField extends StatefulWidget {
  @override
  State<AuthorizeOccupationTextField> createState() =>
      _AuthorizeOccupationTextFieldState();
}

class _AuthorizeOccupationTextFieldState
    extends State<AuthorizeOccupationTextField> {
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
      buildWhen: (previous, current) =>
          previous.authorizeEntity.occupation !=
          current.authorizeEntity.occupation,
      builder: (context, state) {
        if (_controller.text != state.authorizeEntity.occupation) {
          _controller.text = state.authorizeEntity.occupation;
        }
        return CustomTextField(
          hintText: "Enter Occupation",
          isRequired: true,
          label: "Occupation",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().authorizeUpdateOccupation(value);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an occupation.';
            }
            return null;
          },
        );
      },
    );
  }
}

class AuthorizeDateOfBirthPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
          previous.authorizeEntity.dateOfBirth !=
          current.authorizeEntity.dateOfBirth,
      builder: (context, state) {
        return CustomDatePicker(
          isRequired: true,
          labelText: "Date of Birth (YYYY-MM-DD)",
          selectedDate: state.authorizeEntity.dateOfBirth,
          formatter: DateFormat('yyyy-MM-dd'),
          onTap: () async {
            DateTime? picked = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              context.read<FormDataCubit>().authorizeUpdateDateOfBirth(picked);
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
}

class AuthorizeNidTextField extends StatefulWidget {
  @override
  State<AuthorizeNidTextField> createState() => _AuthorizeNidTextFieldState();
}

class _AuthorizeNidTextFieldState extends State<AuthorizeNidTextField> {
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
      buildWhen: (previous, current) =>
          previous.authorizeEntity.nid != current.authorizeEntity.nid,
      builder: (context, state) {
        if (_controller.text != state.authorizeEntity.nid) {
          _controller.text = state.authorizeEntity.nid;
        }
        return CustomTextField(
          hintText: "Enter National Identity Card Number",
          isRequired: true,
          label: "National ID",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().authorizeUpdateNid(value);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a national ID.';
            }
            return null;
          },
        );
      },
    );
  }
}

class AuthorizeFatherNameTextField extends StatefulWidget {
  @override
  State<AuthorizeFatherNameTextField> createState() =>
      _AuthorizeFatherNameTextFieldState();
}

class _AuthorizeFatherNameTextFieldState
    extends State<AuthorizeFatherNameTextField> {
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
      buildWhen: (previous, current) =>
          previous.authorizeEntity.fatherName !=
          current.authorizeEntity.fatherName,
      builder: (context, state) {
        if (_controller.text != state.authorizeEntity.fatherName) {
          _controller.text = state.authorizeEntity.fatherName;
        }
        return CustomTextField(
          hintText: "Enter Father Name",
          isRequired: true,
          label: "Father's Name",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().authorizeUpdateFatherName(value);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter a father's name.";
            }
            return null;
          },
        );
      },
    );
  }
}

class AuthorizeMotherNameTextField extends StatefulWidget {
  @override
  State<AuthorizeMotherNameTextField> createState() =>
      _AuthorizeMotherNameTextFieldState();
}

class _AuthorizeMotherNameTextFieldState
    extends State<AuthorizeMotherNameTextField> {
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
      buildWhen: (previous, current) =>
          previous.authorizeEntity.motherName !=
          current.authorizeEntity.motherName,
      builder: (context, state) {
        if (_controller.text != state.authorizeEntity.motherName) {
          _controller.text = state.authorizeEntity.motherName;
        }
        return CustomTextField(
          hintText: "Enter Mother Name",
          isRequired: true,
          label: "Mother's Name",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().authorizeUpdateMotherName(value);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter a mother's name.";
            }
            return null;
          },
        );
      },
    );
  }
}

class AuthorizeAddressLine1TextField extends StatefulWidget {
  @override
  State<AuthorizeAddressLine1TextField> createState() =>
      _AuthorizeAddressLine1TextFieldState();
}

class _AuthorizeAddressLine1TextFieldState
    extends State<AuthorizeAddressLine1TextField> {
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
      buildWhen: (previous, current) =>
          previous.authorizeEntity.addressLine1 !=
          current.authorizeEntity.addressLine1,
      builder: (context, state) {
        if (_controller.text != state.authorizeEntity.addressLine1) {
          _controller.text = state.authorizeEntity.addressLine1;
        }
        return CustomTextField(
          hintText: "Enter Address Line 1",
          isRequired: true,
          label: "Address Line 1",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().authorizeUpdateAddressLine1(value);
          },
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

class AuthorizeAddressLine2TextField extends StatefulWidget {
  @override
  State<AuthorizeAddressLine2TextField> createState() =>
      _AuthorizeAddressLine2TextFieldState();
}

class _AuthorizeAddressLine2TextFieldState
    extends State<AuthorizeAddressLine2TextField> {
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
      buildWhen: (previous, current) =>
          previous.authorizeEntity.addressLine2 !=
          current.authorizeEntity.addressLine2,
      builder: (context, state) {
        if (_controller.text != state.authorizeEntity.addressLine2) {
          _controller.text = state.authorizeEntity.addressLine2;
        }
        return CustomTextField(
          hintText: "Enter Address Line 2",
          isRequired: false,
          label: "Address Line 2",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().authorizeUpdateAddressLine2(value);
          },
        );
      },
    );
  }
}

class AuthorizeAddressLine3TextField extends StatefulWidget {
  @override
  State<AuthorizeAddressLine3TextField> createState() =>
      _AuthorizeAddressLine3TextFieldState();
}

class _AuthorizeAddressLine3TextFieldState
    extends State<AuthorizeAddressLine3TextField> {
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
      buildWhen: (previous, current) =>
          previous.authorizeEntity.addressLine3 !=
          current.authorizeEntity.addressLine3,
      builder: (context, state) {
        if (_controller.text != state.authorizeEntity.addressLine3) {
          _controller.text = state.authorizeEntity.addressLine3;
        }
        return CustomTextField(
          hintText: "Enter Address Line 3",
          isRequired: false,
          label: "Address Line 3",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().authorizeUpdateAddressLine3(value);
          },
        );
      },
    );
  }
}

class AuthorizeCityTextField extends StatefulWidget {
  @override
  State<AuthorizeCityTextField> createState() => _AuthorizeCityTextFieldState();
}

class _AuthorizeCityTextFieldState extends State<AuthorizeCityTextField> {
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
      buildWhen: (previous, current) =>
          previous.authorizeEntity.city != current.authorizeEntity.city,
      builder: (context, state) {
        if (_controller.text != state.authorizeEntity.city) {
          _controller.text = state.authorizeEntity.city;
        }
        return CustomTextField(
          hintText: "Enter City",
          isRequired: true,
          label: "City",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().authorizeUpdateCity(value);
          },
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

class AuthorizePostCodeTextField extends StatefulWidget {
  @override
  State<AuthorizePostCodeTextField> createState() =>
      _AuthorizePostCodeTextFieldState();
}

class _AuthorizePostCodeTextFieldState
    extends State<AuthorizePostCodeTextField> {
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
      buildWhen: (previous, current) =>
          previous.authorizeEntity.postCode != current.authorizeEntity.postCode,
      builder: (context, state) {
        if (_controller.text != state.authorizeEntity.postCode) {
          _controller.text = state.authorizeEntity.postCode;
        }
        return CustomTextField(
          hintText: "Enter Post Code",
          isRequired: true,
          label: "Post Code",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().authorizeUpdatePostCode(value);
          },
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

class AuthorizeDivisionTextField extends StatefulWidget {
  @override
  State<AuthorizeDivisionTextField> createState() =>
      _AuthorizeDivisionTextFieldState();
}

class _AuthorizeDivisionTextFieldState
    extends State<AuthorizeDivisionTextField> {
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
      buildWhen: (previous, current) =>
          previous.authorizeEntity.division != current.authorizeEntity.division,
      builder: (context, state) {
        if (_controller.text != state.authorizeEntity.division) {
          _controller.text = state.authorizeEntity.division;
        }
        return CustomTextField(
          hintText: "Enter Division",
          isRequired: true,
          label: "Division",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().authorizeUpdateDivision(value);
          },
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

class AuthorizeCountryDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
          previous.authorizeEntity.country != current.authorizeEntity.country,
      builder: (context, state) {
        return CustomDropdown(
          labelText: "Country",
          hintText: "Select an option",
          selectedValue: state.authorizeEntity.country.isNotEmpty
              ? state.authorizeEntity.country
              : null,
          isRequired: true,
          values: const ["USA", "Canada", "India", "UK", "Bangladesh"],
          onChanged: (value) {
            context.read<FormDataCubit>().authorizeUpdateCountry(value!);
          },
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

class AuthorizeMobileNumberTextField extends StatefulWidget {
  @override
  State<AuthorizeMobileNumberTextField> createState() =>
      _AuthorizeMobileNumberTextFieldState();
}

class _AuthorizeMobileNumberTextFieldState
    extends State<AuthorizeMobileNumberTextField> {
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
      buildWhen: (previous, current) =>
          previous.authorizeEntity.mobileNumber !=
          current.authorizeEntity.mobileNumber,
      builder: (context, state) {
        if (_controller.text != state.authorizeEntity.mobileNumber) {
          _controller.text = state.authorizeEntity.mobileNumber;
        }
        return CustomTextField(
          hintText: "Enter Mobile",
          isRequired: true,
          label: "Mobile",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().authorizeUpdateMobileNumber(value);
          },
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

class AuthorizeEmailTextField extends StatefulWidget {
  @override
  State<AuthorizeEmailTextField> createState() =>
      _AuthorizeEmailTextFieldState();
}

class _AuthorizeEmailTextFieldState extends State<AuthorizeEmailTextField> {
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
      buildWhen: (previous, current) =>
          previous.authorizeEntity.email != current.authorizeEntity.email,
      builder: (context, state) {
        if (_controller.text != state.authorizeEntity.email) {
          _controller.text = state.authorizeEntity.email;
        }
        return CustomTextField(
          hintText: "Enter Email Address",
          isRequired: true,
          label: "Email",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().authorizeUpdateEmail(value);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an email address.';
            }
            return null;
          },
        );
      },
    );
  }
}

class AuthorizeTelephoneTextField extends StatefulWidget {
  @override
  State<AuthorizeTelephoneTextField> createState() =>
      _AuthorizeTelephoneTextFieldState();
}

class _AuthorizeTelephoneTextFieldState
    extends State<AuthorizeTelephoneTextField> {
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
      buildWhen: (previous, current) =>
          previous.authorizeEntity.telephone !=
          current.authorizeEntity.telephone,
      builder: (context, state) {
        if (_controller.text != state.authorizeEntity.telephone) {
          _controller.text = state.authorizeEntity.telephone;
        }
        return CustomTextField(
          hintText: "Enter Telephone Number",
          isRequired: false,
          label: "Telephone",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().authorizeUpdateTelephone(value);
          },
        );
      },
    );
  }
}

class AuthorizeFaxTextField extends StatefulWidget {
  @override
  State<AuthorizeFaxTextField> createState() => _AuthorizeFaxTextFieldState();
}

class _AuthorizeFaxTextFieldState extends State<AuthorizeFaxTextField> {
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
      buildWhen: (previous, current) =>
          previous.authorizeEntity.fax != current.authorizeEntity.fax,
      builder: (context, state) {
        if (_controller.text != state.authorizeEntity.fax) {
          _controller.text = state.authorizeEntity.fax;
        }
        return CustomTextField(
          hintText: "Enter FAX Number",
          isRequired: false,
          label: "FAX",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().authorizeUpdateFax(value);
          },
        );
      },
    );
  }
}
