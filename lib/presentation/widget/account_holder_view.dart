import 'package:bo_acc_form/common/widget/custom_date_picker.dart';
import 'package:bo_acc_form/common/widget/custom_check_selector.dart';
import 'package:bo_acc_form/common/widget/custom_dropdown.dart';
import 'package:bo_acc_form/common/widget/custom_slider_toggle.dart';
import 'package:bo_acc_form/common/widget/custom_text_field.dart';
import 'package:bo_acc_form/common/widget/section_box.dart';
import 'package:bo_acc_form/presentation/bloc/form_data/form_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AccountHolderView extends StatefulWidget {
  const AccountHolderView({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<AccountHolderView> createState() => _AccountHolderViewState();
}

class _AccountHolderViewState extends State<AccountHolderView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            SectionBox(
              title: const Text(
                "Account Holder",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              child: Column(
                children: [
                  _buildAccountHolder(),
                  SectionBox(
                    title: const Text(
                      "First A/C Holder",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    child: _buildFirstACHolder(),
                  ),
                ],
              ),
            ),
          ],
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
          ClientTypeSelector(),
          CourtesyTitleDropdown(),
          FirstNameTextField(),
          LastNameTextField(),
          OccupationTextField(),
          DateOfBirthPicker(),
          FatherNameTextField(),
          MotherNameTextField(),
          AddressLine1TextField(),
          AddressLine2TextField(),
          AddressLine3TextField(),
          CityTextField(),
          PostCodeTextField(),
          DistrictTextField(),
          CountryDropdown(),
          MobileNumberTextField(),
          EmailTextField(),
          TelephoneTextField(),
          FaxTextField(),
          NationalityTextField(),
          NidTextField(),
          TinTextField(),
          BrokerOfficeDropdown(),
          ResidentialStatusSelector(),
          GenderSelector(),
          OfficerDirectorToggle(),
        ],
      ),
    );
  }

  Widget _buildAccountHolder() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BoTypeSelector(),
          SizedBox(height: 8),
          const Text(
            "Referral(Lets us know where you heard of our BO account services)",
          ),
          ReferralDropdown(),
        ],
      ),
    );
  }
}

// Wrapper widgets for each form field with their own BlocBuilder

class ClientTypeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
          previous.accountHolderEntity.clientType !=
          current.accountHolderEntity.clientType,
      builder: (context, state) {
        return CustomCheckSelector(
          label: "Type of Client",
          listOfValues: const ["Individual", "Joint"],
          isRequired: true,
          selectedValue: state.accountHolderEntity.clientType.isNotEmpty
              ? state.accountHolderEntity.clientType
              : null,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateClientType(value!);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a client type.';
            }
            return null;
          },
        );
      },
    );
  }
}

class CourtesyTitleDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
          previous.accountHolderEntity.courtesyTitle !=
          current.accountHolderEntity.courtesyTitle,
      builder: (context, state) {
        return CustomDropdown(
          labelText: "Courtesy Title",
          hintText: "Select an option",
          values: const ["Mr", "Mrs", "Ms", "Dr"],
          selectedValue: state.accountHolderEntity.courtesyTitle.isNotEmpty
              ? state.accountHolderEntity.courtesyTitle
              : null,
          onChanged: (value) {
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
        );
      },
    );
  }
}

class FirstNameTextField extends StatefulWidget {
  @override
  State<FirstNameTextField> createState() => _FirstNameTextFieldState();
}

