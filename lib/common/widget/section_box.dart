import 'package:bo_acc_form/common/constants/app_sizes.dart';
import 'package:flutter/material.dart';

class SectionBox extends StatelessWidget {
  const SectionBox({super.key, required this.title, required this.child});

  final Widget? title;
  final Widget? child;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: AppSizes.mp4),
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Theme.of(context).disabledColor),
        borderRadius: BorderRadius.circular(AppSizes.br12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Theme.of(context).disabledColor,
            child: Container(
              margin: EdgeInsets.all(AppSizes.mp6),
              child: title,
            ),
          ),

          Container(child: child),
        ],
      ),
    );
  }
}
