import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rewards_app/utils/global_value.dart';
import 'package:rewards_app/utils/shared_methods.dart';

class EditProfileBloc {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController hisrankController = TextEditingController();
  ValueNotifier<bool> fieldsValidation = ValueNotifier<bool>(false);
  TextEditingController parentsoccupationController = TextEditingController();

  ValueNotifier<String> nationalityValue = ValueNotifier<String>("");
  ValueNotifier<String> genderValue = ValueNotifier<String>("");
  ValueNotifier<String> usedLanguageValue = ValueNotifier<String>("");
  ValueNotifier<String> kinshipValue = ValueNotifier<String>("");

  bool openPageForTheFirstTime = true;

  final CollectionReference profile = FirebaseFirestore.instance.collection('profiles');

  String whatIsYourComplaintBriefly = "";
  String whenTheProblemWasFirstNoted = "";
  String doesTheChildHaveAPreviousLanguageAndSpeechAssessmentWhatWasTheResult = "";
  String hasYourChildBeenDiagnosedWithAnyOfThese = "";
  String isThereAnySimilarLanguageOrSpeechDisordersNotedInTheFamily = "";
  String hadYourChildEnrolledPreviouslyInAnyRehabilitationPrograms = "";
  String firstEvaluationDate = "";
  String firstTherapeuticSessionDate = "";
  String foundCountactValue = "";
  String therapeuticName = "";
  String birthGenre = "";
  String birthWeight = "";
  String wereThereAnyComplicationsDuringPregnancyOrDeliveryExplain = "";
  String hasYourChildExperiencedAnyOfThese = "";
  String doesYourChildUseAnyMedicationsRegularlyFrequentlyMention = "";
  String hasYourChildHadAVisionHearingProblemsOrAnyOtherSensoryIssues = "";
  String didYourChildDelayInAnyOfTheseDevelopmentalStages = "";
  String checkTheSkillsThatYourChildAchievesIndependently = "";
  String howDoesYourChildCommunicateMostOfTheTime = "";
  String recentlyYourChildsSpeechIs = "";
  String whenYourChildDidProduceHisFirstWord = "";
  String doesTheChildUseAnyUtterancesInHisSpeechGiveExample = "";
  String describeYourChildReceptiveLanguage = "";
  String describeYourChildExpressiveLanguage = "";
  String describeYourChildBehavior = "";
  String describeYourChildFocusAndAttention = "";
  String describeYourChildPlayShareActivitiesSymbolicPlayAndRolePlay = "";
  String howMuchTimeYourChildSpendsOnTVSmartDevices = "";
  String wouldYouLikeToAddAnyAdditionalInformation = "";

  void validateFields() {
    if (fullNameController.text.isNotEmpty &&
        dateOfBirthController.text.isNotEmpty &&
        nationalityValue.value != "" &&
        genderValue.value != "" &&
        addressController.text.isNotEmpty &&
        usedLanguageValue.value != "" &&
        mobileNumberController.text.isNotEmpty &&
        parentsoccupationController.text != "" &&
        hisrankController.text.isNotEmpty &&
        kinshipValue.value != "") {
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
      nationality: nationalityValue.value,
      gender: genderValue.value,
      address: addressController.text,
      mobileNumber: mobileNumberController.text,
      usedLanguageWithTheClient: usedLanguageValue.value,
      parentsOccupation: parentsoccupationController.text,
      siblingsAndHisRank: hisrankController.text,
      isThereAnyKinshipBetweenParents: kinshipValue.value,
      youFoundContactUsVia: foundCountactValue,
      whatIsYourComplaintBriefly: whatIsYourComplaintBriefly,
      whenTheProblemWasFirstNoted: whenTheProblemWasFirstNoted,
      doesTheChildHaveAPreviousLanguageAndSpeechAssessmentWhatWasTheResult:
          doesTheChildHaveAPreviousLanguageAndSpeechAssessmentWhatWasTheResult,
      hasYourChildBeenDiagnosedWithAnyOfThese: hasYourChildBeenDiagnosedWithAnyOfThese,
      isThereAnySimilarLanguageOrSpeechDisordersNotedInTheFamily:
          isThereAnySimilarLanguageOrSpeechDisordersNotedInTheFamily,
      hadYourChildEnrolledPreviouslyInAnyRehabilitationPrograms:
          hadYourChildEnrolledPreviouslyInAnyRehabilitationPrograms,
      firstEvaluationDate: firstEvaluationDate,
      firstTherapeuticSessionDate: firstTherapeuticSessionDate,
      therapeuticName: therapeuticName,
      birthGenre: birthGenre,
      birthWeight: birthWeight,
      wereThereAnyComplicationsDuringPregnancyOrDeliveryExplain:
          wereThereAnyComplicationsDuringPregnancyOrDeliveryExplain,
      hasYourChildExperiencedAnyOfThese: hasYourChildExperiencedAnyOfThese,
      doesYourChildUseAnyMedicationsRegularlyFrequentlyMention:
          doesYourChildUseAnyMedicationsRegularlyFrequentlyMention,
      hasYourChildHadAVisionHearingProblemsOrAnyOtherSensoryIssues:
          hasYourChildHadAVisionHearingProblemsOrAnyOtherSensoryIssues,
      didYourChildDelayInAnyOfTheseDevelopmentalStages: didYourChildDelayInAnyOfTheseDevelopmentalStages,
      checkTheSkillsThatYourChildAchievesIndependently: checkTheSkillsThatYourChildAchievesIndependently,
      howDoesYourChildCommunicateMostOfTheTime: howDoesYourChildCommunicateMostOfTheTime,
      recentlyYourChildsSpeechIs: recentlyYourChildsSpeechIs,
      whenYourChildDidProduceHisFirstWord: whenYourChildDidProduceHisFirstWord,
      doesTheChildUseAnyUtterancesInHisSpeechGiveExample: doesTheChildUseAnyUtterancesInHisSpeechGiveExample,
      describeYourChildReceptiveLanguage: describeYourChildReceptiveLanguage,
      describeYourChildExpressiveLanguage: describeYourChildExpressiveLanguage,
      describeYourChildBehavior: describeYourChildBehavior,
      describeYourChildFocusAndAttention: describeYourChildFocusAndAttention,
      describeYourChildPlayShareActivitiesSymbolicPlayAndRolePlay:
          describeYourChildPlayShareActivitiesSymbolicPlayAndRolePlay,
      howMuchTimeYourChildSpendsOnTVSmartDevices: howMuchTimeYourChildSpendsOnTVSmartDevices,
      wouldYouLikeToAddAnyAdditionalInformation: wouldYouLikeToAddAnyAdditionalInformation,
    );

    await profile.doc(userEmail).update(theJSON);
  }
}
