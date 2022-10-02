import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

String userEmail = "";
String userMobileNumber = "";

//TODO: Handle Loclization
// https://www.hatit.net/5610/%D8%A7%D8%B3%D9%85%D8%A7%D8%A1-%D8%A7%D9%84%D8%AF%D9%88%D9%84-%D8%A7%D9%84%D8%B9%D8%B1%D8%A8%D9%8A%D8%A9-%D8%A8%D8%A7%D9%84%D8%A7%D9%86%D8%AC%D9%84%D9%8A%D8%B2%D9%8A/
// and India , Canada , others
List<String> nationality(BuildContext context) {
  return [
    "Yemen",
    // AppLocalizations.of(context)!.yemen,
    "Jordanian",
    "Omanian",
    "Palastanian",
    "Amarican",
    "Egyption",
    "Iraqi",
    "Syrian",
    "UAE",
    "Sudanese",
    "Pakistani",
    "Marroco",
  ];
}

List<String> gender = [
  "Male",
  "Female",
];

//TODO: Handle usedLanguage dispaly

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
