import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum loginStatusEnum { faild, success, non, inProgress }

class LoginBloc {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ValueNotifier<bool> fieldsValidation = ValueNotifier<bool>(false);
  ValueNotifier<loginStatusEnum> loginStatus = ValueNotifier<loginStatusEnum>(loginStatusEnum.non);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void validateFields() {
    loginStatus.value = loginStatusEnum.non;

    if (emailController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (passwordController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (_checkEmailSantax(emailController.text)) {
      fieldsValidation.value = true;
    } else {
      fieldsValidation.value = false;
    }
  }

  bool _checkEmailSantax(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  Future<bool> signInWithEmailAndPassword() async {
    loginStatus.value = loginStatusEnum.inProgress;
    final User? user;
    try {
      user = (await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;

      if (user != null) {
        loginStatus.value = loginStatusEnum.success;

        print(user.email);
        print(user.uid);
        return true;
      } else {
        loginStatus.value = loginStatusEnum.faild;
        return false;
      }
    } catch (error) {
      print("--" + error.toString());
      loginStatus.value = loginStatusEnum.faild;
      return false;
    }
  }
}
