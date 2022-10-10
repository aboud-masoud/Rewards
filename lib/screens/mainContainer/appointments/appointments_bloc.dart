import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rewards_app/screens/signup/signup_bloc.dart';
import 'package:rewards_app/utils/app_constants.dart';
import 'package:rewards_app/utils/global_value.dart';

class AppointmentsBloc {
  final CollectionReference appointments = FirebaseFirestore.instance.collection('Appointments');

  ValueNotifier<bool> fieldsValidation = ValueNotifier<bool>(false);

  ValueNotifier<int> stepNumberNotifier = ValueNotifier<int>(1);
  ValueNotifier<SignUpStatusEnum> signupStatus = ValueNotifier<SignUpStatusEnum>(SignUpStatusEnum.non);

  //##Step 1 (language)
  String usedLanguageWithTheClientAtHome = "";
  TextEditingController parentsOccupationController = TextEditingController();
  TextEditingController clientsSiblingsAndHisRanknController = TextEditingController();
  String isThereAnyKinshipBetweenParents = "";
  String youFoundCcontactUsVia = "";
  //##Step 2 (language)
  TextEditingController whatIsYourComplaintBrieflyController = TextEditingController();
  TextEditingController whenTheProblemWasFirstNotedController = TextEditingController();
  TextEditingController doesTheChildHavePreviousLanguageAndSpeechAssessmentWhatWasTheResultController =
      TextEditingController();
  String hasYourChildBeenDiagnosedWithAnyOfThese = "";
  String isThereAnySimilarLanguageOrSpeechDisordersNotedInTheFamily = "";
  TextEditingController hadYourChildEnrolledPreviouslyInRehabilitationPrograms = TextEditingController();
  //##Step 3 (language)
  String birthGenre = "";
  TextEditingController birthWeightController = TextEditingController();
  TextEditingController wereThereAnyComplicationsDuringPregnancyOrDeliverytController = TextEditingController();
  String hasYourChildExperiencedAnyOfThese = "";
  TextEditingController doesYourChildUseAnyMedicationsRegularlyFrequentlyController = TextEditingController();
  String hasYourChildHadVisionProblems = "";
  String didYourChildDelayInAnyOfTheseDevelopmentalStages = "";
  String checkTheSkillsThatYourChildAchievesIndependently = "";
  //##Step 4 (language)
  String howDoesYourChildCommunicateMostOfTheTime = "";
  String recentlyYourChildsSpeechIs = "";
  TextEditingController whenYourChildDidProduceHisFirstWordController = TextEditingController();
  TextEditingController doesTheChildUseAnyUtterancesSpeechController = TextEditingController();
  TextEditingController describeYourChildReceptiveLanguageController = TextEditingController();
  TextEditingController describeYourChildExpressiveLanguageController = TextEditingController();
  TextEditingController describeYourChildBehaviorController = TextEditingController();
  TextEditingController describeYourChildFocusAndAttentionController = TextEditingController();
  TextEditingController describeYourChildPlayShareActivitiesSymbolicPlayController = TextEditingController();
  TextEditingController whatAreYourChildBestReinforcementsController = TextEditingController();
  String howMuchTimeYourChildSpendsOnTVDevices = "";
  TextEditingController additionalInformationController = TextEditingController();

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

  String returnCorrectStepTitle(BuildContext context, bool isItLanguage) {
    switch (stepNumberNotifier.value) {
      case 1:
        return isItLanguage
            ? AppLocalizations.of(context)!.identityInformation
            : AppLocalizations.of(context)!.stutteringhistory;
      case 2:
        return isItLanguage ? AppLocalizations.of(context)!.caseHistory : AppLocalizations.of(context)!.medicalhistory;
      case 3:
        return AppLocalizations.of(context)!.birthandDevelopmentHistory;
      default:
        return AppLocalizations.of(context)!.communication;
    }
  }

  double valueOfProgressBar() {
    switch (stepNumberNotifier.value) {
      case 1:
        return 0.25;
      case 2:
        return 0.50;
      case 3:
        return 0.75;
      default:
        return 1;
    }
  }