class _FirstNameTextFieldState extends State<FirstNameTextField> {
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
          previous.accountHolderEntity.firstName !=
          current.accountHolderEntity.firstName,
      builder: (context, state) {
        if (_controller.text != state.accountHolderEntity.firstName) {
          _controller.text = state.accountHolderEntity.firstName;
        }
        return CustomTextField(
          hintText: "Enter First Name",
          isRequired: true,
          label: "First Name",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateFirstName(value);
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

class LastNameTextField extends StatefulWidget {
  @override
  State<LastNameTextField> createState() => _LastNameTextFieldState();
}

class _LastNameTextFieldState extends State<LastNameTextField> {
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
          previous.accountHolderEntity.lastName !=
          current.accountHolderEntity.lastName,
      builder: (context, state) {
        if (_controller.text != state.accountHolderEntity.lastName) {
          _controller.text = state.accountHolderEntity.lastName;
        }
        return CustomTextField(
          hintText: "Enter Last Name",
          isRequired: true,
          label: "Last Name",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateLastName(value);
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

class OccupationTextField extends StatefulWidget {
  @override
  State<OccupationTextField> createState() => _OccupationTextFieldState();
}

class _OccupationTextFieldState extends State<OccupationTextField> {
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
          previous.accountHolderEntity.occupation !=
          current.accountHolderEntity.occupation,
      builder: (context, state) {
        if (_controller.text != state.accountHolderEntity.occupation) {
          _controller.text = state.accountHolderEntity.occupation;
        }
        return CustomTextField(
          hintText: "Enter Occupation",
          isRequired: true,
          label: "Occupation",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateOccupation(value);
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

class DateOfBirthPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
          previous.accountHolderEntity.dateOfBirth !=
          current.accountHolderEntity.dateOfBirth,
      builder: (context, state) {
        return CustomDatePicker(
          isRequired: true,
          labelText: "Date of Birth (YYYY-MM-DD)",
          selectedDate: state.accountHolderEntity.dateOfBirth,
          formatter: DateFormat('yyyy-MM-dd'),
          onTap: () async {
            DateTime? picked = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null) {
              context.read<FormDataCubit>().accountHolderUpdateDateOfBirth(
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
}

class FatherNameTextField extends StatefulWidget {
  @override
  State<FatherNameTextField> createState() => _FatherNameTextFieldState();
}

class _FatherNameTextFieldState extends State<FatherNameTextField> {
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
          previous.accountHolderEntity.fatherName !=
          current.accountHolderEntity.fatherName,
      builder: (context, state) {
        if (_controller.text != state.accountHolderEntity.fatherName) {
          _controller.text = state.accountHolderEntity.fatherName;
        }
        return CustomTextField(
          hintText: "Enter Father Name",
          isRequired: true,
          label: "Father's Name",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateFatherName(value);
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

class MotherNameTextField extends StatefulWidget {
  @override
  State<MotherNameTextField> createState() => _MotherNameTextFieldState();
}

class _MotherNameTextFieldState extends State<MotherNameTextField> {
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
          previous.accountHolderEntity.motherName !=
          current.accountHolderEntity.motherName,
      builder: (context, state) {
        if (_controller.text != state.accountHolderEntity.motherName) {
          _controller.text = state.accountHolderEntity.motherName;
        }
        return CustomTextField(
          hintText: "Enter Mother Name",
          isRequired: true,
          label: "Mother's Name",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateMotherName(value);
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

class AddressLine1TextField extends StatefulWidget {
  @override
  State<AddressLine1TextField> createState() => _AddressLine1TextFieldState();
}

class _AddressLine1TextFieldState extends State<AddressLine1TextField> {
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
          previous.accountHolderEntity.addressLine1 !=
          current.accountHolderEntity.addressLine1,
      builder: (context, state) {
        if (_controller.text != state.accountHolderEntity.addressLine1) {
          _controller.text = state.accountHolderEntity.addressLine1;
        }
        return CustomTextField(
          hintText: "Enter Address Line 1",
          isRequired: true,
          label: "Address Line 1",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateAddressLine1(
              value,
            );
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

class AddressLine2TextField extends StatefulWidget {
  @override
  State<AddressLine2TextField> createState() => _AddressLine2TextFieldState();
}

class _AddressLine2TextFieldState extends State<AddressLine2TextField> {
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
          previous.accountHolderEntity.addressLine2 !=
          current.accountHolderEntity.addressLine2,
      builder: (context, state) {
        if (_controller.text != state.accountHolderEntity.addressLine2) {
          _controller.text = state.accountHolderEntity.addressLine2;
        }
        return CustomTextField(
          hintText: "Enter Address Line 2",
          isRequired: false,
          label: "Address Line 2",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateAddressLine2(
              value,
            );
          },
        );
      },
    );
  }
}

class AddressLine3TextField extends StatefulWidget {
  @override
  State<AddressLine3TextField> createState() => _AddressLine3TextFieldState();
}

class _AddressLine3TextFieldState extends State<AddressLine3TextField> {
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
          previous.accountHolderEntity.addressLine3 !=
          current.accountHolderEntity.addressLine3,
      builder: (context, state) {
        if (_controller.text != state.accountHolderEntity.addressLine3) {
          _controller.text = state.accountHolderEntity.addressLine3;
        }
        return CustomTextField(
          hintText: "Enter Address Line 3",
          isRequired: false,
          label: "Address Line 3",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateAddressLine3(
              value,
            );
          },
        );
      },
    );
  }
}

class CityTextField extends StatefulWidget {
  @override
  State<CityTextField> createState() => _CityTextFieldState();
}

class _CityTextFieldState extends State<CityTextField> {
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
          previous.accountHolderEntity.city != current.accountHolderEntity.city,
      builder: (context, state) {
        if (_controller.text != state.accountHolderEntity.city) {
          _controller.text = state.accountHolderEntity.city;
        }
        return CustomTextField(
          hintText: "Enter City",
          isRequired: true,
          label: "City",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateCity(value);
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

class PostCodeTextField extends StatefulWidget {
  @override
  State<PostCodeTextField> createState() => _PostCodeTextFieldState();
}

class _PostCodeTextFieldState extends State<PostCodeTextField> {
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
          previous.accountHolderEntity.postCode !=
          current.accountHolderEntity.postCode,
      builder: (context, state) {
        if (_controller.text != state.accountHolderEntity.postCode) {
          _controller.text = state.accountHolderEntity.postCode;
        }
        return CustomTextField(
          hintText: "Enter Post Code",
          isRequired: true,
          label: "Post Code",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdatePostCode(value);
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

class DistrictTextField extends StatefulWidget {
  @override
  State<DistrictTextField> createState() => _DistrictTextFieldState();
}

class _DistrictTextFieldState extends State<DistrictTextField> {
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
          previous.accountHolderEntity.district !=
          current.accountHolderEntity.district,
      builder: (context, state) {
        if (_controller.text != state.accountHolderEntity.district) {
          _controller.text = state.accountHolderEntity.district;
        }
        return CustomTextField(
          hintText: "Enter District",
          isRequired: true,
          label: "District",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateDistrict(value);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a district.';
            }
            return null;
          },
        );
      },
    );
  }
}

class CountryDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
          previous.accountHolderEntity.country !=
          current.accountHolderEntity.country,
      builder: (context, state) {
        return CustomDropdown(
          labelText: "Country",
          hintText: "Select an option",
          selectedValue: state.accountHolderEntity.country.isNotEmpty
              ? state.accountHolderEntity.country
              : null,
          isRequired: true,
          values: const ["USA", "Canada", "India", "UK", "Bangladesh"],
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateCountry(value!);
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

class MobileNumberTextField extends StatefulWidget {
  @override
  State<MobileNumberTextField> createState() => _MobileNumberTextFieldState();
}

class _MobileNumberTextFieldState extends State<MobileNumberTextField> {
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
          previous.accountHolderEntity.mobileNumber !=
          current.accountHolderEntity.mobileNumber,
      builder: (context, state) {
        if (_controller.text != state.accountHolderEntity.mobileNumber) {
          _controller.text = state.accountHolderEntity.mobileNumber;
        }
        return CustomTextField(
          hintText: "Enter Mobile",
          isRequired: true,
          label: "Mobile",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateMobileNumber(
              value,
            );
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

class EmailTextField extends StatefulWidget {
  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
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
          previous.accountHolderEntity.email !=
          current.accountHolderEntity.email,
      builder: (context, state) {
        if (_controller.text != state.accountHolderEntity.email) {
          _controller.text = state.accountHolderEntity.email;
        }
        return CustomTextField(
          hintText: "Enter Email Address",
          isRequired: true,
          label: "Email",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateEmail(value);
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

class TelephoneTextField extends StatefulWidget {
  @override
  State<TelephoneTextField> createState() => _TelephoneTextFieldState();
}

class _TelephoneTextFieldState extends State<TelephoneTextField> {
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
          previous.accountHolderEntity.telephone !=
          current.accountHolderEntity.telephone,
      builder: (context, state) {
        if (_controller.text != state.accountHolderEntity.telephone) {
          _controller.text = state.accountHolderEntity.telephone;
        }
        return CustomTextField(
          hintText: "Enter Telephone Number",
          isRequired: false,
          label: "Telephone",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateTelephone(value);
          },
        );
      },
    );
  }
}

class FaxTextField extends StatefulWidget {
  @override
  State<FaxTextField> createState() => _FaxTextFieldState();
}

class _FaxTextFieldState extends State<FaxTextField> {
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
          previous.accountHolderEntity.fax != current.accountHolderEntity.fax,
      builder: (context, state) {
        if (_controller.text != state.accountHolderEntity.fax) {
          _controller.text = state.accountHolderEntity.fax;
        }
        return CustomTextField(
          hintText: "Enter FAX Number",
          isRequired: false,
          label: "FAX",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateFax(value);
          },
        );
      },
    );
  }
}

class NationalityTextField extends StatefulWidget {
  @override
  State<NationalityTextField> createState() => _NationalityTextFieldState();
}

class _NationalityTextFieldState extends State<NationalityTextField> {
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
          previous.accountHolderEntity.nationality !=
          current.accountHolderEntity.nationality,
      builder: (context, state) {
        if (_controller.text != state.accountHolderEntity.nationality) {
          _controller.text = state.accountHolderEntity.nationality;
        }
        return CustomTextField(
          hintText: "Enter Nationality",
          isRequired: true,
          label: "Nationality",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateNationality(value);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a nationality.';
            }
            return null;
          },
        );
      },
    );
  }
}

class NidTextField extends StatefulWidget {
  @override
  State<NidTextField> createState() => _NidTextFieldState();
}

class _NidTextFieldState extends State<NidTextField> {
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
          previous.accountHolderEntity.nid != current.accountHolderEntity.nid,
      builder: (context, state) {
        if (_controller.text != state.accountHolderEntity.nid) {
          _controller.text = state.accountHolderEntity.nid;
        }
        return CustomTextField(
          hintText: "Enter National Identity Card Number",
          isRequired: true,
          label: "National ID",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateNid(value);
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

class TinTextField extends StatefulWidget {
  @override
  State<TinTextField> createState() => _TinTextFieldState();
}

class _TinTextFieldState extends State<TinTextField> {
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
          previous.accountHolderEntity.tin != current.accountHolderEntity.tin,
      builder: (context, state) {
        if (_controller.text != state.accountHolderEntity.tin) {
          _controller.text = state.accountHolderEntity.tin;
        }
        return CustomTextField(
          hintText: "Enter Tax Identification Number (TIN)",
          isRequired: false,
          label: "Tax Identification Number (TIN)",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateTin(value);
          },
        );
      },
    );
  }
}

class BrokerOfficeDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
          previous.accountHolderEntity.brokerOffice !=
          current.accountHolderEntity.brokerOffice,
      builder: (context, state) {
        return CustomDropdown(
          labelText: "Broker Branch",
          hintText: "Select an option",
          selectedValue: state.accountHolderEntity.brokerOffice.isNotEmpty
              ? state.accountHolderEntity.brokerOffice
              : null,
          isRequired: true,
          values: const ["HEAD OFFICE", "SYLHET", "BOGURA", "BMSL", "TANGAIL"],
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateBrokerOffice(
              value!,
            );
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a broker branch.';
            }
            return null;
          },
        );
      },
    );
  }
}

class ResidentialStatusSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
          previous.accountHolderEntity.residentialStatus !=
          current.accountHolderEntity.residentialStatus,
      builder: (context, state) {
        return CustomCheckSelector(
          label: "Residential Status",
          listOfValues: const ["Resident", "Non Resident", "Foreigner"],
          isRequired: true,
          selectedValue: state.accountHolderEntity.residentialStatus.isNotEmpty
              ? state.accountHolderEntity.residentialStatus
              : null,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateResidentialStatus(
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
}

class GenderSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
          previous.accountHolderEntity.gender !=
          current.accountHolderEntity.gender,
      builder: (context, state) {
        return CustomCheckSelector(
          label: "Gender",
          listOfValues: const ["Male", "Female"],
          isRequired: true,
          selectedValue: state.accountHolderEntity.gender.isNotEmpty
              ? state.accountHolderEntity.gender
              : null,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateGender(value!);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a gender.';
            }
            return null;
          },
        );
      },
    );
  }
}

class OfficerDirectorToggle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
          previous
              .accountHolderEntity
              .isOfficerOrDirectorOrAuthorizedRepresentative !=
          current
              .accountHolderEntity
              .isOfficerOrDirectorOrAuthorizedRepresentative,
      builder: (context, state) {
        return CustomSliderToggle(
          label:
              "Whether the applicant is an officer or Director or Authorized Representative of any Stock Exchange/Listed Company/Brokerage Firm",
          selectedValue: state
              .accountHolderEntity
              .isOfficerOrDirectorOrAuthorizedRepresentative,
          onChanged: (value) {
            context
                .read<FormDataCubit>()
                .accountHolderUpdateIsOfficerOrDirectorOrAuthorizedRepresentative(
                  value!,
                );
          },
        );
      },
    );
  }
}

class BoTypeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
          previous.accountHolderEntity.boType !=
          current.accountHolderEntity.boType,
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCheckSelector(
              isRequired: true,
              label: "BO Type",
              listOfValues: const ["New BO", "Link BO"],
              selectedValue: state.accountHolderEntity.boType.isNotEmpty
                  ? state.accountHolderEntity.boType
                  : null,
              onChanged: (value) {
                context.read<FormDataCubit>().accountHolderUpdateBoType(value!);
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a BO type.';
                }
                return null;
              },
            ),
            if (state.accountHolderEntity.boType == "Link BO") BoIdTextField(),
          ],
        );
      },
    );
  }
}

