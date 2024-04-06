/*Author: Purushotham
Created On: 06-04-2024*/
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

mixin ImagePickerMixin {
  ImagePicker imagePicker = ImagePicker();
  Future<XFile?> pickImage(BuildContext context) async {
    ImageSource? source = await showModalBottomSheet(
      context: context,
      useSafeArea: true,
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Select Image Source",
                  style: TextStyle(letterSpacing: 0.3, fontSize: 18, fontWeight: FontWeight.w800),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () => Navigator.pop(context, ImageSource.camera),
                  child: const Text(
                    "Camera",
                    textAlign: TextAlign.center,
                    style: TextStyle(letterSpacing: 0.2, fontSize: 16, height: 2.0, fontWeight: FontWeight.w600, color: Colors.blue),
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () => Navigator.pop(context, ImageSource.gallery),
                  child: const Text(
                    "Gallery",
                    textAlign: TextAlign.center,
                    style: TextStyle(letterSpacing: 0.2, height: 2.0, fontSize: 16, fontWeight: FontWeight.w600, color: Colors.blue),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        );
      },
    );
    if (source == null) return null;
    return await imagePicker.pickImage(source: source, imageQuality: 70, maxHeight: 1080, maxWidth: 1080);
  }
}
