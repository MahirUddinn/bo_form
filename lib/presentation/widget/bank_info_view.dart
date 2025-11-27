import 'package:bo_acc_form/common/widget/custom_dropdown.dart';
import 'package:bo_acc_form/common/widget/custom_text_field.dart';
import 'package:bo_acc_form/common/widget/section_box.dart';
import 'package:bo_acc_form/presentation/bloc/form_data/form_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BankInfoView extends StatefulWidget {
  const BankInfoView({super.key});

  @override
  State<BankInfoView> createState() => _BankInfoViewState();
}

class _BankInfoViewState extends State<BankInfoView> {
  String? _selectedBankName;
  String? _selectedBankBranch;
  final TextEditingController _bankDistrictName = TextEditingController();
  final TextEditingController _bankACNumber = TextEditingController();

  @override
  void dispose() {
    _bankDistrictName.dispose();
    _bankACNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SectionBox(
            title: _buildBankFormTitle(),
            child: Column(
              children: [
                _formIncompleteError(),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      CustomDropdown(
                        labelText: "Bank Name",
                        hintText: "Select Bank Name",
                        isRequired: true,
                        values: [
                          "Bangladesh Commerce Bank",
                          "Pubali Bank",
                          "Prime Bak",
                          "Matha Bank",
                        ],
                        selectedValue: _selectedBankName,
                        onChanged: (value) {
                          _selectedBankName = value;
                        },
                      ),
                      CustomDropdown(
                        labelText: "Bank Branch",
                        hintText: "Select an option",
                        isRequired: true,
                        values: [
                          "Bank branch 1",
                          "Bank branch 2",
                          "Bank branch 3",
                          "Bank branch 4",
                        ],
                        selectedValue: _selectedBankBranch,
                        onChanged: (value) {
                          _selectedBankBranch = value;
                        },
                      ),
                      CustomTextField(
                        hintText: "Enter Bank District Name",
                        isRequired: true,
                        label: "Bank District",
                        controller: _bankDistrictName,
                        onChanged: (value) {},
                      ),
                      CustomTextField(
                        hintText: "Enter Bank Account Number",
                        isRequired: true,
                        label: "Bank A/C Number",
                        controller: _bankACNumber,
                        onChanged: (value) {},
                      ),
                      Text(
                        "**Bank AC must be 13 digits",
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _formIncompleteError() {
    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) => !state.accountFormCompleted
          ? Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Colors.redAccent),
              child: Center(
                child: Text("Please fill the account holder information first"),
              ),
            )
          : Container(),
    );
  }

  Widget _buildBankFormTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Bank Information",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6),
          ),
          child: InkWell(
            child: TextButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Column(
                      children: [
                        Text(
                          "How To Get 13-Digit Bank Account Number, Routing Number and Cheque Number From Your Check Leaf",
                          style: TextStyle(fontSize: 14),
                        ),
                        Text("//show image"),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Close"),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.info, color: Colors.white),
              label: Text(
                "Get 13-Digit A/C Number",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
