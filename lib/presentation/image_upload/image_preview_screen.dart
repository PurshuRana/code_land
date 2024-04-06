//Author: Purushotham
//Created On: 06-04-2024
import 'dart:io';

import 'package:flutter/material.dart';

class ImagePreviewScreen extends StatelessWidget {
  const ImagePreviewScreen({super.key, required this.image});
  final File image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(),
        backgroundColor: Colors.black26,
        elevation: 0,
      ),
        extendBodyBehindAppBar: true,
        body: Hero(
            tag: image.path,
            child: InteractiveViewer(child: Center(child: Image.file(image,fit: BoxFit.cover,)))));
  }
}
