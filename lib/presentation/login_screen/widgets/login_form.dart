//Author: Purushotham
//Created On: 06-04-2024
part of '../login_screen.dart';

class _LoginFormView extends StatefulWidget {
  const _LoginFormView();

  @override
  State<_LoginFormView> createState() => _LoginFormViewState();
}

class _LoginFormViewState extends State<_LoginFormView> with ValidationsMixin {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenPadding(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                controller: userNameController,
                validator: validateLoginUserName,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onTapOutside: (event) => context.removePrimaryFocus(),
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "Username",
                ),
              ),
              const SizedBox(width: 0, height: UiConstants.screenPadding),
              TextFormField(
                controller: passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onTapOutside: (event) => context.removePrimaryFocus(),
                validator: validateLoginPassword,
                decoration: const InputDecoration(
                  labelText: "Password",
                ),
              ),
              const SizedBox(width: 0, height: UiConstants.screenPadding * 2),
              ElevatedButton(
                onPressed: _onLogin,
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(context.width, 55),
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                    )),
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLogin() {
    if (!(formKey.currentState?.validate() ?? false)) return;
    context.pushReplacementTo(const ImageUploadScreen());
  }
}
