import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rewards_app/app.dart';
import 'package:rewards_app/models/authentication_models.dart';
import 'package:rewards_app/screens/mainContainer/main_container.dart';
import 'package:rewards_app/utils/app_constants.dart';
import 'package:rewards_app/utils/authentication_service.dart';
import 'package:rewards_app/utils/global_value.dart';
import 'package:rewards_app/utils/shared_methods.dart';

enum LoginStatusEnum { faild, success, non, inProgress }

class LoginBloc {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ValueNotifier<bool> fieldsValidation = ValueNotifier<bool>(false);
  ValueNotifier<LoginStatusEnum> loginStatus =
      ValueNotifier<LoginStatusEnum>(LoginStatusEnum.non);

  ValueNotifier<bool> showPasswordLetters = ValueNotifier<bool>(false);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late bool biometricStatus;
  ValueNotifier<AuthenticationBiometricType> biometricResultNotifier =
      ValueNotifier<AuthenticationBiometricType>(
          AuthenticationBiometricType(isAvailable: false, type: null));
  StreamController<bool> buildController = StreamController<bool>.broadcast();
  final storage = FlutterSecureStorage();

  void validateFields() {
    loginStatus.value = LoginStatusEnum.non;

    if (emailController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (passwordController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (SharedMethods().checkEmailSantax(emailController.text)) {
      fieldsValidation.value = true;
    } else {
      fieldsValidation.value = false;
    }
  }

  Future<bool> signInWithEmailAndPassword(
      {required BuildContext context,
      required String email,
      required String password}) async {
    loginStatus.value = LoginStatusEnum.inProgress;
    final User? user;
    try {
      user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      if (user != null) {
        loginStatus.value = LoginStatusEnum.success;
        await _saveValuesInMemory(
            userName: email, password: password, uid: user.uid);
        print(user.email);
        userEmail = user.email!;

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (ctx) {
          return const MainContainer();
        }), (route) => false);

        return true;
      } else {
        loginStatus.value = LoginStatusEnum.faild;
        return false;
      }
    } catch (error) {
      print("--" + error.toString());
      loginStatus.value = LoginStatusEnum.faild;
      return false;
    }
  }

  Future<void> onInitBiometric(BuildContext context) async {
    String biometricU = await storage.read(key: AppConstants.biometricU) ?? "";
    String biometricP = await storage.read(key: AppConstants.biometricP) ?? "";

    biometricStatus = biometricP.isNotEmpty && biometricU.isNotEmpty;

    if (await _checkAuthentication(Theme.of(context).platform)) {
      SchedulerBinding.instance.addPostFrameCallback((_) async {
        Future.delayed(
          const Duration(milliseconds: 500),
          () async {
            if (biometricStatus) {
              await tryToAuthintecateUserByBiometric(context);
            }
          },
        );
      });
    }
  }

  Future<bool> _checkAuthentication(TargetPlatform platform) async {
    if (await AuthenticationService().isBiometricAvailable()) {
      biometricResultNotifier.value =
          await (AuthenticationService().getAvailableBiometricTypes(platform));
      buildController.sink.add(true);
      return true;
    }
    return false;
  }

  Future<bool> tryToAuthintecateUserByBiometric(BuildContext context) async {
    final authenticationService = AuthenticationService();

    if (await authenticationService.isBiometricAvailable()) {
      if (await authenticationService
          .shouldAllowBiometricAuthenticationToContinue(
              Theme.of(context).platform)) {
        // continue with authentication
        final authentication = await authenticationService
            .authenticateUser("Please use your biometric signature");
        if (authentication.success) {
          var biometricU =
              await storage.read(key: AppConstants.biometricU) ?? "";
          var biometricP =
              await storage.read(key: AppConstants.biometricP) ?? "";

          return await signInWithEmailAndPassword(
              context: context, email: biometricU, password: biometricP);
        }
      }
    }

    return false;
  }

  Future<void> _saveValuesInMemory(
      {required String userName,
      required String password,
      required String uid}) async {
    await storage.deleteAll();

    await storage.write(key: AppConstants.biometricU, value: userName);
    await storage.write(key: AppConstants.biometricP, value: password);
    await storage.write(key: AppConstants.uid, value: uid);
    await storage.write(key: AppConstants.deviceLanguage, value: "en");
  }

  Future refreshAppWithLanguageCode(BuildContext context, String code) async {
    await storage.write(key: AppConstants.deviceLanguage, value: code);
    languageSelected.value = code;
    MyApp.of(context)!.setLocale(Locale.fromSubtags(languageCode: code));
  }
}
