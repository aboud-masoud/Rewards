import 'package:flutter/material.dart';
import 'package:rewards_app/screens/login/login_bloc.dart';
import 'package:rewards_app/screens/mainContainer/main_container.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset(
              "assets/images/logo.jpg",
              width: 300,
            ),
            const SizedBox(height: 20),
            CustomTextField(
              controller: _bloc.emailController,
              hintText: AppLocalizations.of(context)!.email_hint,
              errorMessage: "",
              prefixIcon: const Icon(Icons.email),
              onChange: (value) => _bloc.validateFields(),
            ),
            CustomTextField(
              controller: _bloc.passwordController,
              hintText: AppLocalizations.of(context)!.password,
              obscureText: true,
              errorMessage: "",
              prefixIcon: const Icon(Icons.password),
              onChange: (value) => _bloc.validateFields(),
            ),
            ValueListenableBuilder<bool>(
                valueListenable: _bloc.fieldsValidation,
                builder: (context, snapshot, child) {
                  return CustomButtonWidget(
                    title: "Submit",
                    enable: snapshot,
                    onPress: () async {
                      await _bloc.signInWithEmailAndPassword().then((value) {
                        if (value) {
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) {
                            return const MainContainer();
                          }), (route) => false);
                        }
                      });
                    },
                  );
                }),
            ValueListenableBuilder<loginStatusEnum>(
                valueListenable: _bloc.loginStatus,
                builder: (context, snapshot, child) {
                  if (snapshot == loginStatusEnum.faild) {
                    return Text("Error in Email or password", style: CustomTextStyle().regular(color: Colors.red, size: 18));
                  } else if (snapshot == loginStatusEnum.inProgress) {
                    return const CircularProgressIndicator();
                  } else {
                    return Container();
                  }
                })
          ],
        ),
      ),
    ));
  }
}
