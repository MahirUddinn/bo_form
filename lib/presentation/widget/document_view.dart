

import 'package:bo_acc_form/common/constants/app_sizes.dart';
import 'package:bo_acc_form/common/constants/app_strings.dart';
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
                    AppStrings.documentTitle,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppSizes.fs16),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(AppSizes.p16),
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
            context.read<FormDataCubit>().documentUpdateFirstApplicantPhoto(
              image,
            );
          },
          initialImage: documents.firstApplicantPhoto,
          title: AppStrings.firstApplicantPhoto,
          subtitle: AppStrings.photoSize,
          validator: (file) {
            if (file == null) return AppStrings.uploadPhotoError;
            return null;
          },
        ),
        CustomImagePicker(
          onImagePicked: (image) {
            context.read<FormDataCubit>().documentUpdateFirstApplicantNidFront(
              image,
            );
          },
          initialImage: documents.firstApplicantNidFront,
          title: AppStrings.firstApplicantNidFront,
          isRect: true,
          validator: (file) {
            if (file == null) return AppStrings.uploadNidFrontError;
            return null;
          },
        ),
        CustomImagePicker(
          onImagePicked: (image) {
            context.read<FormDataCubit>().documentUpdateFirstApplicantNidBack(
              image,
            );
          },
          initialImage: documents.firstApplicantNidBack,
          title: AppStrings.firstApplicantNidBack,
          isRect: true,
          validator: (file) {
            if (file == null) return AppStrings.uploadNidBackError;
            return null;
          },
        ),
        CustomImagePicker(
          onImagePicked: (image) {
            context.read<FormDataCubit>().documentUpdateFirstApplicantSignature(
              image,
            );
          },
          initialImage: documents.firstApplicantSignature,
          title: AppStrings.firstApplicantSignature,
          subtitle: AppStrings.signatureSize,
          isRect: true,
          validator: (file) {
            if (file == null) return AppStrings.uploadSignatureError;
            return null;
          },
        ),
        CustomImagePicker(
          onImagePicked: (image) {
            context
                .read<FormDataCubit>()
                .documentUpdateFirstApplicantTinCertificate(image);
          },
          initialImage: documents.firstApplicantTinCertificate,
          isRect: true,
          title: AppStrings.firstApplicantTin,
          validator: (file) {
            if (file == null) return AppStrings.uploadTinError;
            return null;
          },
        ),
        CustomImagePicker(
          onImagePicked: (image) {
            context
                .read<FormDataCubit>()
                .documentUpdateFirstApplicantBankStatement(image);
          },
          initialImage: documents.firstApplicantBankStatement,
          title: AppStrings.bankStatement,
          isRect: true,
          subtitle: AppStrings.micrCheque,
          validator: (file) {
            if (file == null) return AppStrings.uploadBankStatementError;
            return null;
          },
        ),
      ],
    );
  }
}
