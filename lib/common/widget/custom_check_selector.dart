import 'package:bo_acc_form/common/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:bo_acc_form/common/constants/app_ui_widgets.dart';

class CustomCheckSelector extends StatelessWidget {
  final String label;
  final List<String> listOfValues;
  final String? selectedValue;
  final Function(String?) onChanged;
  final String? Function(String?)? validator;
  final bool isRect;
  final bool isRequired;

  const CustomCheckSelector({
    super.key,
    this.label = "",
    required this.listOfValues,
    required this.selectedValue,
    required this.onChanged,
    this.validator,
    this.isRect = false,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;

    return FormField<String>(
      initialValue: selectedValue,
      validator: validator,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppUiWidgets.fieldLabel(
              context,
              label: label,
              isRequired: isRequired,
            ),
            AppUiWidgets.verticalSpacing8,
            Wrap(
              spacing: AppSizes.checkSelectorWrapSpacing,
              runSpacing: AppSizes.checkSelectorWrapRunSpacing,
              children: listOfValues.map((value) {
                final bool isSelected = state.value == value;

                return GestureDetector(
                  onTap: () {
                    state.didChange(value);
                    onChanged(value);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 18,
                        height: 18,
                        margin: EdgeInsets.symmetric(vertical: AppSizes.mp8),
                        decoration: BoxDecoration(
                          borderRadius: isRect
                              ? BorderRadius.circular(5)
                              : BorderRadius.circular(9),
                          color: isSelected
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).disabledColor,
                        ),

                        child: isSelected
                            ? Icon(Icons.check, size: AppSizes.fs12, color: Colors.white)
                            : null,
                      ),

                      AppUiWidgets.horizontalSpacing6,
                      Text(
                        value,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: isSelected ? textColor : Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),

            if (state.hasError)
              Padding(
                padding: EdgeInsets.only(top: AppSizes.mp6),
                child: Text(
                  state.errorText!,
                  style: AppUiWidgets.errorTextStyle(context),
                ),
              ),
          ],
        );
      },
    );
  }
}
