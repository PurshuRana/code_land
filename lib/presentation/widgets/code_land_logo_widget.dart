//Author: Purushotham
//Created On: 04-04-2024
import 'package:code_land/constants/assets_path_constants.dart';
import 'package:flutter/material.dart';

class CodeLandLogoImage extends StatelessWidget {
  const CodeLandLogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsPathConstants.codeLandLogo);
  }
}

class CodeLandTextualLogoImage extends StatelessWidget {
  const CodeLandTextualLogoImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsPathConstants.codeLandtextualLogo);
  }
}
