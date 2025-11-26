import 'package:flutter/material.dart';

class NomineeView extends StatefulWidget {
  const NomineeView({super.key});

  @override
  State<NomineeView> createState() => _NomineeViewState();
}

class _NomineeViewState extends State<NomineeView> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Nominee"),);
  }
}
