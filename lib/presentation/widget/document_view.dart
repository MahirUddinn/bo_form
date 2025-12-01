import 'dart:io';

import 'package:bo_acc_form/common/widget/custom_image_picker.dart';
import 'package:bo_acc_form/common/widget/section_box.dart';
import 'package:bo_acc_form/presentation/bloc/form_data/form_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DocumentView extends StatefulWidget {
  const DocumentView({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  State<DocumentView> createState() => _DocumentViewState();
}

class _DocumentViewState extends State<DocumentView> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            SectionBox(
              title: Text(
                "Please Upload Your Necessary Document",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                child: _buildDocumentsForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildDocumentsForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImagePicker(
          onImagePicked: (image) {
            context.read<FormDataCubit>().documentUpdateFirstApplicantPhoto(image);
          },
          title: "First Applicant (1st Holder) Photo",
          subtitle: "Image Size 591x709 pixel",
        ),
        CustomImagePicker(
          onImagePicked: (image) {
            context.read<FormDataCubit>().documentUpdateFirstApplicantNidFront(image);
          },
          title: "First Applicant (1st Holder) NID/Passport/Driving Front Side",
          isRect: true,
        ),
        CustomImagePicker(
          onImagePicked: (image) {
            context.read<FormDataCubit>().documentUpdateFirstApplicantNidBack(image);
          },
          title: "First Applicant (1st Holder) NID/Passport/Driving Back Side",
          isRect: true,
        ),
        CustomImagePicker(
          onImagePicked: (image) {
            context.read<FormDataCubit>().documentUpdateFirstApplicantSignature(image);
          },
          title: "Signature of First Applicant",
          subtitle: "(Image size 300x50 pixel)",
        ),
        CustomImagePicker(
          onImagePicked: (image) {
            context.read<FormDataCubit>().documentUpdateFirstApplicantTinCertificate(image);
          },
          title: "TIN Certificate of First Applicant (1st Holder)",
        ),
        CustomImagePicker(
          onImagePicked: (image) {
            context.read<FormDataCubit>().documentUpdateFirstApplicantBankStatement(image);
          },
          title: "Bank Statement/Certificate/Cheque Copy",
          subtitle: "(Please use a MICR Cheque Leaf)",
        ),

      ],
    );
  }
}
