//Author: Purushotham
//Created On: 06-04-2024

part of '../login_screen.dart';

class _LoginHeaderView extends StatelessWidget {
  const _LoginHeaderView();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(flex: 1, child: CodeLandTextualLogoImage()),
        Expanded(flex: 3, child: CodeLandLogoImage()),
        SizedBox(
          width: 0,
          height: 10,
        ),
        Center(
          child: _RichTextView(
            textOne: "Biomedical  Kiosk",
            textTwo: "\nfor HCE's ",
            textAlign: TextAlign.right,
          ),
        )
      ],
    );
  }
}