//Author: Purushotham
//Created On: 04-04-2024

import 'dart:ui';

import 'package:code_land/constants/ui_constants.dart';
import 'package:code_land/presentation/image_upload/image_upload_screen.dart';
import 'package:code_land/presentation/widgets/code_land_logo_widget.dart';
import 'package:code_land/presentation/widgets/screen_padding.dart';
import 'package:code_land/utils/extensions/build_context_extensions.dart';
import 'package:code_land/utils/extensions/extensions.dart';
import 'package:code_land/utils/mixins/validations_mixin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'widgets/login_form.dart';
part 'widgets/login_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: ScreenPadding.horizontal(
            child: OrientationBuilder(builder: (context, orientation) {
              switch (orientation) {
                case Orientation.portrait:
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 36.sHeight, child: const _LoginHeaderView()),
                        const _LoginFormView(),
                        5.sHeight.vSpace,
                        const _AssistanceContactDetailsWidget(),
                      ],
                    ),
                  );
                case Orientation.landscape:
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 70.sHeight,
                          child: const Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Center(child: _LoginHeaderView()),
                              ),
                              Expanded(
                                flex: 3,
                                child: FractionallySizedBox(
                                  widthFactor: 0.8,
                                  child: Center(
                                    child: _LoginFormView(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const _AssistanceContactDetailsWidget(),
                      ],
                    ),
                  );
              }
            }),
          ),
        ),
        bottomNavigationBar: const _VersionInfoWidget(),
      ),
    );
  }
}

class _AssistanceContactDetailsWidget extends StatelessWidget {
  const _AssistanceContactDetailsWidget();

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      runSpacing: UiConstants.screenPadding / 4,
      spacing: UiConstants.screenPadding,
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      children: [
        Text("For Assistance & Login Details Contact: "),
        _RichTextView(textOne: "English, Kannada & Telugu :  ", textTwo: "7406333800"),
        _RichTextView(textOne: "English, Kannada & Hindi    :  ", textTwo: "9071386515"),
      ],
    );
  }
}

class _VersionInfoWidget extends StatelessWidget {
  const _VersionInfoWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: UiConstants.screenPadding, vertical: UiConstants.screenPadding * (context.orientation == Orientation.portrait ? 2 : 1)),
      child: const Text(
        "v1.7 © 2023, Codeland Infosolutions Pvt Ltd.",
        textAlign: TextAlign.center,
      ),
    );
  }
}

class _RichTextView extends StatelessWidget {
  const _RichTextView({required this.textOne, required this.textTwo});
  final String textOne;
  final String textTwo;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: textOne,
        children: [
          TextSpan(
              text: textTwo,
              style: TextStyle(
                color: context.colorScheme.primary,
              ))
        ],
      ),
    );
  }
}
