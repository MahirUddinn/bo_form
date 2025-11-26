import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isObscure;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onSaved,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:  TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),

         SizedBox(height: 6),

        Container(
          padding:  EdgeInsets.symmetric(vertical: 2),
          decoration: BoxDecoration(
            color:  Color(0xFFF1F1F1),
            borderRadius: BorderRadius.circular(14),
          ),

          child: TextFormField(
            controller: controller,
            obscureText: isObscure,
            keyboardType: keyboardType,
            validator: validator,
            onSaved: onSaved,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle:  TextStyle(color: Colors.grey, fontSize: 15),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12),
              ),

              contentPadding:  EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
