import 'package:bo_acc_form/common/constants/app_sizes.dart';
import 'package:bo_acc_form/common/constants/app_strings.dart';
import 'package:bo_acc_form/common/constants/app_ui_widgets.dart';
import 'package:bo_acc_form/common/widget/custom_button.dart';
import 'package:bo_acc_form/common/widget/custom_stepper_widget.dart';
import 'package:bo_acc_form/presentation/bloc/form_data/form_data_cubit.dart';
import 'package:bo_acc_form/presentation/bloc/stepper_cubit/stepper_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bo_acc_form/presentation/widget/account_holder_view.dart';
import 'package:bo_acc_form/presentation/widget/authorize_view.dart';
import 'package:bo_acc_form/presentation/widget/bank_info_view.dart';
import 'package:bo_acc_form/presentation/widget/document_view.dart';
import 'package:bo_acc_form/presentation/widget/nominee_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  final double stepItemWidth = AppSizes.stepItemWidth;

  final GlobalKey<FormState> _accountHolderFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _bankInfoFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _authorizeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _nomineeFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _documentFormKey = GlobalKey<FormState>();

  void _scrollToStep(int index) {
    if (!scrollController.hasClients) return;

    final screenWidth = MediaQuery.of(context).size.width;

    double offset =
        (index * stepItemWidth) - (screenWidth / 2) + (stepItemWidth / 2);

    if (offset < 0) offset = 0;

    if (scrollController.position.maxScrollExtent > 0 &&
        offset > scrollController.position.maxScrollExtent) {
      offset = scrollController.position.maxScrollExtent;
    }

    scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  final List<String> _stepTitles = [
    AppStrings.accountHolder,
    AppStrings.bankInfo,
    AppStrings.authorize,
    AppStrings.nominee,
    AppStrings.document,
  ];

  GlobalKey<FormState> _getCurrentFormKey(int currentStep) {
    switch (currentStep) {
      case 0:
        return _accountHolderFormKey;
      case 1:
        return _bankInfoFormKey;
      case 2:
        return _authorizeFormKey;
      case 3:
        return _nomineeFormKey;
      case 4:
        return _documentFormKey;
      default:
        return _accountHolderFormKey;
    }
  }

  bool _validateCurrentForm(int currentStep) {
    final formKey = _getCurrentFormKey(currentStep);
    if (formKey.currentState != null) {
      return formKey.currentState!.validate();
    }
    return false;
  }

  Widget _getStepWidget(int step) {
    switch (step) {
      case 0:
        return AccountHolderView(formKey: _accountHolderFormKey);
      case 1:
        return BankInfoView(formKey: _bankInfoFormKey);
      case 2:
        return AuthorizeView(formKey: _authorizeFormKey);
      case 3:
        return NomineeView(formKey: _nomineeFormKey);
      case 4:
        return DocumentView(formKey: _documentFormKey);
      default:
        return AccountHolderView(formKey: _accountHolderFormKey);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context);
    return BlocListener<StepperCubit, StepperState>(
      listener: (context, state) {
        _scrollToStep(state.currentStep);
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: AppSizes.toolbarHeight,
          titleSpacing: 0,
          title: BlocBuilder<StepperCubit, StepperState>(
            builder: (context, state) {
              return TopStepperWidget(
                controller: scrollController,
                steps: _stepTitles,
                currentStep: state.currentStep,
                onStepTapped: (index) {
                  if (index <= state.currentStep) {
                    context.read<StepperCubit>().onStepTapped(index);
                  }
                },
              );
            },
          ),
        ),
        body: BlocBuilder<StepperCubit, StepperState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppSizes.mp6,
                      vertical: AppSizes.mp6,
                    ),
                    child: _getStepWidget(state.currentStep),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(AppSizes.mp12),
                  child: Row(
                    children: [
                      if (state.currentStep > 0)
                        Expanded(
                          child: CustomButton(
                            onSubmit: () {
                              context.read<StepperCubit>().onStepBackwards();
                            },
                            color: customTheme.disabledColor,
                            child: Text(
                              AppStrings.prevButton,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      if (state.currentStep > 0) SizedBox(width: AppSizes.mp16,),
                      Expanded(
                        child: CustomButton(
                          onSubmit: () async {
                            if (state.currentStep < _stepTitles.length - 1) {
                              // if (_validateCurrentForm(state.currentStep)) {
                                context.read<StepperCubit>().onStepForward();
                              // }
                            } else {
                              if (_validateCurrentForm(state.currentStep)) {
                                context.read<FormDataCubit>().onSubmit();
                                context.read<StepperCubit>().onStepTapped(0);
                              } else {
                                context.read<FormDataCubit>().onSubmit();
                              }
                            }
                          },
                          color: customTheme.colorScheme.primary,
                          child: Text(
                            state.currentStep == _stepTitles.length - 1
                                ? AppStrings.submitButton
                                : AppStrings.nextButton,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
