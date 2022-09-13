import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum signUpStatusEnum { faild, success, non, inProgress }

class SignUpBloc {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController usedLanguageController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController parentOcupationController = TextEditingController();
  TextEditingController hisrankController = TextEditingController();
  TextEditingController kinshipController = TextEditingController();
  TextEditingController foundCountactController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  ValueNotifier<bool> fieldsValidation = ValueNotifier<bool>(false);
  ValueNotifier<signUpStatusEnum> signupStatus = ValueNotifier<signUpStatusEnum>(signUpStatusEnum.non);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // var stepNumber = 1;
  ValueNotifier<int> stepNumberNotifier = ValueNotifier<int>(1);

  final CollectionReference _profiles = FirebaseFirestore.instance.collection('profiles');

  void validateFields() {
    // if (emailController.text.isEmpty) {
    //   fieldsValidation.value = false;
    // } else if (fullNameController.text.isEmpty) {
    //   fieldsValidation.value = false;
    // } else if (passwordController.text.isEmpty) {
    //   fieldsValidation.value = false;
    // } else if (repasswordController.text.isEmpty) {
    //   fieldsValidation.value = false;
    // } else if (SharedMethods().checkEmailSantax(emailController.text)) {
    //   if (passwordController.text == repasswordController.text) {
    //     if (passwordController.text.length > 5) {
    fieldsValidation.value = true;
    //     } else {
    //       fieldsValidation.value = false;
    //     }
    //   } else {
    //     fieldsValidation.value = false;
    //   }
    // } else {
    //   fieldsValidation.value = false;
    // }
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

        await _profiles.doc(user.uid).set({"full name": fullNameController.text});

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

  double valueOfProgressBar() {
    switch (stepNumberNotifier.value) {
      case 1:
        return 0.25;
      case 2:
        return 0.5;
      case 3:
        return 0.75;
      default:
        return 1;
    }
  }

  String returnCorrectStepImage() {
    switch (stepNumberNotifier.value) {
      case 1:
        return "profil.png";
      case 2:
        return "calendar.png";
      case 3:
        return "calendar.png";
      default:
        return "Communication.png";
    }
  }

  String returnCorrectStepTitle(BuildContext context) {
    switch (stepNumberNotifier.value) {
      case 1:
        return AppLocalizations.of(context)!.identityInformation;
      case 2:
        return AppLocalizations.of(context)!.caseHistory;
      case 3:
        return AppLocalizations.of(context)!.birthandDevelopmentHistory;
      default:
        return AppLocalizations.of(context)!.communication;
    }
  }
}
