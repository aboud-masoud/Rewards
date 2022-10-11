import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/appointments/appointments_bloc.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/shared_widgets/custom_checkbox_buttons.dart';
import 'package:rewards_app/shared_widgets/custom_radio_buttons.dart';
import 'package:rewards_app/shared_widgets/custom_textEditor_widget.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_widget.dart';

class LanguageStep3View extends StatefulWidget {
  final AppointmentsBloc bloc;
  const LanguageStep3View({super.key, required this.bloc});

  @override
  State<LanguageStep3View> createState() => _LanguageStep3ViewState();
}

class _LanguageStep3ViewState extends State<LanguageStep3View> {
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
          CustomRadioButtons(
            hintMessage: AppLocalizations.of(context)!.birthgenre,
            option1: AppLocalizations.of(context)!.natural,
            option2: AppLocalizations.of(context)!.cesarean,
            selectedOption: (p0) {
              widget.bloc.birthGenre = p0;
              widget.bloc.validateFieldsLang3();
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: widget.bloc.birthWeightController,
            hintText: AppLocalizations.of(context)!.birthweight,
            keyboardType: TextInputType.name,
            onChange: (value) => widget.bloc.validateFieldsLang3(),
          ),
          const SizedBox(height: 16),
          CustomTextEditorField(
            controller: widget.bloc.wereThereAnyComplicationsDuringPregnancyOrDeliverytController,
            hintText: AppLocalizations.of(context)!.complicationsduringpregnancy,
            onChange: (value) => widget.bloc.validateFieldsLang3(),
          ),
          const SizedBox(height: 16),
          CustomCheckBoxButtons(
            hintMessage: AppLocalizations.of(context)!.childexperienced,
            options: [
              AppLocalizations.of(context)!.childexperienced1,
              AppLocalizations.of(context)!.childexperienced2,
              AppLocalizations.of(context)!.childexperienced3,
              AppLocalizations.of(context)!.childexperienced4,
              AppLocalizations.of(context)!.childexperienced5,
              AppLocalizations.of(context)!.childexperienced6,
            ],
            selectedOptions: (p0) {
              for (var x in p0) {
                widget.bloc.hasYourChildExperiencedAnyOfThese = "${widget.bloc.hasYourChildExperiencedAnyOfThese}, $x";
              }
              widget.bloc.validateFieldsLang3();
            },
          ),
          const SizedBox(height: 16),
          CustomTextEditorField(
            controller: widget.bloc.doesYourChildUseAnyMedicationsRegularlyFrequentlyController,
            hintText: AppLocalizations.of(context)!.doestheclientuseanymedicationsregularlyfrequently,
            onChange: (value) => widget.bloc.validateFieldsLang3(),
          ),
          const SizedBox(height: 16),
          CustomRadioButtons(
            hintMessage:
                AppLocalizations.of(context)!.doestheclienthaveanydifficultiesinvisionhearingoranyothersensationissues,
            option1: AppLocalizations.of(context)!.yes,
            option2: AppLocalizations.of(context)!.no,
            selectedOption: (p0) {
              widget.bloc.hasYourChildHadVisionProblems = p0;
              widget.bloc.validateFieldsLang3();
            },
          ),
          const SizedBox(height: 16),
          CustomCheckBoxButtons(
            hintMessage: AppLocalizations.of(context)!.delaydevelopmental,
            example: AppLocalizations.of(context)!.delaydevelopmentalexample,
            options: [
              AppLocalizations.of(context)!.delaydevelopmental1,
              AppLocalizations.of(context)!.delaydevelopmental2,
              AppLocalizations.of(context)!.delaydevelopmental3,
              AppLocalizations.of(context)!.delaydevelopmental4,
              AppLocalizations.of(context)!.delaydevelopmental5,
            ],
            selectedOptions: (p0) {
              for (var x in p0) {
                widget.bloc.didYourChildDelayInAnyOfTheseDevelopmentalStages =
                    "${widget.bloc.didYourChildDelayInAnyOfTheseDevelopmentalStages}, $x";
              }
              widget.bloc.validateFieldsLang3();
            },
          ),
          const SizedBox(height: 16),
          CustomCheckBoxButtons(
            hintMessage: AppLocalizations.of(context)!.skillschildachieves,
            options: [
              AppLocalizations.of(context)!.skillschildachieves1,
              AppLocalizations.of(context)!.skillschildachieves2,
              AppLocalizations.of(context)!.skillschildachieves3,
              AppLocalizations.of(context)!.skillschildachieves4,
              AppLocalizations.of(context)!.skillschildachieves5,
              AppLocalizations.of(context)!.skillschildachieves6,
            ],
            selectedOptions: (p0) {
              for (var x in p0) {
                widget.bloc.checkTheSkillsThatYourChildAchievesIndependently =
                    "${widget.bloc.checkTheSkillsThatYourChildAchievesIndependently}, $x";
              }
              widget.bloc.validateFieldsLang3();
            },
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
