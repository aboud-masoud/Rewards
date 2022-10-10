import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rewards_app/utils/app_constants.dart';
import 'package:rewards_app/utils/global_value.dart';
import 'package:rewards_app/utils/shared_methods.dart';
// import 'package:rewards_app/utils/global_value.dart';
// import 'package:rewards_app/utils/shared_methods.dart';

enum SignUpStatusEnum { faild, success, non, inProgress }

class SignUpBloc {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  ValueNotifier<int> genderValue = ValueNotifier<int>(0);
  ValueNotifier<int> nationalityValue = ValueNotifier<int>(0);

  TextEditingController addressController = TextEditingController();
  TextEditingController mobileNumber1Controller = TextEditingController();
  TextEditingController mobileNumber2Controller = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  ValueNotifier<bool> fieldsValidation = ValueNotifier<bool>(false);
  ValueNotifier<SignUpStatusEnum> signupStatus = ValueNotifier<SignUpStatusEnum>(SignUpStatusEnum.non);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  final CollectionReference _profiles = FirebaseFirestore.instance.collection('profiles');
  final CollectionReference _profilesScore = FirebaseFirestore.instance.collection('profilesScores');

  final storage = const FlutterSecureStorage();

  void validateFields() {
    if (emailController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (fullNameController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (dateOfBirthController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (passwordController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (addressController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (mobileNumber1Controller.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (mobileNumber2Controller.text.isEmpty) {
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
    signupStatus.value = SignUpStatusEnum.inProgress;
    final User? user;
    try {
      user = (await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ))
          .user;

      if (user != null) {
        signupStatus.value = SignUpStatusEnum.success;
        await _saveValuesInMemory(userName: user.email!, password: passwordController.text, uid: user.uid);

        userEmail = user.email!;

        final theJSON = SharedMethods().handleJsonOfProfile(
          email: user.email!,
          fullName: fullNameController.text,
          db: dateOfBirthController.text,
          nationalityEn: natonalityEnList[nationalityValue.value],
          nationalityAr: natonalityArList[nationalityValue.value],
          genderAr: genderArList[genderValue.value],
          genderEn: genderEnList[genderValue.value],
          address: addressController.text,
          mobileNumber1: mobileNumber1Controller.text,
          mobileNumber2: mobileNumber2Controller.text,
          firstEvaluationDate: "",
          firstTherapeuticSessionDate: "",
          therapeuticName: "",
        );

        await _profiles.doc(user.email).set(theJSON);
        await _profilesScore.doc(user.email).set({"points": "0"});

        return true;
      } else {
        signupStatus.value = SignUpStatusEnum.faild;
        return false;
      }
    } catch (error) {
      print("--" + error.toString());
      signupStatus.value = SignUpStatusEnum.faild;
      return false;
    }
  }

  Future<void> _saveValuesInMemory({required String userName, required String password, required String uid}) async {
    await storage.deleteAll();

    await storage.write(key: AppConstants.biometricU, value: userName);
    await storage.write(key: AppConstants.biometricP, value: password);
    await storage.write(key: AppConstants.uid, value: uid);
  }
}
