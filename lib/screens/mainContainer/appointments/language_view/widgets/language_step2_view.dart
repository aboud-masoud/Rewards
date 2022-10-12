import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/appointments/appointments_bloc.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:rewards_app/shared_widgets/custom_checkbox_buttons.dart';
import 'package:rewards_app/shared_widgets/custom_radio_buttons.dart';
import 'package:rewards_app/shared_widgets/custom_textEditor_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageStep2View extends StatefulWidget {
  final AppointmentsBloc bloc;
  const LanguageStep2View({super.key, required this.bloc});

  @override
  State<LanguageStep2View> createState() => _LanguageStep2ViewState();
}

class _LanguageStep2ViewState extends State<LanguageStep2View> {
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
          CustomTextEditorField(
            controller: widget.bloc.whatIsYourComplaintBrieflyController,
            hintText: AppLocalizations.of(context)!.complaint,
            onChange: (value) => widget.bloc.validateFieldsLang2(),
          ),
          const SizedBox(height: 16),
          CustomTextEditorField(
            controller: widget.bloc.whenTheProblemWasFirstNotedController,
            hintText: AppLocalizations.of(context)!.problemFirstNoted,
            onChange: (value) => widget.bloc.validateFieldsLang2(),
          ),
          const SizedBox(height: 16),
          CustomTextEditorField(
            controller: widget.bloc.doesTheChildHavePreviousLanguageAndSpeechAssessmentWhatWasTheResultController,
            hintText: AppLocalizations.of(context)!.speechassessment,
            onChange: (value) => widget.bloc.validateFieldsLang2(),
          ),
          const SizedBox(height: 16),
          CustomCheckBoxButtons(
            hintMessage: AppLocalizations.of(context)!.diagnosed,
            options: [
              AppLocalizations.of(context)!.diagnosed1,
              AppLocalizations.of(context)!.diagnosed2,
              AppLocalizations.of(context)!.diagnosed3,
              AppLocalizations.of(context)!.diagnosed4,
              AppLocalizations.of(context)!.diagnosed5,
              AppLocalizations.of(context)!.diagnosed6,
              AppLocalizations.of(context)!.diagnosed7,
              AppLocalizations.of(context)!.other,
            ],
            haveOther: true,
            selectedOptions: (p0) {
              for (var x in p0) {
                widget.bloc.hasYourChildBeenDiagnosedWithAnyOfThese =
                    "${widget.bloc.hasYourChildBeenDiagnosedWithAnyOfThese}, $x";
              }
              widget.bloc.validateFieldsLang2();
            },
          ),
          const SizedBox(height: 16),
          CustomRadioButtons(
            hintMessage: AppLocalizations.of(context)!.disordersfamily,
            option1: AppLocalizations.of(context)!.yes,
            option2: AppLocalizations.of(context)!.no,
            selectedOption: (p0) {
              widget.bloc.isThereAnySimilarLanguageOrSpeechDisordersNotedInTheFamily = p0;
              widget.bloc.validateFieldsLang2();
            },
          ),
          const SizedBox(height: 16),
          CustomTextEditorField(
            controller: widget.bloc.hadYourChildEnrolledPreviouslyInRehabilitationPrograms,
            hintText: AppLocalizations.of(context)!.enrolledpreviously,
            onChange: (value) => widget.bloc.validateFieldsLang2(),
          ),
          const SizedBox(height: 16),
          ValueListenableBuilder<bool>(
              valueListenable: widget.bloc.fieldsValidation,
              builder: (context, snapshot, child) {
                return CustomButtonWidget(
                  title: AppLocalizations.of(context)!.next,
                  isButtonRounded: true,
                  enable: snapshot,
                  backgroundColor: const Color(0xff419aff),
                  onPress: () {
                    widget.bloc.stepNumberNotifier.value = widget.bloc.stepNumberNotifier.value + 1;
                  },
                );
              }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
