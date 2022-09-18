import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rewards_app/utils/app_constants.dart';
import 'package:rewards_app/utils/global_value.dart';
import 'package:rewards_app/utils/shared_methods.dart';

enum SignUpStatusEnum { faild, success, non, inProgress }

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
  TextEditingController complaintController = TextEditingController();
  TextEditingController problemFirstNotedController = TextEditingController();
  TextEditingController speechassessmentController = TextEditingController();
  TextEditingController diagnosedController = TextEditingController();
  TextEditingController disordersfamilyController = TextEditingController();
  TextEditingController enrolledController = TextEditingController();
  TextEditingController birthGenre = TextEditingController();
  TextEditingController birthWeight = TextEditingController();
  TextEditingController wereThereAnyComplicationsDuringPregnancyOrDeliveryExplain = TextEditingController();
  TextEditingController hasYourChildExperiencedAnyOfThese = TextEditingController();
  TextEditingController doesYourChildUseAnyMedicationsRegularlyFrequentlyMention = TextEditingController();
  TextEditingController hasYourChildHadAVisionHearingProblemsOrAnyOtherSensoryIssues = TextEditingController();
  TextEditingController didYourChildDelayInAnyOfTheseDevelopmentalStages = TextEditingController();
  TextEditingController checkTheSkillsThatYourChildAchievesIndependently = TextEditingController();
  TextEditingController howDoesYourChildCommunicateMostOfTheTime = TextEditingController();
  TextEditingController recentlyYourChildsSpeechIs = TextEditingController();
  TextEditingController whenYourChildDidProduceHisFirstWord = TextEditingController();
  TextEditingController doesTheChildUseAnyUtterancesInHisSpeechGiveExample = TextEditingController();
  TextEditingController describeYourChildReceptiveLanguage = TextEditingController();
  TextEditingController describeYourChildExpressiveLanguage = TextEditingController();
  TextEditingController describeYourChildBehavior = TextEditingController();
  TextEditingController describeYourChildFocusAndAttention = TextEditingController();
  TextEditingController describeYourChildPlayShareActivitiesSymbolicPlayAndRolePlay = TextEditingController();
  TextEditingController howMuchTimeYourChildSpendsOnTVSmartDevices = TextEditingController();
  TextEditingController wouldYouLikeToAddAnyAdditionalInformation = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();

  ValueNotifier<bool> fieldsValidation = ValueNotifier<bool>(false);
  ValueNotifier<SignUpStatusEnum> signupStatus = ValueNotifier<SignUpStatusEnum>(SignUpStatusEnum.non);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // var stepNumber = 1;
  ValueNotifier<int> stepNumberNotifier = ValueNotifier<int>(1);

  final CollectionReference _profiles = FirebaseFirestore.instance.collection('profiles');
  final CollectionReference _profileDetails = FirebaseFirestore.instance.collection('profileDetails');

  final storage = const FlutterSecureStorage();

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
          nationality: nationalityController.text,
          gender: genderController.text,
          address: addressController.text,
          mobileNumber: mobileNumberController.text,
          usedLanguageWithTheClient: usedLanguageController.text,
          parentsOccupation: parentOcupationController.text,
          siblingsAndHisRank: hisrankController.text,
          isThereAnyKinshipBetweenParents: kinshipController.text,
          youFoundContactUsVia: foundCountactController.text,
          whatIsYourComplaintBriefly: complaintController.text,
          whenTheProblemWasFirstNoted: problemFirstNotedController.text,
          doesTheChildHaveAPreviousLanguageAndSpeechAssessmentWhatWasTheResult: speechassessmentController.text,
          hasYourChildBeenDiagnosedWithAnyOfThese: diagnosedController.text,
          isThereAnySimilarLanguageOrSpeechDisordersNotedInTheFamily: disordersfamilyController.text,
          hadYourChildEnrolledPreviouslyInAnyRehabilitationPrograms: enrolledController.text,
          firstEvaluationDate: "",
          firstTherapeuticSessionDate: "",
          therapeuticName: "",
          birthGenre: birthGenre.text,
          birthWeight: birthWeight.text,
          wereThereAnyComplicationsDuringPregnancyOrDeliveryExplain:
              wereThereAnyComplicationsDuringPregnancyOrDeliveryExplain.text,
          hasYourChildExperiencedAnyOfThese: hasYourChildExperiencedAnyOfThese.text,
          doesYourChildUseAnyMedicationsRegularlyFrequentlyMention: doesYourChildUseAnyMedicationsRegularlyFrequentlyMention.text,
          hasYourChildHadAVisionHearingProblemsOrAnyOtherSensoryIssues:
              hasYourChildHadAVisionHearingProblemsOrAnyOtherSensoryIssues.text,
          didYourChildDelayInAnyOfTheseDevelopmentalStages: didYourChildDelayInAnyOfTheseDevelopmentalStages.text,
          checkTheSkillsThatYourChildAchievesIndependently: checkTheSkillsThatYourChildAchievesIndependently.text,
          howDoesYourChildCommunicateMostOfTheTime: howDoesYourChildCommunicateMostOfTheTime.text,
          recentlyYourChildsSpeechIs: recentlyYourChildsSpeechIs.text,
          whenYourChildDidProduceHisFirstWord: whenYourChildDidProduceHisFirstWord.text,
          doesTheChildUseAnyUtterancesInHisSpeechGiveExample: doesTheChildUseAnyUtterancesInHisSpeechGiveExample.text,
          describeYourChildReceptiveLanguage: describeYourChildReceptiveLanguage.text,
          describeYourChildExpressiveLanguage: describeYourChildExpressiveLanguage.text,
          describeYourChildBehavior: describeYourChildBehavior.text,
          describeYourChildFocusAndAttention: describeYourChildFocusAndAttention.text,
          describeYourChildPlayShareActivitiesSymbolicPlayAndRolePlay:
              describeYourChildPlayShareActivitiesSymbolicPlayAndRolePlay.text,
          howMuchTimeYourChildSpendsOnTVSmartDevices: howMuchTimeYourChildSpendsOnTVSmartDevices.text,
          wouldYouLikeToAddAnyAdditionalInformation: wouldYouLikeToAddAnyAdditionalInformation.text,
        );

        await _profiles.doc(user.email).set(theJSON);

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
