import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  final String hintText;
  final String labelText;
  final DateTime? selectedDate;
  final DateFormat formatter;
  final VoidCallback? onTap;
  final String? Function(DateTime?)? validator;
  final bool isRequired;

  const CustomDatePicker({
    super.key,
    this.labelText = "",
    required this.selectedDate,
    required this.formatter,
    required this.onTap,
    this.validator,
    required this.hintText,
    this.isRequired = false,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? _lastValidatedDate;

  //done by ai
  @override
  void didUpdateWidget(CustomDatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedDate != oldWidget.selectedDate) {
      _lastValidatedDate = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      validator: (value) {
        // also done by ai
        return widget.validator?.call(widget.selectedDate);
      },
      initialValue: widget.selectedDate,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),
            widget.labelText != ""
                ? RichText(
              text: TextSpan(
                text: widget.labelText,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
                children: [
                  widget.isRequired
                      ? const TextSpan(
                    text: " *",
                    style: TextStyle(color: Colors.red),
                  )
                      : const TextSpan(),
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
                onTap: widget.onTap,
                borderRadius: BorderRadius.circular(14),
                child: InputDecorator(
                  isEmpty: widget.selectedDate == null,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    hintText: widget.hintText,
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
                    widget.selectedDate != null ? widget.formatter.format(widget.selectedDate!) : "",
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