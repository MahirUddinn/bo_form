import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomBirthdayPicker extends StatelessWidget {
  final String hintText;
  final String labelText;
  final DateTime? selectedDate;
  final DateFormat formatter;
  final void Function()? onTap;
  final String? Function(Object?)? validator;
  final bool isRequired;

  const CustomBirthdayPicker({
    super.key,
    this.labelText = "",
    required this.selectedDate,
    required this.formatter,
    required this.onTap,
    required this.validator,
    required this.hintText,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      validator: validator,
      initialValue: selectedDate,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                        isRequired?
                        TextSpan(
                          text: " *",
                          style: TextStyle(color: Colors.red),
                        ):TextSpan(),
                      ],
                    ),
                  )
                : Container(),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(14),
                child: InputDecorator(
                  isEmpty: selectedDate == null,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: Theme.of(context).hintColor,
                      fontSize: 15,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    suffixIcon: Icon(
                      Icons.calendar_today_outlined,
                      color: Theme.of(context).hintColor,
                    ),
                    errorText: field.errorText,
                  ),
                  child: Text(
                    selectedDate != null ? formatter.format(selectedDate!) : "",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
