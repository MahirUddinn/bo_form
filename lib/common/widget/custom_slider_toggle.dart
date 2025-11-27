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
    this.validator,this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;
    return FormField<bool>(
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
            const SizedBox(height: 8),
            Row(
              children: [
                Switch(
                  value: state.value ?? false,
                  onChanged: (value) {
                    state.didChange(value);
                    onChanged(value);
                  },

                  activeThumbColor: Theme.of(context).primaryColor,
                  inactiveThumbColor: Theme.of(context).disabledColor,
                  activeTrackColor: Colors.transparent,
                  inactiveTrackColor: Colors.transparent,

                  trackOutlineColor: WidgetStateProperty.resolveWith<Color?>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.selected)) {
                      return Theme.of(context).primaryColor;
                    }
                    return Theme.of(context).disabledColor;
                  }),

                  trackOutlineWidth: WidgetStateProperty.all(1.5),
                ),
              ],
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(
                  state.errorText!,
                  style: const TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
          ],
        );
      },
    );
  }
}