  void validateFieldsLang1() {
    if (usedLanguageWithTheClientAtHome.isEmpty) {
      fieldsValidation.value = false;
    } else if (parentsOccupationController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (clientsSiblingsAndHisRanknController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (isThereAnyKinshipBetweenParents.isEmpty) {
      fieldsValidation.value = false;
    } else if (youFoundCcontactUsVia.isEmpty) {
      fieldsValidation.value = false;
    } else {
      fieldsValidation.value = true;
    }
  }

  void validateFieldsLang2() {
    if (whatIsYourComplaintBrieflyController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (whenTheProblemWasFirstNotedController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (doesTheChildHavePreviousLanguageAndSpeechAssessmentWhatWasTheResultController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (hasYourChildBeenDiagnosedWithAnyOfThese.isEmpty) {
      fieldsValidation.value = false;
    } else if (isThereAnySimilarLanguageOrSpeechDisordersNotedInTheFamily.isEmpty) {
      fieldsValidation.value = false;
    } else if (hadYourChildEnrolledPreviouslyInRehabilitationPrograms.text.isEmpty) {
      fieldsValidation.value = false;
    } else {
      fieldsValidation.value = true;
    }
  }

  void validateFieldsLang3() {
    if (birthGenre.isEmpty) {
      fieldsValidation.value = false;
    } else if (birthWeightController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (wereThereAnyComplicationsDuringPregnancyOrDeliverytController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (hasYourChildExperiencedAnyOfThese.isEmpty) {
      fieldsValidation.value = false;
    } else if (doesYourChildUseAnyMedicationsRegularlyFrequentlyController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (hasYourChildHadVisionProblems.isEmpty) {
      fieldsValidation.value = false;
    } else if (checkTheSkillsThatYourChildAchievesIndependently.isEmpty) {
      fieldsValidation.value = false;
    } else {
      fieldsValidation.value = true;
    }
  }

  void validateFieldsLang4() {
    if (howDoesYourChildCommunicateMostOfTheTime.isEmpty) {
      fieldsValidation.value = false;
    } else if (recentlyYourChildsSpeechIs.isEmpty) {
      fieldsValidation.value = false;
    } else if (whenYourChildDidProduceHisFirstWordController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (doesTheChildUseAnyUtterancesSpeechController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (describeYourChildReceptiveLanguageController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (describeYourChildExpressiveLanguageController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (describeYourChildBehaviorController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (describeYourChildFocusAndAttentionController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (describeYourChildPlayShareActivitiesSymbolicPlayController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (whatAreYourChildBestReinforcementsController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (howMuchTimeYourChildSpendsOnTVDevices.isEmpty) {
      fieldsValidation.value = false;
    } else if (additionalInformationController.text.isEmpty) {
      fieldsValidation.value = false;
    } else {
      fieldsValidation.value = true;
    }
  }

  Future<bool> bookLanguageDelay() async {
    signupStatus.value = SignUpStatusEnum.inProgress;

    final email = await const FlutterSecureStorage().read(key: AppConstants.biometricU);
    await appointments.add({
      "Email": email,
      "Type": "Evaluation Language Delay",
      "Client’s full name": fullname,
      "mobile number 1": mobileNumber1,
      "mobile number 2": mobileNumber2,
      "Date of birth": "abed",
      "Nationality": "abed",
      "Gender": "abed",
      "Address": "abed",
      "Used language with the client at home*:Used language with the client at home": usedLanguageWithTheClientAtHome,
      "Parents’ occupation": parentsOccupationController.text,
      "Client’s siblings and his rank": clientsSiblingsAndHisRanknController.text,
      "Is there any kinship between parents": isThereAnyKinshipBetweenParents,
      "You found/ contact us via": youFoundCcontactUsVia,
      "What is your complaint? briefly.": whatIsYourComplaintBrieflyController.text,
      "When the problem was first noted?": whenTheProblemWasFirstNotedController.text,
      "Does the child have a previous language and speech assessment? What was the Result?":
          doesTheChildHavePreviousLanguageAndSpeechAssessmentWhatWasTheResultController.text,
      "Has your child been diagnosed with any of these? ": hasYourChildBeenDiagnosedWithAnyOfThese,
      "Is there any similar language or speech disorders noted in the family?":
          isThereAnySimilarLanguageOrSpeechDisordersNotedInTheFamily,
      "Had your child enrolled previously in any rehabilitation programs (occupational therapy, physical therapy, behavioral modification…)? And how was his/her progress?":
          hadYourChildEnrolledPreviouslyInRehabilitationPrograms.text,
      "Birth genre": birthGenre,
      "Birth weight": birthWeightController.text,
      "Were there any complications during pregnancy or delivery? Explain.":
          wereThereAnyComplicationsDuringPregnancyOrDeliverytController.text,
      "Has your child experienced any of these?": hasYourChildBeenDiagnosedWithAnyOfThese,
      "Does your child use any medications regularly-frequently? Mention.":
          doesYourChildUseAnyMedicationsRegularlyFrequentlyController.text,
      "Has your child had a vision, hearing problems, or any other sensory issues?": hasYourChildHadVisionProblems,
      "Did your child delay in any of these developmental stages?": didYourChildDelayInAnyOfTheseDevelopmentalStages,
      "Check the skills, that your child achieves independently:": checkTheSkillsThatYourChildAchievesIndependently,
      "How does your child communicate, most of the time?": howDoesYourChildCommunicateMostOfTheTime,
      "Recently, your child’s speech is: ": recentlyYourChildsSpeechIs,
      "When your child did produce his first word? ": whenYourChildDidProduceHisFirstWordController.text,
      "Does the child use any utterances in his speech? Give example.":
          doesTheChildUseAnyUtterancesSpeechController.text,
      "Describe your child’s receptive language.": describeYourChildReceptiveLanguageController.text,
      "Describe your child’s expressive language.": describeYourChildExpressiveLanguageController.text,
      "Describe your child’s behavior.": describeYourChildBehaviorController.text,
      "Describe your child’s focus and attention.": describeYourChildFocusAndAttentionController.text,
      "Describe your child’s play, share activities, symbolic play and role play.":
          describeYourChildPlayShareActivitiesSymbolicPlayController.text,
      "What are your child’s best reinforcements?": whatAreYourChildBestReinforcementsController.text,
      "How much time your child spends on TV/ smart devices?": howMuchTimeYourChildSpendsOnTVDevices,
      "Would you like to add any additional information?": additionalInformationController.text,
      "Date": DateTime.now(),
    });

    signupStatus.value = SignUpStatusEnum.success;

    return true;
  }
}
