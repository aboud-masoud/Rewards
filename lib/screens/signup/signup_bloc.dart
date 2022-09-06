import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rewards_app/utils/shared_methods.dart';

enum signUpStatusEnum { faild, success, non, inProgress }

class SignUpBloc {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  ValueNotifier<bool> fieldsValidation = ValueNotifier<bool>(false);
  ValueNotifier<signUpStatusEnum> signupStatus = ValueNotifier<signUpStatusEnum>(signUpStatusEnum.non);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void validateFields() {
    if (emailController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (fullNameController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (passwordController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (repasswordController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (SharedMethods().checkEmailSantax(emailController.text)) {
      if (passwordController.text == repasswordController.text) {
        if (passwordController.text.length > 5) {
          fieldsValidation.value = true;
        } else {
          fieldsValidation.value = false;
        }
      } else {
        fieldsValidation.value = false;
      }
    } else {
      fieldsValidation.value = false;
    }
  }

  Future<bool> signUp() async {
    signupStatus.value = signUpStatusEnum.inProgress;
    final User? user;
    try {
      user = (await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;

      if (user != null) {
        signupStatus.value = signUpStatusEnum.success;

        print(user.email);
        print(user.uid);
        return true;
      } else {
        signupStatus.value = signUpStatusEnum.faild;
        return false;
      }
    } catch (error) {
      print("--" + error.toString());
      signupStatus.value = signUpStatusEnum.faild;
      return false;
    }
  }
}
