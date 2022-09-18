import 'package:url_launcher/url_launcher.dart';

class SharedMethods {
  bool checkEmailSantax(String email) {
    return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
  }

  Future<void> openUrl(String link) async {
    final Uri url = Uri.parse(link);

    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  Future<void> callNumber(String number) async {
    final Uri phoneLaunchUri = Uri(scheme: 'tel', path: number);

    if (!await launchUrl(phoneLaunchUri)) {
      throw 'Could not launch $phoneLaunchUri';
    }
  }

  Future<void> sendEmail(String email) async {
    final Uri emailLaunchUri = Uri(scheme: 'mailto', path: email, queryParameters: {'subject': 'Amwaj Center Application'});

    if (!await launchUrl(emailLaunchUri)) {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  Map<String, dynamic> handleJsonOfProfile({
    required String email,
    required String fullName,
    required String db,
    required String nationality,
    required String gender,
    required String address,
    required String mobileNumber,
    required String usedLanguageWithTheClient,
    required String parentsOccupation,
    required String siblingsAndHisRank,
    required String isThereAnyKinshipBetweenParents,
    required String youFoundContactUsVia,
    required String whatIsYourComplaintBriefly,
    required String whenTheProblemWasFirstNoted,
    required String doesTheChildHaveAPreviousLanguageAndSpeechAssessmentWhatWasTheResult,
    required String hasYourChildBeenDiagnosedWithAnyOfThese,
    required String isThereAnySimilarLanguageOrSpeechDisordersNotedInTheFamily,
    required String hadYourChildEnrolledPreviouslyInAnyRehabilitationPrograms,
    required String firstEvaluationDate,
    required String firstTherapeuticSessionDate,
    required String therapeuticName,
    required String birthGenre,
    required String birthWeight,
    required String wereThereAnyComplicationsDuringPregnancyOrDeliveryExplain,
    required String hasYourChildExperiencedAnyOfThese,
    required String doesYourChildUseAnyMedicationsRegularlyFrequentlyMention,
    required String hasYourChildHadAVisionHearingProblemsOrAnyOtherSensoryIssues,
    required String didYourChildDelayInAnyOfTheseDevelopmentalStages,
    required String checkTheSkillsThatYourChildAchievesIndependently,
    required String howDoesYourChildCommunicateMostOfTheTime,
    required String recentlyYourChildsSpeechIs,
    required String whenYourChildDidProduceHisFirstWord,
    required String doesTheChildUseAnyUtterancesInHisSpeechGiveExample,
    required String describeYourChildReceptiveLanguage,
    required String describeYourChildExpressiveLanguage,
    required String describeYourChildBehavior,
    required String describeYourChildFocusAndAttention,
    required String describeYourChildPlayShareActivitiesSymbolicPlayAndRolePlay,
    required String howMuchTimeYourChildSpendsOnTVSmartDevices,
    required String wouldYouLikeToAddAnyAdditionalInformation,
  }) {
    return {
      "email": email,
      "full name": fullName,
      "Date Of Birth": db,
      "Nationality": nationality,
      "Gender": gender,
      "Address": address,
      "Used language with the client at home": usedLanguageWithTheClient,
      "Mobile Number": mobileNumber,
      "Parents occupation": parentsOccupation,
      "siblings and his rank": siblingsAndHisRank,
      "Is there any kinship between parents?": isThereAnyKinshipBetweenParents,
      "You found contact us via": youFoundContactUsVia,
      "What is your complaint? briefly": whatIsYourComplaintBriefly,
      "When the problem was first noted?": whenTheProblemWasFirstNoted,
      "Does the child have a previous language and speech assessment? What was the Result?":
          doesTheChildHaveAPreviousLanguageAndSpeechAssessmentWhatWasTheResult,
      "Has your child been diagnosed with any of these?": hasYourChildBeenDiagnosedWithAnyOfThese,
      "Is there any similar language or speech disorders noted in the family?":
          isThereAnySimilarLanguageOrSpeechDisordersNotedInTheFamily,
      "Had your child enrolled previously in any rehabilitation programs (occupational therapy, physical therapy, behavioral modification…)? And how was his her progress?":
          hadYourChildEnrolledPreviouslyInAnyRehabilitationPrograms,
      "1 st Evaluation Date": firstEvaluationDate,
      "1 st Therapeutic Session Date": firstTherapeuticSessionDate,
      "Therapeutic Name": therapeuticName,
      "Were there any complications during pregnancy or delivery? Explain":
          wereThereAnyComplicationsDuringPregnancyOrDeliveryExplain,
      "Has your child experienced any of these?": hasYourChildExperiencedAnyOfThese,
      "Does your child use any medications regularly-frequently? Mention":
          doesYourChildUseAnyMedicationsRegularlyFrequentlyMention,
      "Has your child had a vision, hearing problems, or any other sensory issues?":
          hasYourChildHadAVisionHearingProblemsOrAnyOtherSensoryIssues,
      "Did your child delay in any of these developmental stages?": didYourChildDelayInAnyOfTheseDevelopmentalStages,
      "Check the skills, that your child achieves independently": checkTheSkillsThatYourChildAchievesIndependently,
      "How does your child communicate, most of the time?": howDoesYourChildCommunicateMostOfTheTime,
      "Recently, your child’s speech is": recentlyYourChildsSpeechIs,
      "When your child did produce his first word?": whenYourChildDidProduceHisFirstWord,
      "Does the child use any utterances in his speech? Give example": doesTheChildUseAnyUtterancesInHisSpeechGiveExample,
      "Describe your child’s receptive language": describeYourChildReceptiveLanguage,
      "Describe your child’s expressive language": describeYourChildExpressiveLanguage,
      "Describe your child’s behavior": describeYourChildBehavior,
      "Describe your child’s focus and attention": describeYourChildFocusAndAttention,
      "Describe your child’s play, share activities, symbolic play and role play":
          describeYourChildPlayShareActivitiesSymbolicPlayAndRolePlay,
      "How much time your child spends on TV smart devices?": howMuchTimeYourChildSpendsOnTVSmartDevices,
      "Would you like to add any additional information?": wouldYouLikeToAddAnyAdditionalInformation,
      "birthGenre": birthGenre,
      "birthWeight": birthWeight,
    };
  }
}
