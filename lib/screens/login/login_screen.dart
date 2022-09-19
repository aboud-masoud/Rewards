import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:rewards_app/app.dart';
import 'package:rewards_app/models/authentication_models.dart';
import 'package:rewards_app/screens/login/login_bloc.dart';
import 'package:rewards_app/screens/mainContainer/main_container.dart';
import 'package:rewards_app/screens/signup/signup_faze1.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:rewards_app/utils/network_info_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _bloc = LoginBloc();

  @override
  void initState() {
    _bloc.onInitBiometric(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: _bloc.buildController.stream,
        builder: (context, snapshot) {
          return Scaffold(
              body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () async {
                            await _bloc.refreshAppWithLanguageCode(context,
                                languageSelected.value == "en" ? "ar" : "en");
                          },
                          child: ValueListenableBuilder<String>(
                              valueListenable: languageSelected,
                              builder: (context, snapshot, child) {
                                return CustomText(
                                    title:
                                        snapshot == "en" ? "عربي" : "English",
                                    style: CustomTextStyle().bold(
                                        size: 18,
                                        color: const Color(0xff419aff)));
                              }))),
                  Image.asset(
                    "assets/images/logo.png",
                    width: 72,
                  ),
                  const SizedBox(height: 10),
                  CustomText(
                    title: AppLocalizations.of(context)!.amwajCenter,
                    style: CustomTextStyle()
                        .bold(size: 18, color: const Color(0xff3bbc28)),
                  ),
                  const SizedBox(height: 5),
                  CustomText(
                    title: AppLocalizations.of(context)!.amwajCentersubtitle,
                    style: CustomTextStyle()
                        .bold(size: 12, color: const Color(0xff707070)),
                  ),
                  const SizedBox(height: 50),
                  CustomText(
                    title: AppLocalizations.of(context)!.welcomeback,
                    style: CustomTextStyle()
                        .bold(size: 24, color: const Color(0xff3bbc28)),
                  ),
                  const SizedBox(height: 14),
                  CustomText(
                    title: AppLocalizations.of(context)!.loginmessage,
                    style: CustomTextStyle()
                        .bold(size: 16, color: const Color(0xff707070)),
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    controller: _bloc.emailController,
                    hintText: AppLocalizations.of(context)!.email_hint,
                    prefixIcon: const Icon(Icons.email),
                    onChange: (value) => _bloc.validateFields(),
                  ),
                  const SizedBox(height: 12),
                  ValueListenableBuilder<bool>(
                      valueListenable: _bloc.showPasswordLetters,
                      builder: (context, snapshot, child) {
                        return CustomTextField(
                          controller: _bloc.passwordController,
                          hintText: AppLocalizations.of(context)!.password,
                          obscureText: snapshot,
                          prefixIcon: const Icon(Icons.password),
                          suffixIcon: IconButton(
                              icon: Image.asset(
                                "assets/images/hidePassword.png",
                                width: 20,
                              ),
                              onPressed: () {
                                _bloc.showPasswordLetters.value =
                                    !_bloc.showPasswordLetters.value;
                              }),
                          onChange: (value) => _bloc.validateFields(),
                        );
                      }),
                  const SizedBox(height: 16),
                  ValueListenableBuilder<bool>(
                      valueListenable: _bloc.fieldsValidation,
                      builder: (context, snapshot, child) {
                        return CustomButtonWidget(
                          title: AppLocalizations.of(context)!.signinButton,
                          enable: snapshot,
                          widthSize: MediaQuery.of(context).size.width,
                          onPress: () async {
                            if (await NetworkInfoService().isConnected()) {
                              await _bloc
                                  .signInWithEmailAndPassword(
                                      context: context,
                                      email: _bloc.emailController.text,
                                      password: _bloc.passwordController.text)
                                  .then((value) {
                                if (value) {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(builder: (ctx) {
                                    return const MainContainer();
                                  }), (route) => false);
                                }
                              });
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(AppLocalizations.of(context)!
                                    .checkInternetConnection),
                              ));
                            }
                          },
                        );
                      }),
                  ValueListenableBuilder<AuthenticationBiometricType>(
                      valueListenable: _bloc.biometricResultNotifier,
                      builder: (context, snapshot, child) {
                        return (snapshot.isAvailable && _bloc.biometricStatus)
                            ? biometricButton(context, snapshot.type)
                            : Container();
                      }),
                  const SizedBox(height: 20),
                  ValueListenableBuilder<LoginStatusEnum>(
                      valueListenable: _bloc.loginStatus,
                      builder: (context, snapshot, child) {
                        if (snapshot == LoginStatusEnum.faild) {
                          return Text(
                              AppLocalizations.of(context)!
                                  .errorInEmailOrPassword,
                              style: CustomTextStyle()
                                  .regular(color: Colors.red, size: 16));
                        } else if (snapshot == LoginStatusEnum.inProgress) {
                          return const CircularProgressIndicator();
                        } else {
                          return Container();
                        }
                      }),
                  const SizedBox(height: 30),
                  TextButton(
                    onPressed: () async {
                      if (await NetworkInfoService().isConnected()) {
                        _bloc.biometricStatus = false;
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) {
                            return const SignupFaze1Screen();
                          }),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(AppLocalizations.of(context)!
                              .checkInternetConnection),
                        ));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.donthaveanaccount,
                          style: CustomTextStyle().semibold(
                              size: 14, color: const Color(0xff404040)),
                        ),
                        Text(
                          AppLocalizations.of(context)!.signup,
                          style: CustomTextStyle().semibold(
                              size: 14, color: const Color(0xff3bbc28)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
        });
  }

  Padding biometricButton(BuildContext context, BiometricType? biometricType) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 16, right: 16),
      child: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Container(
                      height: 1,
                      color: const Color(0xff3bbc28),
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  color: Colors.white,
                  width: 30,
                  child: Center(
                    child: CustomText(
                      title: AppLocalizations.of(context)!.or,
                      style: CustomTextStyle()
                          .medium(color: const Color(0xff8F8F8F), size: 12),
                      shouldFit: false,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Container(
            height: 60,
            decoration: const BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xffFFFFFF),
                  ),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      side: const BorderSide(color: Color(0xffE8E8E8)),
                    ),
                  )),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: CustomText(
                      title: AppLocalizations.of(context)!.login_biometric,
                      style: CustomTextStyle()
                          .medium(color: const Color(0xff191C1F), size: 14),
                      shouldFit: false,
                    ),
                  ),
                  Image.asset(
                    (biometricType == BiometricType.face)
                        ? 'assets/images/face_id.png'
                        : 'assets/images/touch_id.png',
                    height: 30,
                    color: const Color(0xff191C1F),
                    alignment: Alignment.center,
                  ),
                ],
              ),
              onPressed: () async {
                await _bloc.tryToAuthintecateUserByBiometric(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
