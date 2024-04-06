import 'package:code_land/constants/color_constants.dart';
import 'package:code_land/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

//Author: Purushotham
//Created On: 04-04-2024


void main() {
  runApp(const CodeLandApp());
}

class CodeLandApp extends StatelessWidget {
  const CodeLandApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
          primaryColor: ColorConstants.primaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.primaryColor),
          fontFamily: 'Poppins',
          inputDecorationTheme: const InputDecorationTheme(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4))
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorConstants.primaryColor,
              foregroundColor: Colors.white,
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              disabledBackgroundColor: ColorConstants.buttonDisabledColor,
              disabledForegroundColor: ColorConstants.buttonDisabledTextColor,
              textStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'Poppins')
            )
          )
      ),
      home: const SplashScreen(),
    );
  }
}

