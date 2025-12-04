import 'dart:io';
import 'package:bo_acc_form/common/constants/app_ui_const.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

class CustomImagePicker extends StatefulWidget {
  final void Function(File? image) onImagePicked;
  final File? initialImage;
  final String? Function(File?)? validator;
  final String title;
  final String subtitle;
  final bool isRect;

  const CustomImagePicker({
    super.key,
    required this.onImagePicked,
    this.initialImage,
    this.validator,
    this.title = "",
    this.subtitle = "",
    this.isRect = false
  });

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  File? _selectedImage;
  late final fileName = path.basename(_selectedImage!.path);
  late final fileSize =
      "${(_selectedImage!.lengthSync() / 1024).toStringAsFixed(0)}kb";
  final formattedDate = DateFormat("dd/MM/yy hh:mma").format(DateTime.now());

  @override
  void initState() {
    super.initState();
    _selectedImage = widget.initialImage;
  }

  Future<void> _pickImage(FormFieldState<File?> field) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
    );

    if (picked == null) return;

    final file = File(picked.path);

    setState(() {
      _selectedImage = file;
    });

    field.didChange(file);

    widget.onImagePicked(file);
  }

  @override
  Widget build(BuildContext context) {
    return FormField<File?>(
      validator: widget.validator,
      initialValue: _selectedImage,
      builder: (field) {
        final hasError = field.hasError;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                _pickImage(field);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: _selectedImage == null
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.cloud_upload_outlined,
                            size: 52,
                            color: Theme.of(context).hintColor,
                          ),
                          SizedBox(height: 8),
                          Text(
                            widget.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Theme.of(
                                context,
                              ).textTheme.bodyLarge?.color,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            widget.subtitle,
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child:
                        widget.isRect?
                        SizedBox(
                          height: 120,
                          width: 220,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.file(
                              _selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ):
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.file(
                              _selectedImage!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
              ),
            ),
            if (hasError)
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 4),
                child: Text(
                  field.errorText!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 12,
                  ),
                ),
              ),

            SizedBox(height: 8),

            _selectedImage != null
                ? Container(
                    height: 70,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.file(
                            _selectedImage!,
                            width: 40,
                            height: 40,
                            fit: BoxFit.cover,
                          ),
                        ),

                        SizedBox(width: 10),

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                fileName,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Theme.of(
                                    context,
                                  ).textTheme.bodyLarge?.color,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "$fileSize | $formattedDate",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Icon(
                          Icons.check_circle,
                          color: AppUiConst.successColor,
                          size: 20,
                        ),

                        SizedBox(width: 10),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedImage = null;
                            });
                          },
                          child: Icon(
                            Icons.delete_outline,
                            color: Theme.of(context).hintColor,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
            SizedBox(height: 8,)
          ],
        );
      },
    );
  }
}
