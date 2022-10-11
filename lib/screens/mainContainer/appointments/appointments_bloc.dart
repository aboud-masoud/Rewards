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
  String preferredtreatmentsessions = "";
  String preferredevaluationsession = "";

  //##Step 2 (stuttering)
  String whenWreTheStutteringSymptomsFirstNoted = "";
  String werethestutteringsymptomscontinuedchanged = "";
  String whatAreTheNotedStutteringBehaviorsClientSpeech = "";
  String areAnyOfTheseBehaviorsAssociatedWithTheStutteringMoment = "";
  String areTheStutteringMomentsBehaviorsThatTheClientExperienceSeems = "";
  String asYouNoteTheStutteringMomentsClientsSpeechAppear = "";
  String duringTheStutteringMomentTheClientYouWill = "";
  String isStutteringSeverityChangeAmongPlacesSituations = "";
  String isThereAnySimilarSpeechDisorderNotedFamily = "";
  String wasTheBeginningOfStutteringSymptomsAssociatedWithLanguageSpeechDifficulty = "";
  String preferableHandForTheClient = "";

  //##Step 3 (stuttering)
  TextEditingController doesTheClientHaveAnyDifficultiesVisionHearingSensation = TextEditingController();
  //##Step 4 (stuttering)
  String howDoesTheClientCommunicateTime = "";
  TextEditingController describeClientsBehaviorController = TextEditingController();
  TextEditingController describeClientsfocusController = TextEditingController();

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
        return AppLocalizations.of(context)!.identityInformation;
      case 2:
        return isItLanguage
            ? AppLocalizations.of(context)!.caseHistory
            : AppLocalizations.of(context)!.stutteringhistory;
      case 3:
        return isItLanguage
            ? AppLocalizations.of(context)!.birthandDevelopmentHistory
            : AppLocalizations.of(context)!.medicalhistory;
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
    } else if (clientsSiblingsAndHisRanknController.text.isEmpty) {
      fieldsValidation.value = false;
    } else {
      fieldsValidation.value = true;
    }
  }

  void validateFieldsStuttering1() {
    if (usedLanguageWithTheClientAtHome.isEmpty) {
      fieldsValidation.value = false;
    } else if (clientsSiblingsAndHisRanknController.text.isEmpty) {
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
    } else if (isThereAnySimilarLanguageOrSpeechDisordersNotedInTheFamily.isEmpty) {
      fieldsValidation.value = false;
    } else {
      fieldsValidation.value = true;
    }
  }

  void validateFieldsStuttering2() {
    if (whenWreTheStutteringSymptomsFirstNoted.isEmpty) {
      fieldsValidation.value = false;
    } else if (werethestutteringsymptomscontinuedchanged.isEmpty) {
      fieldsValidation.value = false;
    } else if (whatAreTheNotedStutteringBehaviorsClientSpeech.isEmpty) {
      fieldsValidation.value = false;
    } else if (areTheStutteringMomentsBehaviorsThatTheClientExperienceSeems.isEmpty) {
      fieldsValidation.value = false;
    } else if (asYouNoteTheStutteringMomentsClientsSpeechAppear.isEmpty) {
      fieldsValidation.value = false;
    } else if (duringTheStutteringMomentTheClientYouWill.isEmpty) {
      fieldsValidation.value = false;
    } else if (isStutteringSeverityChangeAmongPlacesSituations.isEmpty) {
      fieldsValidation.value = false;
    } else if (isThereAnySimilarSpeechDisorderNotedFamily.isEmpty) {
      fieldsValidation.value = false;
    } else if (wasTheBeginningOfStutteringSymptomsAssociatedWithLanguageSpeechDifficulty.isEmpty) {
      fieldsValidation.value = false;
    } else if (preferableHandForTheClient.isEmpty) {
      fieldsValidation.value = false;
    } else {
      fieldsValidation.value = true;
    }
  }

  void validateFieldsLang3() {
    if (birthGenre.isEmpty) {
      fieldsValidation.value = false;
    } else if (hasYourChildHadVisionProblems.isEmpty) {
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
    } else if (howMuchTimeYourChildSpendsOnTVDevices.isEmpty) {
      fieldsValidation.value = false;
    } else if (preferredtreatmentsessions.isEmpty) {
      fieldsValidation.value = false;
    } else if (preferredevaluationsession.isEmpty) {
      fieldsValidation.value = false;
    } else {
      fieldsValidation.value = true;
    }
  }

  void validateFieldsStuttering4() {
    if (howDoesTheClientCommunicateTime.isEmpty) {
      fieldsValidation.value = false;
    } else if (describeClientsBehaviorController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (describeClientsfocusController.text.isEmpty) {
      fieldsValidation.value = false;
    } else if (preferredtreatmentsessions.isEmpty) {
      fieldsValidation.value = false;
    } else if (preferredevaluationsession.isEmpty) {
      fieldsValidation.value = false;
    } else {
      fieldsValidation.value = true;
    }
  }

  Future<bool> bookStuttering() async {
    signupStatus.value = SignUpStatusEnum.inProgress;
    final email = await const FlutterSecureStorage().read(key: AppConstants.biometricU);
    await appointments.add({
      "Email": email,
      "Type": "Evaluation Stuttering",
      "Client’s full name": fullname,
      "mobile number 1": mobileNumber1,
      "mobile number 2": mobileNumber2,
      "Date of birth": dateOfBirth,
      "Nationality": nationality,
      "Gender": gender,
      "Address": address,
      "Used language with the client at home*:Used language with the client at home": usedLanguageWithTheClientAtHome,
      "Parents’ occupation": parentsOccupationController.text,
      "Client’s siblings and his rank": clientsSiblingsAndHisRanknController.text,
      "When were the stuttering symptoms first noted?": whenWreTheStutteringSymptomsFirstNoted,
      "Were the stuttering symptoms continued, consistent, or changed with time?":
          werethestutteringsymptomscontinuedchanged,
      "What are the noted stuttering behaviors in the client’s speech:": whatAreTheNotedStutteringBehaviorsClientSpeech,
      "Are any of these behaviors associated with the stuttering moment?":
          areAnyOfTheseBehaviorsAssociatedWithTheStutteringMoment,
      "Are the stuttering moments / behaviors that the client experience seems:":
          areTheStutteringMomentsBehaviorsThatTheClientExperienceSeems,
      "As you note, the stuttering moments in clients’ speech appear on: ":
          asYouNoteTheStutteringMomentsClientsSpeechAppear,
      "During the stuttering moment, the client or you will": duringTheStutteringMomentTheClientYouWill,
      "Is stuttering severity change among places/people/situations?": isStutteringSeverityChangeAmongPlacesSituations,
      "Is there any similar speech disorder noted in the family?": isThereAnySimilarSpeechDisorderNotedFamily,
      "Was the beginning of stuttering symptoms associated with language or speech difficulty?":
          wasTheBeginningOfStutteringSymptomsAssociatedWithLanguageSpeechDifficulty,
      "Preferable hand for the client:": preferableHandForTheClient,
      "Does the client use any medications regularly-frequently? Mention please.":
          doesYourChildUseAnyMedicationsRegularlyFrequentlyController.text,
      "Does the client have any difficulties in vision, hearing, or any other sensation issues? Mention please.":
          doesTheClientHaveAnyDifficultiesVisionHearingSensation.text,
      "How does the client communicate most of the time?": howDoesTheClientCommunicateTime,
      "Describe (in general) clients’ behavior.": describeClientsBehaviorController.text,
      "Describe clients’ focus and attention.": describeClientsfocusController.text,
      "Would you like to add any additional information?": additionalInformationController.text,
      "Which time you are preferred for your treatment sessions : ": preferredevaluationsession,
      "Which day/ days you are preferred for your evaluation session:": preferredtreatmentsessions,
      "Date": DateTime.now(),
    });

    signupStatus.value = SignUpStatusEnum.success;

    return true;
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
      "Date of birth": dateOfBirth,
      "Nationality": nationality,
      "Gender": gender,
      "Address": address,
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
      "Which time you are preferred for your treatment sessions : ": preferredevaluationsession,
      "Which day/ days you are preferred for your evaluation session:": preferredtreatmentsessions,
      "Date": DateTime.now(),
    });

    signupStatus.value = SignUpStatusEnum.success;

    return true;
  }
}
