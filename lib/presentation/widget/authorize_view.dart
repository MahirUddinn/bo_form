import 'package:flutter/material.dart';

class AuthorizeView extends StatefulWidget {
  const AuthorizeView({super.key});

  @override
  State<AuthorizeView> createState() => _AuthorizeViewState();
}

class _AuthorizeViewState extends State<AuthorizeView> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Authorize"),);
  }
}
