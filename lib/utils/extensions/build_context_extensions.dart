//Author: Purushotham
//Created On: 04-04-2024
import 'package:code_land/presentation/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  Orientation get orientation => MediaQuery.of(this).orientation;

  double  percentScreenWidth(int percent) =>  orientation == Orientation.portrait ? width * percent / 100 : height * percent / 100;

  double percentScreenHeight(int percent) => orientation == Orientation.portrait ? height * percent / 100 : width * percent / 100;



  Future<T?> navigateTo<T>(Widget child) async {
    if (!mounted) return null;

    return Navigator.push<T>(this, MaterialPageRoute(builder: (context) => child));
  }

  Future<dynamic> pushReplacementTo(Widget child) async {
    if (!mounted) return;
    return Navigator.pushReplacement(
        this,
        MaterialPageRoute(
          builder: (context) => child,
        ));
  }

  void back<T>({T? returnData}) {
    if (!mounted) return;
    Navigator.pop(this, returnData);
  }

  void home() {
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(this, MaterialPageRoute(
      builder: (context) {
        return const LoginScreen();
      },
    ), (route) => false);
  }

  void removePrimaryFocus(){
    FocusManager.instance.primaryFocus?.unfocus();
  }
}