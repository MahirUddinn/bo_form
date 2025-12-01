import 'package:bo_acc_form/common/widget/custom_dropdown.dart';
import 'package:bo_acc_form/common/widget/custom_text_field.dart';
import 'package:bo_acc_form/common/widget/section_box.dart';
import 'package:bo_acc_form/presentation/bloc/form_data/form_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BankInfoView extends StatefulWidget {
  const BankInfoView({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;

  @override
  State<BankInfoView> createState() => _BankInfoViewState();
}

class _BankInfoViewState extends State<BankInfoView> {
  String? _selectedBankName;
  String? _selectedBankBranch;
  final TextEditingController _bankDistrictName = TextEditingController();
  final TextEditingController _bankACNumber = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initiateFormCubit();
  }

  void _initiateFormCubit() {
    final cubit = context.read<FormDataCubit>();
    final entity = cubit.state.bankInfoEntity;

    setState(() {
      _selectedBankName = entity.bankName.isNotEmpty ? entity.bankName : null;
      _selectedBankBranch = entity.bankBranch.isNotEmpty
          ? entity.bankBranch
          : null;
      _bankDistrictName.text = entity.bankDistrict;
      _bankACNumber.text = entity.bankAccountNumber;
    });
  }

  @override
  void dispose() {
    _bankDistrictName.dispose();
    _bankACNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: widget.formKey,
            child: Column(
              children: [
                SectionBox(
                  title: _buildBankFormTitle(),
                  child: Column(
                    children: [
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
                                "Prime Bank",
                                "Matha Bank",
                              ],
                              selectedValue: _selectedBankName,
                              onChanged: (value) {
                                setState(() {
                                  _selectedBankName = value;
                                });
                                context
                                    .read<FormDataCubit>()
                                    .bankInfoUpdateBankName(value!);
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select a bank name.';
                                }
                                return null;
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
                                setState(() {
                                  _selectedBankBranch = value;
                                });
                                context
                                    .read<FormDataCubit>()
                                    .bankInfoUpdateBankBranch(value!);
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please select a bank branch.';
                                }
                                return null;
                              },
                            ),
                            CustomTextField(
                              hintText: "Enter Bank District Name",
                              isRequired: true,
                              label: "Bank District",
                              controller: _bankDistrictName,
                              onChanged: (value) {
                                context
                                    .read<FormDataCubit>()
                                    .bankInfoUpdateBankDistrict(value);
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the bank district name.';
                                }
                                return null;
                              },
                            ),
                            CustomTextField(
                              hintText: "Enter Bank Account Number",
                              isRequired: true,
                              label: "Bank A/C Number",
                              controller: _bankACNumber,
                              onChanged: (value) {
                                context
                                    .read<FormDataCubit>()
                                    .bankInfoUpdateBankAccountNumber(value);
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the A/C number.';
                                }

                                return null;
                              },
                            ),
                            SizedBox(height: 8),
                            Text(
                              "**Bank AC must be 13 digits",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.grey[600],
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
            onTap: () {
              _showAccountNumberInfoDialog();
            },
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  Icon(Icons.info, color: Colors.white, size: 16),
                  SizedBox(width: 4),
                  Text(
                    "Get 13-Digit A/C Number",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showAccountNumberInfoDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "How To Get 13-Digit Bank Account Number",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "To find your 13-digit bank account number:",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 12),
              Text("1. Check your bank statement or passbook"),
              Text("2. Look at the bottom of your cheque leaf"),
              Text(
                "3. The account number is usually printed after the transit/routing number",
              ),
              Text("4. Ensure it contains exactly 13 digits"),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Example from cheque:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Routing: 123456789\nAccount: 0012345678901",
                      style: TextStyle(fontFamily: 'Monospace'),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "↑ 13-digit account number",
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
  }
}