class BoIdTextField extends StatefulWidget {
  @override
  State<BoIdTextField> createState() => _BoIdTextFieldState();
}

class _BoIdTextFieldState extends State<BoIdTextField> {
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
          previous.accountHolderEntity.boID != current.accountHolderEntity.boID,
      builder: (context, state) {
        if (_controller.text != state.accountHolderEntity.boID) {
          _controller.text = state.accountHolderEntity.boID;
        }
        return CustomTextField(
          hintText: "Enter BOID",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().accountHolderUpdateBoID(value);
          },
          validator: (value) {
            if (state.accountHolderEntity.boType == "Link BO" &&
                (value == null || value.isEmpty)) {
              return 'Please enter a BOID.';
            }
            return null;
          },
        );
      },
    );
  }
}

class ReferralDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
          previous.accountHolderEntity.referral !=
          current.accountHolderEntity.referral,
      builder: (context, state) {
        return CustomDropdown(
          hintText: "Select an option",
          selectedValue: state.accountHolderEntity.referral.isNotEmpty
              ? state.accountHolderEntity.referral
              : null,
          values: const [
            "Social Media",
            "Offline Event",
            "Dealer",
            "Associate",
            "Friend Recommendation",
          ],
          onChanged: (referral) {
            context.read<FormDataCubit>().accountHolderUpdateReferral(
              referral!,
            );
          },
        );
      },
    );
  }
}
