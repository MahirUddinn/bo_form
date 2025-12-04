import 'package:flutter/material.dart';

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
          margin: EdgeInsets.only(top: 6),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Theme.of(context).disabledColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6),
              label != ""
                  ? RichText(
                      text: TextSpan(
                        text: label,
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
              SizedBox(height: 8),
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
                  padding: EdgeInsets.only(top: 6),
                  child: Text(
                    state.errorText!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 12,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
