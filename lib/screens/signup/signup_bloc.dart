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
  ValueNotifier<String> nationalityValue = ValueNotifier<String>("");
  ValueNotifier<String> genderValue = ValueNotifier<String>("");
  TextEditingController addressController = TextEditingController();
  ValueNotifier<String> usedLanguageValue = ValueNotifier<String>("");
  TextEditingController mobileNumberController = TextEditingController();
  ValueNotifier<String> parentOcupationValue = ValueNotifier<String>("");
  TextEditingController hisrankController = TextEditingController();
  ValueNotifier<String> kinshipValue = ValueNotifier<String>("");
  ValueNotifier<String> foundCountactValue = ValueNotifier<String>("");
  TextEditingController complaintController = TextEditingController();

  TextEditingController describeingeneralclientsbehavior = TextEditingController();
  TextEditingController describeclientsfocusandattention = TextEditingController();
  TextEditingController wouldyouliketoaddanyadditionalinformation = TextEditingController();

  ValueNotifier<String> problemFirstNotedValue = ValueNotifier<String>("");
  ValueNotifier<String> howdoestheclientcommunicatemostofthetimeValue = ValueNotifier<String>("");
  ValueNotifier<String> wasthebeginningofstutteringsymptomsassociatedwithlanguageorspeechdifficultyValue =
      ValueNotifier<String>("");
  ValueNotifier<String> isthereanysimilarspeechdisordernotedinthefamily = ValueNotifier<String>("");
  ValueNotifier<String> isstutteringseveritychangeamongplacespeoplesituations = ValueNotifier<String>("");
  ValueNotifier<String> thestutteringmomentsinclientsspeechappearon = ValueNotifier<String>("");
  ValueNotifier<String> arethestutteringmomentsbehaviorsthattheclientexperienceseems = ValueNotifier<String>("");

  TextEditingController doestheclientuseanymedicationsregularlyfrequently = TextEditingController();
  TextEditingController doestheclienthaveanydifficultiesinvisionhearingoranyothersensationissues =
      TextEditingController();

  ValueNotifier<String> preferablehandfortheclientValue = ValueNotifier<String>("");
  ValueNotifier<String> duringthestutteringmomenttheclientoryouwill = ValueNotifier<String>("");

  TextEditingController speechassessmentController = TextEditingController();
  ValueNotifier<String> diagnosedValue = ValueNotifier<String>("");
  ValueNotifier<String> disordersfamilyValue = ValueNotifier<String>("");
  ValueNotifier<String> stutteringsymptomsfirstnoted = ValueNotifier<String>("");

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
  final CollectionReference _profilesScore = FirebaseFirestore.instance.collection('profilesScores');

  final storage = const FlutterSecureStorage();

  void validateFields() {
    //TODO : handle validation
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
          nationality: nationalityValue.value,
          gender: genderValue.value,
          address: addressController.text,
          mobileNumber1: mobileNumberController.text,
          mobileNumber2: mobileNumberController.text,
          usedLanguageWithTheClient: usedLanguageValue.value,
          parentsOccupation: parentOcupationValue.value,
          siblingsAndHisRank: hisrankController.text,
          isThereAnyKinshipBetweenParents: kinshipValue.value,
          youFoundContactUsVia: foundCountactValue.value,
          whatIsYourComplaintBriefly: complaintController.text,
          whenTheProblemWasFirstNoted: problemFirstNotedValue.value,
          doesTheChildHaveAPreviousLanguageAndSpeechAssessmentWhatWasTheResult: speechassessmentController.text,
          hasYourChildBeenDiagnosedWithAnyOfThese: diagnosedValue.value,
          isThereAnySimilarLanguageOrSpeechDisordersNotedInTheFamily: disordersfamilyValue.value,
          hadYourChildEnrolledPreviouslyInAnyRehabilitationPrograms: enrolledController.text,
          firstEvaluationDate: "",
          firstTherapeuticSessionDate: "",
          therapeuticName: "",
          birthGenre: birthGenre.text,
          birthWeight: birthWeight.text,
          wereThereAnyComplicationsDuringPregnancyOrDeliveryExplain:
              wereThereAnyComplicationsDuringPregnancyOrDeliveryExplain.text,
          hasYourChildExperiencedAnyOfThese: hasYourChildExperiencedAnyOfThese.text,
          doesYourChildUseAnyMedicationsRegularlyFrequentlyMention:
              doesYourChildUseAnyMedicationsRegularlyFrequentlyMention.text,
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
        return AppLocalizations.of(context)!.stutteringhistory; // caseHistory;
      case 3:
        return AppLocalizations.of(context)!.medicalhistory; //birthandDevelopmentHistory;
      default:
        return AppLocalizations.of(context)!.communication;
    }
  }
}
