import 'package:flutter/material.dart';

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
    this.isRect = false, this.isRequired = false,
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
            label != ""?
            RichText(
              text: TextSpan(
                text: label,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
                children: [
                  isRequired?
                  TextSpan(
                    text: " *",
                    style: TextStyle(color: Colors.red),
                  ):TextSpan(),
                ],
              ),
            ): Container(),

            SizedBox(height: 6),

            Wrap(
              spacing: 14,
              runSpacing: 12,
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
                        decoration: BoxDecoration(
                          borderRadius: isRect
                              ? BorderRadius.circular(5)
                              : BorderRadius.circular(9),
                          color: isSelected
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).disabledColor,
                        ),

                        child: isSelected
                            ? Icon(Icons.check, size: 14, color: Colors.white)
                            : null,
                      ),

                      SizedBox(width: 6),
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
                padding: EdgeInsets.only(top: 6),
                child: Text(
                  state.errorText!,
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
