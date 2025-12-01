import 'package:bo_acc_form/presentation/bloc/form_data/form_data_cubit.dart';
import 'package:bo_acc_form/presentation/widget/nominee_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NomineeView extends StatelessWidget {
  const NomineeView({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: BlocBuilder<FormDataCubit, FormDataState>(
          builder: (context, state) {
            return Column(
              children: [
                NomineeForm(
                  key: const ValueKey('nominee_form_0'),
                  index: 0,
                  mode: 'primary',
                ),
                if (state.isSecondNomineeAvailable)
                  NomineeForm(
                    key: const ValueKey('nominee_form_1'),
                    index: 1,
                    mode: 'second',
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
