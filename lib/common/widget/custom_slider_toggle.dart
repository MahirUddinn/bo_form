import 'package:bo_acc_form/common/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:bo_acc_form/common/constants/app_ui_widgets.dart';

class CustomSliderToggle extends StatelessWidget {
  final String label;
  final bool? selectedValue;
  final Function(bool?) onChanged;
  final String? Function(bool?)? validator;
  final bool isRequired;

  const CustomSliderToggle({
    super.key,
    this.label = "",
    required this.selectedValue,
    required this.onChanged,
    this.validator,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<bool>(
      initialValue: selectedValue,
      validator: validator,
      builder: (state) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: AppSizes.mp8),
          padding: EdgeInsets.all(AppSizes.mp12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.br12),
            color: Theme.of(context).disabledColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppSizes.mp8),
              AppUiWidgets.fieldLabel(
                context,
                label: label,
                isRequired: isRequired,
              ),
              SizedBox(height: AppSizes.mp8),
              Row(
                children: [
                  Switch(
                    value: state.value ?? false,
                    onChanged: (value) {
                      state.didChange(value);
                      onChanged(value);
                    },

                    activeThumbColor: Theme.of(context).colorScheme.primary,
                    inactiveThumbColor: Colors.grey,
                    activeTrackColor: Colors.transparent,
                    inactiveTrackColor: Colors.transparent,

                    trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((
                      Set<WidgetState> states,
                    ) {
                      if (states.contains(WidgetState.selected)) {
                        return Theme.of(context).colorScheme.primary;
                      }
                      return Colors.black;
                    }),

                    trackOutlineWidth: WidgetStateProperty.all(1),
                  ),
                ],
              ),
              if (state.hasError)
                Padding(
                  padding: EdgeInsets.only(top: AppSizes.mp8),
                  child: Text(
                    state.errorText!,
                    style: AppUiWidgets.errorTextStyle(context),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
