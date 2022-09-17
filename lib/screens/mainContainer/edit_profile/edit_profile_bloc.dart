import 'package:flutter/material.dart';

class EditProfileBloc {
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
  ValueNotifier<bool> fieldsValidation = ValueNotifier<bool>(false);

  void validateFields() {
    fieldsValidation.value = true;
  }
}
