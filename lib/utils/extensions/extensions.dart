//Author: Purushotham
//Created On: 06-04-2024
import 'package:code_land/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

extension NumberExtension on num{
  /// Returns the percent of the screen width
  double get sWidth {
    if(navigatorKey.currentContext!.orientation == Orientation.portrait){
      return navigatorKey.currentContext!.width * this / 100;
    }
    return navigatorKey.currentContext!.width * this / 100;
  }

  /// Returns the percent of the screen height
  double get sHeight {
    if(navigatorKey.currentContext!.orientation == Orientation.portrait){
      return navigatorKey.currentContext!.height * this / 100;
    }
    return navigatorKey.currentContext!.height * this / 100;
  }

  /// Returns the SizedBox Widget with the specified height
  SizedBox get vSpace => SizedBox(height: toDouble(),);

  /// Returns the SizedBox Widget with the specified width
  SizedBox get hSpace => SizedBox(width: toDouble(),);
}