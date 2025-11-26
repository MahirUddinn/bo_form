import 'package:bo_acc_form/common/widget/custom_birthday_picker.dart';
import 'package:bo_acc_form/common/widget/custom_dropdown.dart';
import 'package:bo_acc_form/common/widget/custom_image_picker.dart';
import 'package:bo_acc_form/common/widget/custom_password.dart';
import 'package:bo_acc_form/common/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountHolderView extends StatefulWidget {
  const AccountHolderView({super.key});

  @override
  State<AccountHolderView> createState() => _AccountHolderViewState();
}

class _AccountHolderViewState extends State<AccountHolderView> {
  String? _selectedCountry;
  DateTime? _dob;
  final formatter = DateFormat('dd-MM-yyyy');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(label: "Name", hintText: "Enter thou name"),
        CustomStyledDropdown(
          labelText: "Country",
          hintText: "First Name",
          selectedValue: _selectedCountry,
          values: ["USA", "Canada", "India", "UK", "Bangladesh"],
          onChanged: (value) {
            setState(() {
              _selectedCountry = value;
            });
          },
        ),
        CustomPasswordField(label: "Password", hintText: "Enter your password"),
        CustomBirthdayPicker(
          hintText: "DD - MM - YYYY",
          labelText: "Date of Birth",
          selectedDate: _dob,
          formatter: formatter,
          validator: (value) =>
              _dob == null ? "Please select your date of birth" : null,
          onTap: () async {
            DateTime? picked = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              initialDate: DateTime(2000),
            );
            if (picked != null) {
              setState(() => _dob = picked);
            }
          },
        ),
        SizedBox(height: 8,),
        CustomImagePicker(
          title: "First Applicant (1st Holder) Photo",
          initialImage: null,
          onImagePicked: (file) {

          },
          validator: (file) {
            if (file == null) return "Please select an image";
            return null;
          },
        ),

      ],
    );
  }
}
