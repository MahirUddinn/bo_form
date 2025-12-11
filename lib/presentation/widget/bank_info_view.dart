import 'package:bo_acc_form/common/constants/app_sizes.dart';
import 'package:bo_acc_form/common/constants/app_strings.dart';
import 'package:bo_acc_form/common/constants/app_ui_widgets.dart';
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

    _selectedBankName = entity.bankName.isNotEmpty ? entity.bankName : null;
    _selectedBankBranch = entity.bankBranch.isNotEmpty
        ? entity.bankBranch
        : null;
    _bankDistrictName.text = entity.bankDistrict;
    _bankACNumber.text = entity.bankAccountNumber;
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
                        padding: EdgeInsets.all(AppSizes.mp12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomDropdown(
                              labelText: AppStrings.bankName,
                              hintText: AppStrings.selectBankName,
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
                                  return AppStrings.selectBankNameError;
                                }
                                return null;
                              },
                            ),
                            CustomDropdown(
                              labelText: AppStrings.bankBranch,
                              hintText: AppStrings.selectOption,
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
                                  return AppStrings.selectBankBranchError;
                                }
                                return null;
                              },
                            ),
                            CustomTextField(
                              hintText: AppStrings.enterBankDistrict,
                              isRequired: true,
                              label: AppStrings.bankDistrict,
                              controller: _bankDistrictName,
                              onChanged: (value) {
                                context
                                    .read<FormDataCubit>()
                                    .bankInfoUpdateBankDistrict(value);
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppStrings.enterBankDistrictError;
                                }
                                return null;
                              },
                            ),
                            CustomTextField(
                              hintText: AppStrings.enterBankAccountNumber,
                              isRequired: true,
                              label: AppStrings.bankAccountNumber,
                              controller: _bankACNumber,
                              onChanged: (value) {
                                context
                                    .read<FormDataCubit>()
                                    .bankInfoUpdateBankAccountNumber(value);
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppStrings.enterBankAccountNumberError;
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: AppSizes.mp6),
                            Text(
                              AppStrings.bankAccountHint,
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.grey[600],
                                fontSize: AppSizes.fs12,
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
          AppStrings.bankInfoTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppSizes.fs15,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(AppSizes.br6),
          ),
          child: InkWell(
            onTap: () {
              _showAccountNumberInfoDialog();
            },
            child: Padding(
              padding: EdgeInsets.all(AppSizes.mp12),
              child: Row(
                children: [
                  Icon(Icons.info, color: Colors.white, size: AppSizes.fs15),
                  SizedBox(width: AppSizes.mp4),
                  Text(
                    AppStrings.get13DigitAccount,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppSizes.fs12,
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
          AppStrings.howToGet13DigitAccount,
          style: TextStyle(
            fontSize: AppSizes.fs15,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.bankAccountInstructions1,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: AppSizes.mp12),
              Text(AppStrings.bankAccountInstructions2),
              Text(AppStrings.bankAccountInstructions3),
              Text(AppStrings.bankAccountInstructions4),
              Text(AppStrings.bankAccountInstructions5),
              SizedBox(height: AppSizes.mp16),
              Container(
                padding: EdgeInsets.all(AppSizes.mp12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(AppSizes.br6),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.exampleFromCheque,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: AppSizes.mp6),
                    Text(
                      AppStrings.routingAccountExample,
                      style: TextStyle(fontFamily: 'Monospace'),
                    ),
                    SizedBox(height: AppSizes.mp4),
                    Text(
                      AppStrings.digitAccountPointer,
                      style: TextStyle(
                        fontSize: AppSizes.fs12,
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
            child: Text(AppStrings.close),
          ),
        ],
      ),
    );
  }
}
