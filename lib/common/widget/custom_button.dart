import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onSubmit,
    required this.child,
    required this.color,
  });

  final VoidCallback onSubmit;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSubmit,
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
