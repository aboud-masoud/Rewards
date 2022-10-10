import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/appointments/appointments_bloc.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:rewards_app/shared_widgets/custom_checkbox_buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/shared_widgets/custom_radio_buttons.dart';

class StutteringStep2View extends StatefulWidget {
  final AppointmentsBloc bloc;
  const StutteringStep2View({super.key, required this.bloc});

  @override
  State<StutteringStep2View> createState() => _StutteringStep2ViewState();
}

class _StutteringStep2ViewState extends State<StutteringStep2View> {
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
            hintMessage: AppLocalizations.of(context)!.stutteringsymptomsfirstnoted,
            option1: AppLocalizations.of(context)!.stutteringsymptomsfirstnoted1,
            option2: AppLocalizations.of(context)!.stutteringsymptomsfirstnoted2,
            option3: AppLocalizations.of(context)!.stutteringsymptomsfirstnoted3,
            option4: AppLocalizations.of(context)!.stutteringsymptomsfirstnoted4,
            selectedOption: (p0) {
              widget.bloc.whenWreTheStutteringSymptomsFirstNoted = p0;
              widget.bloc.validateFieldsStuttering2();
            },
          ),
          const SizedBox(height: 16),
          CustomRadioButtons(
            hintMessage: AppLocalizations.of(context)!.stutteringsymptomscontinued,
            option1: AppLocalizations.of(context)!.yes,
            option2: AppLocalizations.of(context)!.no,
            option3: AppLocalizations.of(context)!.stutteringsymptomscontinued1,
            option4: AppLocalizations.of(context)!.stutteringsymptomscontinued2,
            selectedOption: (p0) {
              widget.bloc.werethestutteringsymptomscontinuedchanged = p0;
              widget.bloc.validateFieldsStuttering2();
            },
          ),
          const SizedBox(height: 16),
          CustomCheckBoxButtons(
            hintMessage: AppLocalizations.of(context)!.stutteringnotedclientspeech,
            example: AppLocalizations.of(context)!.checkall,
            options: [
              AppLocalizations.of(context)!.stutteringnotedclientspeech1,
              AppLocalizations.of(context)!.stutteringnotedclientspeech2,
              AppLocalizations.of(context)!.stutteringnotedclientspeech3,
              AppLocalizations.of(context)!.stutteringnotedclientspeech4,
              AppLocalizations.of(context)!.stutteringnotedclientspeech5,
              AppLocalizations.of(context)!.stutteringnotedclientspeech6,
              AppLocalizations.of(context)!.other,
            ],
            selectedOptions: (p0) {
              for (var x in p0) {
                widget.bloc.whatAreTheNotedStutteringBehaviorsClientSpeech =
                    "${widget.bloc.whatAreTheNotedStutteringBehaviorsClientSpeech}, $x";
              }
              widget.bloc.validateFieldsStuttering2();
            },
          ),
          const SizedBox(height: 16),
          CustomCheckBoxButtons(
            hintMessage: AppLocalizations.of(context)!.behaviorsassociated,
            example: AppLocalizations.of(context)!.checkall,
            options: [
              AppLocalizations.of(context)!.behaviorsassociated1,
              AppLocalizations.of(context)!.behaviorsassociated2,
              AppLocalizations.of(context)!.behaviorsassociated3,
              AppLocalizations.of(context)!.behaviorsassociated4,
            ],
            selectedOptions: (p0) {
              for (var x in p0) {
                widget.bloc.areAnyOfTheseBehaviorsAssociatedWithTheStutteringMoment =
                    "${widget.bloc.areAnyOfTheseBehaviorsAssociatedWithTheStutteringMoment}, $x";
              }
              widget.bloc.validateFieldsStuttering2();
            },
          ),
          const SizedBox(height: 16),
          CustomRadioButtons(
            hintMessage: AppLocalizations.of(context)!.stutteringmomentsbehaviorsclient,
            option1: AppLocalizations.of(context)!.stutteringmomentsbehaviorsclient1,
            option2: AppLocalizations.of(context)!.stutteringmomentsbehaviorsclient2,
            selectedOption: (p0) {
              widget.bloc.areTheStutteringMomentsBehaviorsThatTheClientExperienceSeems = p0;
              widget.bloc.validateFieldsStuttering2();
            },
          ),
          const SizedBox(height: 16),
          CustomRadioButtons(
            hintMessage: AppLocalizations.of(context)!.notemomentsstuttering,
            option1: AppLocalizations.of(context)!.notemomentsstuttering1,
            option2: AppLocalizations.of(context)!.notemomentsstuttering2,
            option3: AppLocalizations.of(context)!.notemomentsstuttering3,
            option4: AppLocalizations.of(context)!.notemomentsstuttering4,
            selectedOption: (p0) {
              widget.bloc.asYouNoteTheStutteringMomentsClientsSpeechAppear = p0;
              widget.bloc.validateFieldsStuttering2();
            },
          ),
          const SizedBox(height: 16),
          CustomRadioButtons(
            hintMessage: AppLocalizations.of(context)!.stutteringmomentmoment,
            option1: AppLocalizations.of(context)!.stutteringmomentmoment1,
            option2: AppLocalizations.of(context)!.stutteringmomentmoment2,
            option3: AppLocalizations.of(context)!.stutteringmomentmoment4,
            selectedOption: (p0) {
              widget.bloc.duringTheStutteringMomentTheClientYouWill = p0;
              widget.bloc.validateFieldsStuttering2();
            },
          ),
          const SizedBox(height: 16),
          CustomRadioButtons(
            hintMessage: AppLocalizations.of(context)!.stutteringseverityamong,
            option1: AppLocalizations.of(context)!.yes,
            option2: AppLocalizations.of(context)!.no,
            option3: AppLocalizations.of(context)!.maybe,
            selectedOption: (p0) {
              widget.bloc.isStutteringSeverityChangeAmongPlacesSituations = p0;
              widget.bloc.validateFieldsStuttering2();
            },
          ),
          const SizedBox(height: 16),
          CustomRadioButtons(
            hintMessage: AppLocalizations.of(context)!.similardisorderspeech,
            option1: AppLocalizations.of(context)!.yes,
            option2: AppLocalizations.of(context)!.no,
            selectedOption: (p0) {
              widget.bloc.isThereAnySimilarSpeechDisorderNotedFamily = p0;
              widget.bloc.validateFieldsStuttering2();
            },
          ),
          CustomRadioButtons(
            hintMessage: AppLocalizations.of(context)!.stutteringsymptomsassociatedlanguage,
            option1: AppLocalizations.of(context)!.yes,
            option2: AppLocalizations.of(context)!.no,
            selectedOption: (p0) {
              widget.bloc.wasTheBeginningOfStutteringSymptomsAssociatedWithLanguageSpeechDifficulty = p0;
              widget.bloc.validateFieldsStuttering2();
            },
          ),
          CustomRadioButtons(
            hintMessage: AppLocalizations.of(context)!.handclient,
            option1: AppLocalizations.of(context)!.right,
            option2: AppLocalizations.of(context)!.left,
            option3: AppLocalizations.of(context)!.both,
            selectedOption: (p0) {
              widget.bloc.preferableHandForTheClient = p0;
              widget.bloc.validateFieldsStuttering2();
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
