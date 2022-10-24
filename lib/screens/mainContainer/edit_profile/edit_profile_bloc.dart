import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rewards_app/utils/app_constants.dart';
import 'package:rewards_app/utils/global_value.dart';
import 'package:rewards_app/utils/shared_methods.dart';

class EditProfileBloc {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileNumber1Controller = TextEditingController();
  TextEditingController mobileNumber2Controller = TextEditingController();

  ValueNotifier<int> nationalityValue = ValueNotifier<int>(0);
  ValueNotifier<int> genderValue = ValueNotifier<int>(0);
  String firstEvaluationDate = "";
  String firstTherapeuticSessionDate = "";
  String therapeuticName = "";

  bool openPageForTheFirstTime = true;
  ValueNotifier<bool> fieldsValidation = ValueNotifier<bool>(false);

  final CollectionReference profile = FirebaseFirestore.instance.collection('profiles');

  void validateFields() {
    if (fullNameController.text.isNotEmpty &&
        dateOfBirthController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        (mobileNumber1Controller.text.isNotEmpty || mobileNumber2Controller.text.isNotEmpty)) {
      fieldsValidation.value = true;
    } else {
      fieldsValidation.value = false;
    }
  }

  Future<void> updateProfileInformation() async {
    final theJSON = SharedMethods().handleJsonOfProfile(
      email: userEmail,
      fullName: fullNameController.text,
      db: dateOfBirthController.text,
      nationalityEn: natonalityEnList[nationalityValue.value],
      nationalityAr: natonalityArList[nationalityValue.value],
      genderAr: genderArList[genderValue.value],
      genderEn: genderEnList[genderValue.value],
      address: addressController.text,
      mobileNumber1: mobileNumber1Controller.text,
      mobileNumber2: mobileNumber2Controller.text,
      firstEvaluationDate: firstEvaluationDate,
      firstTherapeuticSessionDate: firstTherapeuticSessionDate,
      therapeuticName: therapeuticName,
    );

    await profile.doc(userEmail).update(theJSON);
  }
}
