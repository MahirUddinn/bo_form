import 'package:flutter/material.dart';

class CustomStyledDropdown extends StatelessWidget {
  final String labelText;
  final String hintText;
  final List<String> values;
  final String? selectedValue;
  final void Function(String?) onChanged;
  final String? Function(String?)? validator;

  const CustomStyledDropdown({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.values,
    required this.onChanged,
    this.selectedValue,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),

        SizedBox(height: 6),

        Container(
          padding: EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
          ),

          child: DropdownButtonFormField<String>(
            initialValue: selectedValue,
            validator: validator,
            dropdownColor: Colors.white,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),

              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),

            icon: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Colors.grey,
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
