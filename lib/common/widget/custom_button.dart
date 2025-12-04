import 'package:bo_acc_form/common/constants/app_sizes.dart';
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
    return GestureDetector(
      onTap: onSubmit,
      child: Container(
        padding: EdgeInsets.all(AppSizes.mp8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppSizes.br6),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
