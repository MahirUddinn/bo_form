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
  final double stepItemWidth = 120;

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
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  final List<String> _stepTitles = [
    'Account Holder',
    'Bank Info',
    'Authorize',
    'Nominee',
    'Document',
  ];

  final List<Widget> _stepWidgets = const [
    AccountHolderView(),
    BankInfoView(),
    AuthorizeView(),
    NomineeView(),
    DocumentView(),
  ];

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
          toolbarHeight: 70,
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 8.0,
                    ),
                    child: _stepWidgets[state.currentStep],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      if (state.currentStep > 0)
                        Expanded(
                          child: CustomButton(
                            onSubmit: () {
                              context.read<StepperCubit>().onStepBackwards();
                            },
                            color: customTheme.disabledColor,
                            child: const Text(
                              "< Prev",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      if (state.currentStep > 0) const SizedBox(width: 16),

                      Expanded(
                        child: CustomButton(
                          onSubmit: () {
                            if (state.currentStep < _stepTitles.length - 1) {
                              context.read<StepperCubit>().onStepForward();
                            } else {
                              context.read<FormDataCubit>().onSubmit();
                              print("Submit");
                            }
                          },
                          color: customTheme.primaryColor,
                          child: Text(
                            state.currentStep == _stepTitles.length - 1
                                ? "Submit"
                                : "Next >",
                            style: const TextStyle(color: Colors.white),
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
