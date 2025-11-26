import 'package:flutter/material.dart';

class BankInfoView extends StatefulWidget {
  const BankInfoView({super.key});

  @override
  State<BankInfoView> createState() => _BankInfoViewState();
}

class _BankInfoViewState extends State<BankInfoView> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("bank info"),);
  }
}
