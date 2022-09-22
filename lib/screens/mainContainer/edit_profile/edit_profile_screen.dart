import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rewards_app/screens/mainContainer/edit_profile/edit_profile_bloc.dart';
import 'package:rewards_app/screens/mainContainer/profile/profile_bloc.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_dropdown_widget.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_widget.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/utils/global_value.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final _bloc = EditProfileBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: const Color(0x00ffffff),
        title: CustomText(
          title: AppLocalizations.of(context)!.editprofile,
          style: CustomTextStyle().semibold(size: 16, color: const Color(0xff707070)),
        ),
        actions: [
          SizedBox(
            width: 75,
            child: ValueListenableBuilder<bool>(
                valueListenable: _bloc.fieldsValidation,
                builder: (context, snapshot, child) {
                  print(snapshot);
                  return IconButton(
                      onPressed: snapshot
                          ? () async {
                              await _bloc.updateProfileInformation().then((value) => Navigator.of(context).pop());
                            }
                          : null,
                      icon: Row(
                        children: [
                          Icon(
                            Icons.check,
                            color: snapshot ? const Color(0xff419aff) : const Color(0x00419aff),
                          ),
                          CustomText(
                            title: AppLocalizations.of(context)!.save,
                            style: CustomTextStyle().semibold(
                                size: 14, color: snapshot ? const Color(0xff419aff) : const Color(0x00419aff)),
                          )
                        ],
                      ));
                }),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: StreamBuilder(
              stream: _bloc.profile.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs.singleWhere((element) => element.id == userEmail);

                  if (_bloc.openPageForTheFirstTime) {
                    _bloc.openPageForTheFirstTime = false;
                    _bloc.fullNameController.text = documentSnapshot["full name"];
                    _bloc.dateOfBirthController.text = documentSnapshot["Date Of Birth"];
                    _bloc.nationalityValue.value = documentSnapshot["Nationality"];
                    _bloc.genderValue.value = documentSnapshot["Gender"];
                    _bloc.addressController.text = documentSnapshot["Address"];
                    _bloc.usedLanguageValue.value = documentSnapshot["Used language with the client at home"];
                    _bloc.mobileNumberController.text = documentSnapshot["Mobile Number"];
                    _bloc.parentOcupationValue.value = documentSnapshot["Parents occupation"];
                    _bloc.hisrankController.text = documentSnapshot["siblings and his rank"];
                    _bloc.kinshipValue.value = documentSnapshot["Is there any kinship between parents?"];
                    _bloc.foundCountactValue.value = documentSnapshot["You found contact us via"];
                    _bloc.whatIsYourComplaintBriefly = documentSnapshot["What is your complaint? briefly"];
                    _bloc.whenTheProblemWasFirstNoted = documentSnapshot["When the problem was first noted?"];
                    _bloc.doesTheChildHaveAPreviousLanguageAndSpeechAssessmentWhatWasTheResult = documentSnapshot[
                        "Does the child have a previous language and speech assessment? What was the Result?"];
                    _bloc.hasYourChildBeenDiagnosedWithAnyOfThese =
                        documentSnapshot["Has your child been diagnosed with any of these?"];
                    _bloc.isThereAnySimilarLanguageOrSpeechDisordersNotedInTheFamily =
                        documentSnapshot["Is there any similar language or speech disorders noted in the family?"];
                    _bloc.hadYourChildEnrolledPreviouslyInAnyRehabilitationPrograms = documentSnapshot[
                        "Had your child enrolled previously in any rehabilitation programs (occupational therapy, physical therapy, behavioral modification…)? And how was his her progress?"];
                    _bloc.firstEvaluationDate = documentSnapshot["1 st Evaluation Date"];
                    _bloc.firstTherapeuticSessionDate = documentSnapshot["1 st Therapeutic Session Date"];
                    _bloc.therapeuticName = documentSnapshot["Therapeutic Name"];
                    _bloc.birthGenre = documentSnapshot["birthGenre"];
                    _bloc.birthWeight = documentSnapshot["birthWeight"];
                    _bloc.wereThereAnyComplicationsDuringPregnancyOrDeliveryExplain =
                        documentSnapshot["Were there any complications during pregnancy or delivery? Explain"];
                    _bloc.hasYourChildExperiencedAnyOfThese =
                        documentSnapshot["Has your child experienced any of these?"];
                    _bloc.doesYourChildUseAnyMedicationsRegularlyFrequentlyMention =
                        documentSnapshot["Does your child use any medications regularly-frequently? Mention"];
                    _bloc.hasYourChildHadAVisionHearingProblemsOrAnyOtherSensoryIssues =
                        documentSnapshot["Has your child had a vision, hearing problems, or any other sensory issues?"];
                    _bloc.didYourChildDelayInAnyOfTheseDevelopmentalStages =
                        documentSnapshot["Did your child delay in any of these developmental stages?"];
                    _bloc.checkTheSkillsThatYourChildAchievesIndependently =
                        documentSnapshot["Check the skills, that your child achieves independently"];
                    _bloc.howDoesYourChildCommunicateMostOfTheTime =
                        documentSnapshot["How does your child communicate, most of the time?"];
                    _bloc.recentlyYourChildsSpeechIs = documentSnapshot["Recently, your child’s speech is"];
                    _bloc.whenYourChildDidProduceHisFirstWord =
                        documentSnapshot["When your child did produce his first word?"];
                    _bloc.doesTheChildUseAnyUtterancesInHisSpeechGiveExample =
                        documentSnapshot["Does the child use any utterances in his speech? Give example"];
                    _bloc.describeYourChildReceptiveLanguage =
                        documentSnapshot["Describe your child’s receptive language"];
                    _bloc.describeYourChildExpressiveLanguage =
                        documentSnapshot["Describe your child’s expressive language"];
                    _bloc.describeYourChildBehavior = documentSnapshot["Describe your child’s behavior"];
                    _bloc.describeYourChildFocusAndAttention =
                        documentSnapshot["Describe your child’s focus and attention"];
                    _bloc.describeYourChildPlayShareActivitiesSymbolicPlayAndRolePlay =
                        documentSnapshot["Describe your child’s play, share activities, symbolic play and role play"];
                    _bloc.howMuchTimeYourChildSpendsOnTVSmartDevices =
                        documentSnapshot["How much time your child spends on TV smart devices?"];
                    _bloc.wouldYouLikeToAddAnyAdditionalInformation =
                        documentSnapshot["Would you like to add any additional information?"];
                  }

                  return Column(
                    children: [
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: _bloc.fullNameController,
                        hintText: AppLocalizations.of(context)!.name_hint,
                        keyboardType: TextInputType.name,
                        prefixIcon: const Icon(Icons.person),
                        onChange: (value) => _bloc.validateFields(),
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                          controller: _bloc.dateOfBirthController,
                          readOnly: true,
                          hintText: AppLocalizations.of(context)!.dateofBirth,
                          keyboardType: TextInputType.datetime,
                          prefixIcon: const Icon(Icons.date_range),
                          onChange: (value) => _bloc.validateFields(),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime(2101));
                            if (pickedDate != null) {
                              String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                              // setState(() {
                              _bloc.dateOfBirthController.text = formattedDate; //set output date to TextField value.
                              // });
                            } else {
                              print("Date is not selected");
                            }
                          }),
                      const SizedBox(height: 16),
                      ValueListenableBuilder(
                          valueListenable: _bloc.nationalityValue,
                          builder: (context, snapshot, child) {
                            return CustomTextFieldWithDropDown(
                              prefixIcon: const Icon(Icons.nature_outlined),
                              hintMessage: AppLocalizations.of(context)!.nationality,
                              value: _bloc.nationalityValue.value,
                              items: nationality,
                              onChanged: (value) {
                                _bloc.nationalityValue.value = value!;
                                _bloc.validateFields();
                              },
                            );
                          }),
                      const SizedBox(height: 16),
                      ValueListenableBuilder(
                          valueListenable: _bloc.genderValue,
                          builder: (context, snapshot, child) {
                            return CustomTextFieldWithDropDown(
                              prefixIcon: const Icon(Icons.type_specimen),
                              hintMessage: AppLocalizations.of(context)!.gender,
                              value: _bloc.genderValue.value,
                              items: gender,
                              onChanged: (value) {
                                _bloc.genderValue.value = value!;
                                _bloc.validateFields();
                              },
                            );
                          }),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: _bloc.addressController,
                        hintText: AppLocalizations.of(context)!.address,
                        keyboardType: TextInputType.name,
                        prefixIcon: const Icon(Icons.location_city),
                        onChange: (value) => _bloc.validateFields(),
                      ),
                      const SizedBox(height: 16),
                      ValueListenableBuilder(
                          valueListenable: _bloc.usedLanguageValue,
                          builder: (context, snapshot, child) {
                            return CustomTextFieldWithDropDown(
                              prefixIcon: const Icon(Icons.language),
                              hintMessage: AppLocalizations.of(context)!.usedlanguagewiththeclientathome,
                              value: _bloc.usedLanguageValue.value,
                              items: usedLanguage,
                              onChanged: (value) {
                                _bloc.usedLanguageValue.value = value!;
                                _bloc.validateFields();
                              },
                            );
                          }),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: _bloc.mobileNumberController,
                        hintText: AppLocalizations.of(context)!.mobileNumber,
                        keyboardType: TextInputType.phone,
                        prefixIcon: const Icon(Icons.phone),
                        onChange: (value) => _bloc.validateFields(),
                      ),
                      const SizedBox(height: 16),
                      ValueListenableBuilder(
                          valueListenable: _bloc.parentOcupationValue,
                          builder: (context, snapshot, child) {
                            return CustomTextFieldWithDropDown(
                              prefixIcon: const Icon(Icons.person),
                              hintMessage: AppLocalizations.of(context)!.parentsoccupation,
                              value: _bloc.parentOcupationValue.value,
                              items: parentOcupation,
                              onChanged: (value) {
                                _bloc.parentOcupationValue.value = value!;
                                _bloc.validateFields();
                              },
                            );
                          }),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: _bloc.hisrankController,
                        hintText: AppLocalizations.of(context)!.siblingsandhisrank,
                        keyboardType: TextInputType.name,
                        prefixIcon: const Icon(Icons.percent),
                        onChange: (value) => _bloc.validateFields(),
                      ),
                      const SizedBox(height: 16),
                      ValueListenableBuilder(
                          valueListenable: _bloc.kinshipValue,
                          builder: (context, snapshot, child) {
                            return CustomTextFieldWithDropDown(
                              prefixIcon: const Icon(Icons.arrow_circle_down_sharp),
                              hintMessage: AppLocalizations.of(context)!.isthereanykinshipbetweenparents,
                              value: _bloc.kinshipValue.value,
                              items: yesnoList,
                              onChanged: (value) {
                                _bloc.kinshipValue.value = value!;
                                _bloc.validateFields();
                              },
                            );
                          }),
                      const SizedBox(height: 16),
                      ValueListenableBuilder(
                          valueListenable: _bloc.foundCountactValue,
                          builder: (context, snapshot, child) {
                            return CustomTextFieldWithDropDown(
                              prefixIcon: const Icon(Icons.contact_page),
                              hintMessage: AppLocalizations.of(context)!.youfoundcontactusvia,
                              value: _bloc.foundCountactValue.value,
                              items: foundCountact,
                              onChanged: (value) {
                                _bloc.foundCountactValue.value = value!;
                                _bloc.validateFields();
                              },
                            );
                          }),
                      const SizedBox(height: 50),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ),
      ),
    );
  }
}
