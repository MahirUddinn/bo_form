import 'package:bo_acc_form/common/widget/custom_birthday_picker.dart';
import 'package:bo_acc_form/common/widget/custom_checkbox.dart';
import 'package:bo_acc_form/common/widget/custom_dropdown.dart';
import 'package:bo_acc_form/common/widget/custom_image_picker.dart';
import 'package:bo_acc_form/common/widget/custom_password.dart';
import 'package:bo_acc_form/common/widget/custom_slider_toggle.dart';
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
  String? selectedBoType;
  bool? isMinorGuardian = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(label: "Name", hintText: "Enter thou name"),
          CustomStyledDropdown(
            labelText: "Country",
            hintText: "Select Country",
            selectedValue: _selectedCountry,
            values: ["USA", "Canada", "India", "UK", "Bangladesh"],
            onChanged: (value) {
              setState(() {
                _selectedCountry = value;
              });
            },
          ),
          CustomPasswordField(
            label: "Password",
            hintText: "Enter your password",
          ),
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
          SizedBox(height: 8),
          CustomImagePicker(
            title: "First Applicant (1st Holder) Photo",
            subtitle: "(Max. Image size: 591x709 px)",
            initialImage: null,
            onImagePicked: (file) {},
            validator: (file) {
              if (file == null) return "Please select an image";
              return null;
            },
          ),

          SizedBox(height: 8),

          CustomCheckSelector(
            label: "BO Type",
            listOfValues: ["New BO", "Link BO", "Matha"],
            selectedValue: selectedBoType,
            validator: (val) {
              if (val == null) return "Please select BO Type";
              return null;
            },
            onChanged: (value) {
              setState(() {
                selectedBoType = value;
              });
            },
          ),
          SizedBox(height: 8),
          CustomCheckSelector(
            label: "BO Type",
            listOfValues: ["New BO", "Link BO", "Matha"],
            isRect: true,
            selectedValue: selectedBoType,
            validator: (val) {
              if (val == null) return "Please select BO Type";
              return null;
            },
            onChanged: (value) {
              setState(() {
                selectedBoType = value;
              });
            },
          ),
          SizedBox(height: 8),
          CustomSliderToggle(
            label:
                "Do you want to add Nominee 1 Guardian (If Nominee is A Minor) ?",
            selectedValue: isMinorGuardian,
            onChanged: (val) => setState(() => isMinorGuardian = val!),
            validator: (value) {
              if (value == null) return "Required";
              return null;
            },
          ),
        ],
      ),
    );
  }
}
