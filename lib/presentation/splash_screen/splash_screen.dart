//Author: Purushotham
//Created On: 04-04-2024

import 'package:code_land/presentation/login_screen/login_screen.dart';
import 'package:code_land/presentation/widgets/code_land_logo_widget.dart';
import 'package:code_land/utils/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Future.delayed(const Duration(seconds: 2), navigateToLoginScreen);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    super.dispose();
  }

  void navigateToLoginScreen() {
    context.pushReplacementTo(const LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(60)),
            boxShadow: [
              BoxShadow(color: Colors.black54, spreadRadius: 2, blurRadius: 6, offset: Offset(1, 5)),
            ],
          ),
          child: const Padding(
            padding: EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CodeLandLogoImage(),
                CodeLandTextualLogoImage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
