//Author: Purushotham
//Created On: 06-04-2024

part of '../login_screen.dart';

class _LoginHeaderView extends StatelessWidget {
  const _LoginHeaderView();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(height: context.orientation == Orientation.portrait ? 6.sHeight : 15.sHeight, child: const CodeLandTextualLogoImage()),
        SizedBox(height: context.orientation == Orientation.portrait ? 20.sHeight : 30.sHeight, child: const CodeLandLogoImage()),
        const SizedBox(
          width: 0,
          height: 10,
        ),
        SizedBox(
          height: 45,
          width: 200,
          child: Stack(
            fit: StackFit.loose,
            children: [
              const Text(
                "Biomedical  Kiosk",
                textScaler: TextScaler.noScaling,
                maxLines: 1,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "or HCE's",
                    style: TextStyle(color: context.theme.primaryColor, fontSize: 12),
                  ))
            ],
          ),
        )
        // const Center(
        //   child: _RichTextView(
        //     textOne: "Biomedical  Kiosk",
        //     textTwo: "\nfor HCE's ",
        //     textAlign: TextAlign.right,
        //   ),
        // )
      ],
    );
  }
}
