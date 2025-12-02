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
  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BankNameDropdown(),
                        BankBranchDropdown(),
                        BankDistrictTextField(),
                        BankAccountNumberTextField(),
                        const SizedBox(height: 8),
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
  }

  Widget _buildBankFormTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
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
            child: const Padding(
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
        title: const Text(
          "How To Get 13-Digit Bank Account Number",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "To find your 13-digit bank account number:",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 12),
              const Text("1. Check your bank statement or passbook"),
              const Text("2. Look at the bottom of your cheque leaf"),
              const Text(
                "3. The account number is usually printed after the transit/routing number",
              ),
              const Text("4. Ensure it contains exactly 13 digits"),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
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
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }
}

// Individual widget components for BankInfoView

class BankNameDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
      previous.bankInfoEntity.bankName != current.bankInfoEntity.bankName,
      builder: (context, state) {
        return CustomDropdown(
          labelText: "Bank Name",
          hintText: "Select Bank Name",
          isRequired: true,
          values: const [
            "Bangladesh Commerce Bank",
            "Pubali Bank",
            "Prime Bank",
            "Matha Bank",
          ],
          selectedValue: state.bankInfoEntity.bankName.isNotEmpty
              ? state.bankInfoEntity.bankName
              : null,
          onChanged: (value) {
            context.read<FormDataCubit>().bankInfoUpdateBankName(value!);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a bank name.';
            }
            return null;
          },
        );
      },
    );
  }
}

class BankBranchDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
      previous.bankInfoEntity.bankBranch !=
          current.bankInfoEntity.bankBranch,
      builder: (context, state) {
        return CustomDropdown(
          labelText: "Bank Branch",
          hintText: "Select an option",
          isRequired: true,
          values: const [
            "Bank branch 1",
            "Bank branch 2",
            "Bank branch 3",
            "Bank branch 4",
          ],
          selectedValue: state.bankInfoEntity.bankBranch.isNotEmpty
              ? state.bankInfoEntity.bankBranch
              : null,
          onChanged: (value) {
            context.read<FormDataCubit>().bankInfoUpdateBankBranch(value!);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select a bank branch.';
            }
            return null;
          },
        );
      },
    );
  }
}

class BankDistrictTextField extends StatefulWidget {
  @override
  State<BankDistrictTextField> createState() => _BankDistrictTextFieldState();
}

class _BankDistrictTextFieldState extends State<BankDistrictTextField> {
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
      previous.bankInfoEntity.bankDistrict !=
          current.bankInfoEntity.bankDistrict,
      builder: (context, state) {
        if (_controller.text != state.bankInfoEntity.bankDistrict) {
          _controller.text = state.bankInfoEntity.bankDistrict;
        }
        return CustomTextField(
          hintText: "Enter Bank District Name",
          isRequired: true,
          label: "Bank District",
          controller: _controller,
          onChanged: (value) {
            context.read<FormDataCubit>().bankInfoUpdateBankDistrict(value);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the bank district name.';
            }
            return null;
          },
        );
      },
    );
  }
}

class BankAccountNumberTextField extends StatefulWidget {
  @override
  State<BankAccountNumberTextField> createState() =>
      _BankAccountNumberTextFieldState();
}

class _BankAccountNumberTextFieldState
    extends State<BankAccountNumberTextField> {
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
      previous.bankInfoEntity.bankAccountNumber !=
          current.bankInfoEntity.bankAccountNumber,
      builder: (context, state) {
        if (_controller.text != state.bankInfoEntity.bankAccountNumber) {
          _controller.text = state.bankInfoEntity.bankAccountNumber;
        }
        return CustomTextField(
          hintText: "Enter Bank Account Number",
          isRequired: true,
          label: "Bank A/C Number",
          controller: _controller,
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
        );
      },
    );
  }
}