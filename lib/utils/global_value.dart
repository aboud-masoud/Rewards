import 'package:rewards_app/app.dart';

String userEmail = "";
String mobileNumber1 = "";
String mobileNumber2 = "";
String fullname = "";

List<String> genderEnList = [
  "Male",
  "Female",
];

List<String> genderArList = [
  "ذكر",
  "انثى",
];

List<String> genderEnToAr() {
  if (languageSelected.value == "en") {
    return genderEnList;
  } else {
    return genderArList;
  }
}

List<String> natonalityEnList = [
  "Saudi",
  "Jordanian",
  "Egyptian",
  "Qatari",
  "Iraqi",
  "Omani",
  "Sudanese",
  "Libyan",
  "Yemeni",
  "Kuwaiti",
  "Emirati",
  "Algerian",
  "Tunisian",
  "Syrian",
  "Bahraini",
  "palestinian",
  "Moroccan",
  "Indian",
  "Pakistani",
  "Canadaian",
  "Other",
];

List<String> natonalityArList = [
  "السعودية",
  "الاردن",
  "مصر",
  "قطر",
  "العراق",
  "عمان",
  "السودان",
  "ليبيا",
  "اليمن",
  "الكويت",
  "الامارات",
  "الجزائر",
  "تونس",
  "سوريا",
  "البحرين",
  "فلسطين",
  "المغرب",
  "الهند",
  "باكستان",
  "كندا",
  "اخرى",
];

List<String> natonalityEnToAr() {
  if (languageSelected.value == "en") {
    return natonalityEnList;
  } else {
    return natonalityArList;
  }
}

List<String> usedLanguage = [
  "العربية",
  "English",
];

List<String> parentOcupation = [
  "Yes",
  "No",
];

List<String> yesnoList = [
  "Yes",
  "No",
];
List<String> yesnomaybeList = [
  "Yes",
  "No",
  "Maybe",
];

List<String> foundCountact = [
  "Media",
  "Previos Known",
  "Friends",
  "Internet",
];

List<String> stutteringsymptomsfirstnoted = [
  "Since days-weeks",
  "Since 2-6 months",
  "Since 6 months or more",
  "For more than a year",
];

List<String> howdoestheclientcommunicatemostofthetime = [
  "Facial expressions",
  "Short sentences (1-3) words",
  "Long utterances and sentences",
];

List<String> preferablehandfortheclient = [
  "Right",
  "Left",
  "Both",
];

List<String> duringthestutteringmomenttheclientoryouwill = [
  "Continue speaking until the idea is completed",
  "Stop talking and avoid speaking again",
  "Escape from the social situation",
];

List<String> thestutteringmomentsinclientsspeechappearon = [
  "First sound on the words",
  "First word of the sentence",
  "Middle sound of the word",
  "Middle words of sentences",
];

List<String> arethestutteringmomentsbehaviorsthattheclientexperienceseems = [
  "Easy and loose ",
  "Hard and tense",
];

List<String> diagnosed = [
  "option1",
  "option2",
];

List<String> disordersfamily = [
  "option1",
  "option2",
];
