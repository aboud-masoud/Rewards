import 'package:flutter/material.dart';
import 'package:rewards_app/screens/login/login_bloc.dart';
import 'package:rewards_app/screens/mainContainer/main_container.dart';
import 'package:rewards_app/screens/signup/signup_screen.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:rewards_app/utils/network_info_service.dart';

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
            ValueListenableBuilder<bool>(
                valueListenable: _bloc.showPasswordLetters,
                builder: (context, snapshot, child) {
                  return CustomTextField(
                    controller: _bloc.passwordController,
                    hintText: AppLocalizations.of(context)!.password,
                    obscureText: snapshot,
                    errorMessage: "",
                    prefixIcon: const Icon(Icons.password),
                    suffixIcon: IconButton(
                        icon: Image.asset(
                          "assets/images/hidePassword.png",
                          width: 20,
                        ),
                        onPressed: () {
                          _bloc.showPasswordLetters.value = !_bloc.showPasswordLetters.value;
                        }),
                    onChange: (value) => _bloc.validateFields(),
                  );
                }),
            ValueListenableBuilder<bool>(
                valueListenable: _bloc.fieldsValidation,
                builder: (context, snapshot, child) {
                  return CustomButtonWidget(
                    title: AppLocalizations.of(context)!.signinButton,
                    enable: snapshot,
                    onPress: () async {
                      if (await NetworkInfoService().isConnected()) {
                        await _bloc.signInWithEmailAndPassword().then((value) {
                          if (value) {
                            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) {
                              return const MainContainer();
                            }), (route) => false);
                          }
                        });
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(AppLocalizations.of(context)!.checkInternetConnection),
                        ));
                      }
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
                }),
            const SizedBox(height: 30),
            TextButton(
                onPressed: () async {
                  if (await NetworkInfoService().isConnected()) {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) {
                        return SignUpScreen();
                      }),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(AppLocalizations.of(context)!.checkInternetConnection),
                    ));
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.donthaveanaccount,
                      style: CustomTextStyle().medium(size: 18, color: const Color(0xff404040)),
                    ),
                    Text(
                      AppLocalizations.of(context)!.signup,
                      style: CustomTextStyle().medium(size: 18, color: const Color(0xff3bbc28)),
                    ),
                  ],
                ))
          ],
        ),
      ),
    ));
  }
}
