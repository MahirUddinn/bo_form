import 'package:bo_acc_form/common/widget/custom_slider_toggle.dart';
import 'package:bo_acc_form/common/widget/section_box.dart';
import 'package:bo_acc_form/presentation/bloc/form_data/form_data_cubit.dart';
import 'package:bo_acc_form/presentation/widget/nominee_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bo_acc_form/common/widget/custom_date_picker.dart';
import 'package:bo_acc_form/common/widget/custom_check_selector.dart';
import 'package:bo_acc_form/common/widget/custom_dropdown.dart';
import 'package:bo_acc_form/common/widget/custom_text_field.dart';
import 'package:intl/intl.dart';

class NomineeView extends StatefulWidget {
  const NomineeView({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  State<NomineeView> createState() => _NomineeViewState();
}

class _NomineeViewState extends State<NomineeView> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormDataCubit, FormDataState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Form(
            key: widget.key,
            child: Column(
              children: [
                NomineeForm(),
              ],
            ),
          ),
        );
      },
    );
  }
}
