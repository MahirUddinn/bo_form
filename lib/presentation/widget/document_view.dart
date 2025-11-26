import 'package:flutter/material.dart';

class DocumentView extends StatefulWidget {
  const DocumentView({super.key});

  @override
  State<DocumentView> createState() => _DocumentViewState();
}

class _DocumentViewState extends State<DocumentView> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Document"),);
  }
}
