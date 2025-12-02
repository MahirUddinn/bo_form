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
    return SingleChildScrollView(
      child: Form(
        key: widget.formKey,
        child: Column(
          children: [
            SectionBox(
              title: const Text(
                "Please Upload Your Necessary Document",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: _buildDocumentsForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDocumentsForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FirstApplicantPhotoPicker(),
        FirstApplicantNidFrontPicker(),
        FirstApplicantNidBackPicker(),
        FirstApplicantSignaturePicker(),
        FirstApplicantTinCertificatePicker(),
        FirstApplicantBankStatementPicker(),
      ],
    );
  }
}

// Individual widget components for DocumentView

class FirstApplicantPhotoPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
          previous.documentEntity.firstApplicantPhoto !=
          current.documentEntity.firstApplicantPhoto,
      builder: (context, state) {
        return CustomImagePicker(
          onImagePicked: (image) {
            context.read<FormDataCubit>().documentUpdateFirstApplicantPhoto(
              image,
            );
          },
          initialImage: state.documentEntity.firstApplicantPhoto,
          title: "First Applicant (1st Holder) Photo",
          subtitle: "Image Size 591x709 pixel",
          validator: (file) {
            if (file == null) return 'Please upload a photo';
            return null;
          },
        );
      },
    );
  }
}

class FirstApplicantNidFrontPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
          previous.documentEntity.firstApplicantNidFront !=
          current.documentEntity.firstApplicantNidFront,
      builder: (context, state) {
        return CustomImagePicker(
          onImagePicked: (image) {
            context.read<FormDataCubit>().documentUpdateFirstApplicantNidFront(
              image,
            );
          },
          initialImage: state.documentEntity.firstApplicantNidFront,
          title: "First Applicant (1st Holder) NID/Passport/Driving Front Side",
          isRect: true,
          validator: (file) {
            if (file == null) return 'Please upload NID front side';
            return null;
          },
        );
      },
    );
  }
}

class FirstApplicantNidBackPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
          previous.documentEntity.firstApplicantNidBack !=
          current.documentEntity.firstApplicantNidBack,
      builder: (context, state) {
        return CustomImagePicker(
          onImagePicked: (image) {
            context.read<FormDataCubit>().documentUpdateFirstApplicantNidBack(
              image,
            );
          },
          initialImage: state.documentEntity.firstApplicantNidBack,
          title: "First Applicant (1st Holder) NID/Passport/Driving Back Side",
          isRect: true,
          validator: (file) {
            if (file == null) return 'Please upload NID back side';
            return null;
          },
        );
      },
    );
  }
}

class FirstApplicantSignaturePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
          previous.documentEntity.firstApplicantSignature !=
          current.documentEntity.firstApplicantSignature,
      builder: (context, state) {
        return CustomImagePicker(
          onImagePicked: (image) {
            context.read<FormDataCubit>().documentUpdateFirstApplicantSignature(
              image,
            );
          },
          initialImage: state.documentEntity.firstApplicantSignature,
          title: "Signature of First Applicant",
          subtitle: "(Image size 300x50 pixel)",
          isRect: true,
          validator: (file) {
            if (file == null) return 'Please upload signature';
            return null;
          },
        );
      },
    );
  }
}

class FirstApplicantTinCertificatePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
          previous.documentEntity.firstApplicantTinCertificate !=
          current.documentEntity.firstApplicantTinCertificate,
      builder: (context, state) {
        return CustomImagePicker(
          onImagePicked: (image) {
            context
                .read<FormDataCubit>()
                .documentUpdateFirstApplicantTinCertificate(image);
          },
          initialImage: state.documentEntity.firstApplicantTinCertificate,
          isRect: true,
          title: "TIN Certificate of First Applicant (1st Holder)",
          validator: (file) {
            if (file == null) return 'Please upload TIN certificate';
            return null;
          },
        );
      },
    );
  }
}

class FirstApplicantBankStatementPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      buildWhen: (previous, current) =>
          previous.documentEntity.firstApplicantBankStatement !=
          current.documentEntity.firstApplicantBankStatement,
      builder: (context, state) {
        return CustomImagePicker(
          onImagePicked: (image) {
            context
                .read<FormDataCubit>()
                .documentUpdateFirstApplicantBankStatement(image);
          },
          initialImage: state.documentEntity.firstApplicantBankStatement,
          title: "Bank Statement/Certificate/Cheque Copy",
          isRect: true,
          subtitle: "(Please use a MICR Cheque Leaf)",
          validator: (file) {
            if (file == null) return 'Please upload bank statement';
            return null;
          },
        );
      },
    );
  }
}
