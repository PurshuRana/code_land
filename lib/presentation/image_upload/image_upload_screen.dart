/*Author: Purushotham
Created On: 06-04-2024*/

import 'dart:io';

import 'package:code_land/constants/assets_path_constants.dart';
import 'package:code_land/constants/ui_constants.dart';
import 'package:code_land/presentation/image_upload/image_preview_screen.dart';
import 'package:code_land/presentation/widgets/screen_padding.dart';
import 'package:code_land/utils/extensions/build_context_extensions.dart';
import 'package:code_land/utils/mixins/image_picker_mixin.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({super.key});

  @override
  State<ImageUploadScreen> createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> with ImagePickerMixin {
  ValueNotifier<File?> imageFileNotifier = ValueNotifier(null);

  @override
  void dispose() {
    imageFileNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: SafeArea(
          child: ScreenPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                    flex: 1,
                    child: ScreenPadding(
                        child: const Text(
                      "Upload a Image",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ))),
                Expanded(
                  flex: 12,
                  child: ValueListenableBuilder<File?>(
                    valueListenable: imageFileNotifier,
                    builder: (context,fileImage,child) {
                      return fileImage != null ? InkWell(
                        onTap: _onViewImage,
                          child:  Hero(
                              tag: fileImage.path,child: Image.file(fileImage)))  : child!;
                    },
                    child: DottedBorder(
                      borderPadding: const EdgeInsets.all(UiConstants.screenPadding / 2),
                      strokeWidth: 2,
                      color: const Color(0xFFC0C0C0),
                      dashPattern: const [6],
                      child: Center(child: Image.asset(AssetsPathConstants.imagePlaceholder)),
                    ),
                  ),
                ),
                const SizedBox(
                width: 0,
                height: 10,
                ),
                Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 1,
                            child: ElevatedButton(onPressed: _onUpload, child: const Text("Upload"))),
                        Spacer(flex: MediaQuery.orientationOf(context) == Orientation.portrait ? 1 :  2,),
                        Expanded(
                          flex: 1,
                          child: ValueListenableBuilder<File?>(
                              valueListenable: imageFileNotifier,
                              builder: (context,fileImage,child) {
                              return ElevatedButton(onPressed: fileImage != null ? _onViewImage : null, child: const Text("View"));
                            }
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onUpload() async {
    final imagePickerResult = await pickImage(context);
    if (imagePickerResult == null || !mounted) return;
    imageFileNotifier.value = File(imagePickerResult.path);
  }

  void _onViewImage() {
    context.navigateTo(ImagePreviewScreen(image: imageFileNotifier.value!));
  }
}
