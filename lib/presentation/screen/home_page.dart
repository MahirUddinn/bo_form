import 'package:bo_acc_form/common/widget/custom_button.dart';
import 'package:bo_acc_form/common/widget/custom_stepper_widget.dart';
import 'package:flutter/material.dart';
// Import your views here
import 'package:bo_acc_form/presentation/widget/account_holder_view.dart';
import 'package:bo_acc_form/presentation/widget/authorize_view.dart';
import 'package:bo_acc_form/presentation/widget/bank_info_view.dart';
import 'package:bo_acc_form/presentation/widget/document_view.dart';
import 'package:bo_acc_form/presentation/widget/nominee_view.dart';

class StepperPage extends StatefulWidget {
  const StepperPage({super.key});

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {
  final ScrollController scrollController = ScrollController();
  int _currentStep = 0;
  final double stepItemWidth = 120;

  void _scrollToStep(int index) {
    final double offset = index * stepItemWidth;
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
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        titleSpacing: 0,
        title: TopStepperWidget(
          controller: scrollController,
          steps: _stepTitles,
          currentStep: _currentStep,
          onStepTapped: (index) {
            if (index <= _currentStep) {
              setState(() => _currentStep = index);
            }
          },
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: _stepWidgets[_currentStep],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                if (_currentStep > 0)
                  Expanded(
                    child: CustomButton(
                      onSubmit: () {
                        setState(() {
                          _currentStep--;
                        });
                        if (_currentStep > _stepWidgets.length - 4) {
                          return;
                        } else {
                          _scrollToStep(_currentStep);
                        }
                      },
                      color: customTheme.disabledColor,
                      child: Text(
                        "< Prev",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                if (_currentStep > 0) const SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    onSubmit: () {
                      if (_currentStep < _stepTitles.length - 1) {
                        setState(() {
                          _currentStep++;
                        });
                      } else {
                        print("Submit");
                      }
                      if (_currentStep < 1 ||
                          _currentStep > _stepWidgets.length - 3) {
                        return;
                      } else {
                        _scrollToStep(_currentStep);
                      }
                    },
                    color: customTheme.primaryColor,
                    child: Text(
                      _currentStep == _stepTitles.length - 1
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
      ),
    );
  }
}
