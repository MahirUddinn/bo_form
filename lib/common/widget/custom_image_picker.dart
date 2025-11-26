import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as path;

class CustomImagePicker extends StatefulWidget {
  final void Function(File? image) onImagePicked;
  final File? initialImage;
  final String? Function(File?)? validator;
  final String title;

  const CustomImagePicker({
    super.key,
    required this.onImagePicked,
    this.initialImage,
    this.validator,
    required this.title,
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
            InkWell(
              onTap: () => _pickImage(field),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: _selectedImage == null
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.cloud_upload_outlined,
                            size: 52,
                            color: Colors.grey.shade500,
                          ),
                          SizedBox(height: 8),
                          Text(
                            widget.title,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "(Max. Image size: 591x709 px)",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: SizedBox(
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
                  style: TextStyle(color: Colors.red[900], fontSize: 12),
                ),
              ),

            SizedBox(height: 8),

            _selectedImage != null
                ? Container(
                    height: 70,
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "$fileSize | $formattedDate",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),

                        Icon(Icons.check_circle, color: Color(0xFF01D3B8), size: 20),

                        SizedBox(width: 10),

                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedImage = null;
                            });
                          },
                          child: Icon(
                            Icons.delete_outline,
                            color: Colors.grey.shade600,
                            size: 22,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        );
      },
    );
  }
}
