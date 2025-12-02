import 'dart:io';

import 'package:bo_acc_form/common/widget/custom_image_picker.dart';
import 'package:bo_acc_form/common/widget/section_box.dart';
import 'package:bo_acc_form/domain/entities/document_enitity.dart';
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
    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) {
        final documents = state.documentEntity;

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
                    child: _buildDocumentsForm(documents),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDocumentsForm(DocumentEntity documents) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomImagePicker(
          onImagePicked: (image) {
            context.read<FormDataCubit>().documentUpdateFirstApplicantPhoto(image);
          },
          initialImage: documents.firstApplicantPhoto,
          title: "First Applicant (1st Holder) Photo",
          subtitle: "Image Size 591x709 pixel",
          validator: (file) {
            if (file == null) return 'Please upload a photo';
            return null;
          },
        ),
        CustomImagePicker(
          onImagePicked: (image) {
            context.read<FormDataCubit>().documentUpdateFirstApplicantNidFront(image);
          },
          initialImage: documents.firstApplicantNidFront,
          title: "First Applicant (1st Holder) NID/Passport/Driving Front Side",
          isRect: true,
          validator: (file) {
            if (file == null) return 'Please upload NID front side';
            return null;
          },
        ),
        CustomImagePicker(
          onImagePicked: (image) {
            context.read<FormDataCubit>().documentUpdateFirstApplicantNidBack(image);
          },
          initialImage: documents.firstApplicantNidBack,
          title: "First Applicant (1st Holder) NID/Passport/Driving Back Side",
          isRect: true,
          validator: (file) {
            if (file == null) return 'Please upload NID back side';
            return null;
          },
        ),
        CustomImagePicker(
          onImagePicked: (image) {
            context.read<FormDataCubit>().documentUpdateFirstApplicantSignature(image);
          },
          initialImage: documents.firstApplicantSignature,
          title: "Signature of First Applicant",
          subtitle: "(Image size 300x50 pixel)",
          isRect: true,
          validator: (file) {
            if (file == null) return 'Please upload signature';
            return null;
          },
        ),
        CustomImagePicker(
          onImagePicked: (image) {
            context.read<FormDataCubit>().documentUpdateFirstApplicantTinCertificate(image);
          },
          initialImage: documents.firstApplicantTinCertificate,
          isRect: true,
          title: "TIN Certificate of First Applicant (1st Holder)",
          validator: (file) {
            if (file == null) return 'Please upload TIN certificate';
            return null;
          },
        ),
        CustomImagePicker(
          onImagePicked: (image) {
            context.read<FormDataCubit>().documentUpdateFirstApplicantBankStatement(image);
          },
          initialImage: documents.firstApplicantBankStatement,
          title: "Bank Statement/Certificate/Cheque Copy",
          isRect: true,
          subtitle: "(Please use a MICR Cheque Leaf)",
          validator: (file) {
            if (file == null) return 'Please upload bank statement';
            return null;
          },
        ),
      ],
    );
  }
}