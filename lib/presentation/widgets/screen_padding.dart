//Author: Purushotham
//Created On: 04-04-2024

import 'package:code_land/constants/ui_constants.dart';
import 'package:flutter/material.dart';

class ScreenPadding extends StatelessWidget {
  ScreenPadding({super.key, required this.child, this.padding}) : edgeInsets = EdgeInsets.all(padding ?? UiConstants.screenPadding);
  ScreenPadding.horizontal({super.key, required this.child, this.padding}) : edgeInsets = EdgeInsets.symmetric(horizontal: padding ?? UiConstants.screenPadding);
  ScreenPadding.vertical({super.key, required this.child, this.padding}) : edgeInsets = EdgeInsets.symmetric(vertical: padding ?? UiConstants.screenPadding);
  final double? padding;
  final Widget child;
  final EdgeInsets edgeInsets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsets,
      child: child,
    );
  }
}
