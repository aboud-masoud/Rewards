import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/appointments/appointments_bloc.dart';
import 'package:rewards_app/screens/mainContainer/main_container.dart';
import 'package:rewards_app/screens/signup/signup_bloc.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:rewards_app/shared_widgets/custom_checkbox_buttons.dart';
import 'package:rewards_app/shared_widgets/custom_radio_buttons.dart';
import 'package:rewards_app/shared_widgets/custom_textEditor_widget.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

class LanguageStep4View extends StatefulWidget {
  final AppointmentsBloc bloc;
  const LanguageStep4View({super.key, required this.bloc});

  @override
  State<LanguageStep4View> createState() => _LaguageStep4ViewState();
}

class _LaguageStep4ViewState extends State<LanguageStep4View> {
  @override
  void initState() {
    widget.bloc.fieldsValidation.value = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          CustomCheckBoxButtons(
            hintMessage: AppLocalizations.of(context)!.communicatechildtime,
            options: [
              AppLocalizations.of(context)!.communicatechildtime1,
              AppLocalizations.of(context)!.communicatechildtime2,
              AppLocalizations.of(context)!.communicatechildtime3,
              AppLocalizations.of(context)!.communicatechildtime4,
              AppLocalizations.of(context)!.communicatechildtime5,
              AppLocalizations.of(context)!.communicatechildtime6,
              AppLocalizations.of(context)!.other,
            ],
            haveOther: true,
            selectedOptions: (p0) {
              for (var x in p0) {
                widget.bloc.howDoesYourChildCommunicateMostOfTheTime =
                    "${widget.bloc.howDoesYourChildCommunicateMostOfTheTime}, $x";
              }
              widget.bloc.validateFieldsLang4();
            },
          ),
          const SizedBox(height: 16),
          CustomCheckBoxButtons(
            hintMessage: AppLocalizations.of(context)!.childspeech,
            options: [
              AppLocalizations.of(context)!.childspeech1,
              AppLocalizations.of(context)!.childspeech2,
              AppLocalizations.of(context)!.childspeech3,
              AppLocalizations.of(context)!.childspeech4,
              AppLocalizations.of(context)!.childspeech5,
              AppLocalizations.of(context)!.other,
            ],
            haveOther: true,
            selectedOptions: (p0) {
              for (var x in p0) {
                widget.bloc.recentlyYourChildsSpeechIs = "${widget.bloc.recentlyYourChildsSpeechIs}, $x";
              }
              widget.bloc.validateFieldsLang4();
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: widget.bloc.whenYourChildDidProduceHisFirstWordController,
            hintText: AppLocalizations.of(context)!.childproducefirstword,
            keyboardType: TextInputType.name,
            onChange: (value) => widget.bloc.validateFieldsLang4(),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: widget.bloc.doesTheChildUseAnyUtterancesSpeechController,
            exampleText: AppLocalizations.of(context)!.examplegive,
            hintText: AppLocalizations.of(context)!.childutterancesspeech,
            onChange: (value) => widget.bloc.validateFieldsLang4(),
          ),
          const SizedBox(height: 16),
          CustomTextEditorField(
            controller: widget.bloc.describeYourChildReceptiveLanguageController,
            hintText: AppLocalizations.of(context)!.receptivelanguage,
            onChange: (value) => widget.bloc.validateFieldsLang4(),
          ),
          const SizedBox(height: 16),
          CustomTextEditorField(
            controller: widget.bloc.describeYourChildExpressiveLanguageController,
            hintText: AppLocalizations.of(context)!.expressivelanguage,
            onChange: (value) => widget.bloc.validateFieldsLang4(),
          ),
          const SizedBox(height: 16),
          CustomTextEditorField(
            controller: widget.bloc.describeYourChildBehaviorController,
            hintText: AppLocalizations.of(context)!.behaviorchild,
            onChange: (value) => widget.bloc.validateFieldsLang4(),
          ),
          const SizedBox(height: 16),
          CustomTextEditorField(
            controller: widget.bloc.describeYourChildFocusAndAttentionController,
            hintText: AppLocalizations.of(context)!.focusattention,
            onChange: (value) => widget.bloc.validateFieldsLang4(),
          ),
          const SizedBox(height: 16),
          CustomTextEditorField(
            controller: widget.bloc.describeYourChildPlayShareActivitiesSymbolicPlayController,
            exampleText: AppLocalizations.of(context)!.pretendingexample,
            hintText: AppLocalizations.of(context)!.shareplaysymbolic,
            onChange: (value) => widget.bloc.validateFieldsLang4(),
          ),
          const SizedBox(height: 16),
          CustomTextEditorField(
            controller: widget.bloc.whatAreYourChildBestReinforcementsController,
            hintText: AppLocalizations.of(context)!.bestreinforcements,
            onChange: (value) => widget.bloc.validateFieldsLang4(),
          ),
          const SizedBox(height: 16),
          CustomCheckBoxButtons(
            hintMessage: AppLocalizations.of(context)!.childTV,
            options: [
              AppLocalizations.of(context)!.childTV1,
              AppLocalizations.of(context)!.childTV2,
              AppLocalizations.of(context)!.childTV3,
              AppLocalizations.of(context)!.childTV4,
              AppLocalizations.of(context)!.childTV5,
            ],
            selectedOptions: (p0) {
              for (var x in p0) {
                widget.bloc.howMuchTimeYourChildSpendsOnTVDevices =
                    "${widget.bloc.howMuchTimeYourChildSpendsOnTVDevices}, $x";
              }
              widget.bloc.validateFieldsLang4();
            },
          ),
          const SizedBox(height: 16),
          CustomCheckBoxButtons(
            hintMessage: AppLocalizations.of(context)!.preferredevaluationsession,
            options: [
              AppLocalizations.of(context)!.saturday,
              AppLocalizations.of(context)!.sunday,
              AppLocalizations.of(context)!.monday,
              AppLocalizations.of(context)!.tuesday,
              AppLocalizations.of(context)!.wednesday,
              AppLocalizations.of(context)!.thursday,
            ],
            selectedOptions: (p0) {
              for (var x in p0) {
                widget.bloc.preferredevaluationsession = "${widget.bloc.preferredevaluationsession}, $x";
              }
              widget.bloc.validateFieldsLang4();
            },
          ),
          const SizedBox(height: 16),
          CustomRadioButtons(
            hintMessage: AppLocalizations.of(context)!.preferredtreatmentsessions,
            option1: AppLocalizations.of(context)!.preferredtreatmentsessions1,
            option2: AppLocalizations.of(context)!.preferredtreatmentsessions2,
            option3: AppLocalizations.of(context)!.preferredtreatmentsessions3,
            option4: AppLocalizations.of(context)!.preferredtreatmentsessions4,
            selectedOption: (p0) {
              widget.bloc.preferredtreatmentsessions = p0;
              widget.bloc.validateFieldsLang4();
            },
          ),
          const SizedBox(height: 16),
          CustomTextEditorField(
            controller: widget.bloc.additionalInformationController,
            hintText: AppLocalizations.of(context)!.wouldyouliketoaddanyadditionalinformation,
            onChange: (value) => widget.bloc.validateFieldsLang4(),
          ),
          const SizedBox(height: 16),
          ValueListenableBuilder<SignUpStatusEnum>(
              valueListenable: widget.bloc.signupStatus,
              builder: (context, snapshot, child) {
                if (snapshot == SignUpStatusEnum.faild) {
                  return Text(AppLocalizations.of(context)!.errorInEmailOrPassword,
                      style: CustomTextStyle().regular(color: Colors.red, size: 18));
                } else if (snapshot == SignUpStatusEnum.inProgress) {
                  return const CircularProgressIndicator();
                } else {
                  return Container();
                }
              }),
          const SizedBox(height: 16),
          ValueListenableBuilder<bool>(
              valueListenable: widget.bloc.fieldsValidation,
              builder: (context, snapshot, child) {
                return CustomButtonWidget(
                  title: AppLocalizations.of(context)!.submit,
                  isButtonRounded: true,
                  enable: snapshot,
                  backgroundColor: const Color(0xff419aff),
                  onPress: () async {
                    await widget.bloc.bookLanguageDelay().then((value) {
                      if (value) {
                        showAlertDialog(context);
                      }
                    });
                  },
                );
              }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = CustomButtonWidget(
      title: AppLocalizations.of(context)!.okay,
      backgroundColor: const Color(0xff419aff),
      widthSize: MediaQuery.of(context).size.width,
      onPress: () {
        Navigator.of(context).pop();
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) {
          return const MainContainer();
        }), (route) => false);
      },
    );

    AlertDialog alert = AlertDialog(
      title: CustomText(
        title: AppLocalizations.of(context)!.apotmentsTitleDialog,
        maxLins: 2,
        shouldFit: false,
        style: CustomTextStyle().bold(size: 22, color: const Color(0xff404040)),
      ),
      content: CustomText(
        title: AppLocalizations.of(context)!.apotmentsDescDialog,
        maxLins: 2,
        shouldFit: false,
        style: CustomTextStyle().regular(size: 16, color: const Color(0xff404040)),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
