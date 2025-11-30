import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final String labelText;
  final String hintText;
  final List<String> values;
  final String? selectedValue;
  final void Function(String?) onChanged;
  final String? Function(String?)? validator;
  final bool isRequired;

  const CustomDropdown({
    super.key,
    this.labelText = "",
    required this.hintText,
    required this.values,
    required this.onChanged,
    this.selectedValue,
    this.validator,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 6),
        labelText != ""
            ? RichText(
                text: TextSpan(
                  text: labelText,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                  ),
                  children: [
                    isRequired
                        ? TextSpan(
                            text: " *",
                            style: TextStyle(color: Colors.red),
                          )
                        : TextSpan(),
                  ],
                ),
              )
            : Container(),

        SizedBox(height: 6),

        Container(
          padding: EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),

          child: DropdownButtonFormField<String>(
            initialValue: selectedValue,
            validator: validator,
            dropdownColor: Theme.of(context).cardColor,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 15,
              ),
              filled: true,
              fillColor: Theme.of(context).cardColor,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                  width: 1,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),

              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),

            icon: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Theme.of(context).hintColor,
              size: 30,
            ),

            items: values.map((value) {
              return DropdownMenuItem(
                value: value,
                child: Text(value, style: TextStyle(fontSize: 15)),
              );
            }).toList(),

            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
