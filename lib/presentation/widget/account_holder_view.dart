import 'package:bo_acc_form/common/widget/custom_date_picker.dart';
import 'package:bo_acc_form/common/widget/custom_check_selector.dart';
import 'package:bo_acc_form/common/widget/custom_dropdown.dart';
import 'package:bo_acc_form/common/widget/custom_image_picker.dart';
import 'package:bo_acc_form/common/widget/custom_password.dart';
import 'package:bo_acc_form/common/widget/custom_slider_toggle.dart';
import 'package:bo_acc_form/common/widget/custom_text_field.dart';
import 'package:bo_acc_form/common/widget/section_box.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccountHolderView extends StatefulWidget {
  const AccountHolderView({super.key});

  @override
  State<AccountHolderView> createState() => _AccountHolderViewState();
}

class _AccountHolderViewState extends State<AccountHolderView> {
  //make an account_holder_entity.dart that contains these fields, the TextEditingControllers are going to pass the TextEditingController.text to make em strings. it should also have a copyWith function.
  String? _selectedBoType = "New BO";
  String? _selectedReferral;
  String? _selectedClientType = "Individual";
  String? _selectedCourtesyTitle;
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  DateTime? _dob;
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _motherNameController = TextEditingController();
  final TextEditingController _addressLine1Controller = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _addressLine3Controller = TextEditingController();
  final TextEditingController _cityNameController = TextEditingController();
  final TextEditingController _postCodeController = TextEditingController();
  final TextEditingController _districtNameController = TextEditingController();
  String? _selectedCountry;
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _telephoneNumberController =
      TextEditingController();
  final TextEditingController _faxNumberController = TextEditingController();
  final TextEditingController _nationalityController = TextEditingController();
  final TextEditingController _nidController = TextEditingController();
  final TextEditingController _tinController = TextEditingController();
  String? _selectedBrokerOffice;
  String? _selectedResidentialStatus = "Resident";
  String? _selectedGender = "Male";
  bool? isOfficerOrDirectorOrAuthorizedRepresentative = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _occupationController.dispose();
    _fatherNameController.dispose();
    _motherNameController.dispose();
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    _addressLine3Controller.dispose();
    _mobileNumberController.dispose();
    _emailAddressController.dispose();
    _telephoneNumberController.dispose();
    _faxNumberController.dispose();
    _nationalityController.dispose();
    _nidController.dispose();
    _tinController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SectionBox(
            title: "Account Holder",
            child: Column(
              children: [
                _buildAccountHolder(),
                SectionBox(
                  title: "First A/C Holder",
                  child: _buildFirstACHolder(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFirstACHolder() {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCheckSelector(
            label: "Type of Client",
            listOfValues: ["Individual", "Joint"],
            isRequired: true,
            selectedValue: _selectedClientType,
            onChanged: (value) {
              _selectedClientType = value;
            },
          ),
          CustomDropdown(
            labelText: "Courtesy Title",
            hintText: "Select an option",
            values: ["Mr", "Mrs", "Ms", "Dr"],
            onChanged: (value) {
              _selectedCourtesyTitle = value;
            },
          ),
          CustomTextField(
            hintText: "Enter First Name",
            isRequired: true,
            label: "First Name",
            controller: _firstNameController,
          ),
          CustomTextField(
            hintText: "Enter Last Name",
            isRequired: true,
            label: "Last Name",
            controller: _lastNameController,
          ),
          CustomTextField(
            hintText: "Enter Occupation",
            isRequired: true,
            label: "Occupation",
            controller: _occupationController,
          ),
          CustomDatePicker(
            isRequired: true,
            labelText: "Date of Birth (YYYY-MM-DD)",
            selectedDate: _dob,
            formatter: DateFormat('yyyy-MM-dd'),
            onTap: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (picked != null) {
                setState(() {
                  _dob = picked;
                });
              }
            },
            hintText: "YYYY-MM-DD",
          ),
          CustomTextField(
            hintText: "Enter Father Name",
            isRequired: true,
            label: "Father's Name",
            controller: _fatherNameController,
          ),
          CustomTextField(
            hintText: "Enter Mother Name",
            isRequired: true,
            label: "Mother's Name",
            controller: _motherNameController,
          ),
          CustomTextField(
            hintText: "Enter Address Line 1",
            isRequired: true,
            label: "Address Line 1",
            controller: _addressLine1Controller,
          ),
          CustomTextField(
            hintText: "Enter Address Line 2",
            isRequired: false,
            label: "Address Line 2",
            controller: _addressLine2Controller,
          ),
          CustomTextField(
            hintText: "Enter Address Line 2",
            isRequired: false,
            label: "Address Line 2",
            controller: _addressLine3Controller,
          ),
          CustomTextField(
            hintText: "Enter City",
            isRequired: true,
            label: "City",
            controller: _cityNameController,
          ),
          CustomTextField(
            hintText: "Enter Post Code",
            isRequired: true,
            label: "Post Code",
            controller: _postCodeController,
          ),
          CustomTextField(
            hintText: "Enter District",
            isRequired: true,
            label: "District",
            controller: _districtNameController,
          ),
          CustomDropdown(
            labelText: "Country",
            hintText: "Select an option",
            isRequired: true,
            values: ["USA", "Canada", "India", "UK", "Bangladesh"],
            onChanged: (value) {
              _selectedCountry = value;
            },
          ),
          CustomTextField(
            hintText: "Enter Mobile",
            isRequired: true,
            label: "Mobile",
            controller: _mobileNumberController,
          ),
          CustomTextField(
            hintText: "Enter Email Address",
            isRequired: true,
            label: "Email",
            controller: _emailAddressController,
          ),
          CustomTextField(
            hintText: "Enter Telephone Number",
            isRequired: false,
            label: "Telephone",
            controller: _telephoneNumberController,
          ),
          CustomTextField(
            hintText: "Enter FAX Number",
            isRequired: false,
            label: "FAX",
            controller: _faxNumberController,
          ),
          CustomTextField(
            hintText: "Enter Nationality",
            isRequired: true,
            label: "Nationality",
            controller: _nationalityController,
          ),
          CustomTextField(
            hintText: "Enter National Identity Card Number",
            isRequired: true,
            label: "National ID",
            controller: _nidController,
          ),
          CustomTextField(
            hintText: "Enter Tax Identification Number (TIN)",
            isRequired: false,
            label: "Tax Identification Number (TIN)",
            controller: _tinController,
          ),
          CustomDropdown(
            labelText: "Broker Branch",
            hintText: "Select an option",
            isRequired: true,
            values: ["HEAD OFFICE", "SYLHET", "BOGURA", "BMSL", "TANGAIL"],
            onChanged: (value) {
              _selectedBrokerOffice = value;
            },
          ),
          CustomCheckSelector(
            label: "Residential Status",
            listOfValues: ["Resident", "Non Resident", "Foreigner"],
            isRequired: true,
            selectedValue: _selectedResidentialStatus,
            onChanged: (value) {
              _selectedResidentialStatus = value;
            },
          ),
          CustomCheckSelector(
            label: "Gender",
            listOfValues: ["Male", "Female"],
            isRequired: true,
            selectedValue: _selectedGender,
            onChanged: (value) {
              _selectedGender = value;
            },
          ),
          CustomSliderToggle(
            label:
                "Whether the applicant is an officer or Director or Authorized Representative of any Stock Exchange/Listed Company/Brokerage Firm",
            selectedValue: isOfficerOrDirectorOrAuthorizedRepresentative,
            onChanged: (value) {
              isOfficerOrDirectorOrAuthorizedRepresentative = value;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAccountHolder() {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCheckSelector(
            isRequired: true,
            label: "BO Type",
            listOfValues: ["New BO", "Link BO"],
            selectedValue: _selectedBoType,
            onChanged: (value) {
              setState(() {
                _selectedBoType = value;
              });
            },
          ),
          _selectedBoType == "Link BO"
              ? CustomTextField(hintText: "Enter BOID")
              : Container(),
          SizedBox(height: 8),
          Text(
            "Referral(Lets us know where you heard of our BO account services)",
          ),
          CustomDropdown(
            hintText: "Select an option",
            values: [
              "Social Media",
              "Offline Event",
              "Dealer",
              "Associate",
              "Friend Recommendation",
            ],
            onChanged: (referral) {
              setState(() {
                _selectedReferral = referral;
              });
            },
          ),
        ],
      ),
    );
  }
}

// Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomTextField(label: "Name", hintText: "Enter thou name"),
//           CustomStyledDropdown(
//             labelText: "City",
//             hintText: "Select Country",
//             selectedValue: _selectedCountry,
//             values: ["USA", "Canada", "India", "UK", "Bangladesh"],
//             onChanged: (value) {
//               setState(() {
//                 _selectedCountry = value;
//               });
//             },
//           ),
//           SizedBox(height: 8,),
//           CustomPasswordField(
//             label: "Password",
//             hintText: "Enter your password",
//           ),
//           CustomBirthdayPicker(
//             hintText: "DD - MM - YYYY",
//             labelText: "Date of Birth",
//             selectedDate: _dob,
//             formatter: formatter,
//             validator: (value) =>
//                 _dob == null ? "Please select your date of birth" : null,
//             onTap: () async {
//               DateTime? picked = await showDatePicker(
//                 context: context,
//                 firstDate: DateTime(1900),
//                 lastDate: DateTime.now(),
//                 initialDate: DateTime(2000),
//               );
//               if (picked != null) {
//                 setState(() => _dob = picked);
//               }
//             },
//           ),
//           SizedBox(height: 8),
//           CustomImagePicker(
//             title: "First Applicant (1st Holder) Photo",
//             subtitle: "(Max. Image size: 591x709 px)",
//             initialImage: null,
//             onImagePicked: (file) {},
//             validator: (file) {
//               if (file == null) return "Please select an image";
//               return null;
//             },
//           ),
//
//           SizedBox(height: 8),
//
//           CustomCheckSelector(
//             label: "BO Type",
//             listOfValues: ["New BO", "Link BO", "Matha"],
//             selectedValue: selectedBoType,
//             validator: (val) {
//               if (val == null) return "Please select BO Type";
//               return null;
//             },
//             onChanged: (value) {
//               setState(() {
//                 selectedBoType = value;
//               });
//             },
//           ),
//           SizedBox(height: 8),
//           CustomCheckSelector(
//             label: "BO Type",
//             listOfValues: ["New BO", "Link BO", "Matha"],
//             isRect: true,
//             selectedValue: selectedBoType,
//             validator: (val) {
//               if (val == null) return "Please select BO Type";
//               return null;
//             },
//             onChanged: (value) {
//               setState(() {
//                 selectedBoType = value;
//               });
//             },
//           ),
//           SizedBox(height: 8),
//           CustomSliderToggle(
//             label:
//                 "Do you want to add Nominee 1 Guardian (If Nominee is A Minor) ?",
//             selectedValue: isMinorGuardian,
//             onChanged: (val) => setState(() => isMinorGuardian = val!),
//             validator: (value) {
//               if (value == null) return "Required";
//               return null;
//             },
//           ),
//         ],
//       )
