import 'package:flutter/material.dart';

class SectionBox extends StatelessWidget {
  const SectionBox({super.key, required this.title, required this.child});

  final String title;
  final Widget? child;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Theme.of(context).disabledColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Theme.of(context).disabledColor,
            child: Container(
              margin: EdgeInsets.all(8),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),

          Container(child: child),
        ],
      ),
    );
  }
}
