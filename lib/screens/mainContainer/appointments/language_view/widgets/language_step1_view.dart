import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/appointments/appointments_bloc.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:rewards_app/shared_widgets/custom_checkbox_buttons.dart';
import 'package:rewards_app/shared_widgets/custom_radio_buttons.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageStep1View extends StatefulWidget {
  final AppointmentsBloc bloc;
  const LanguageStep1View({super.key, required this.bloc});

  @override
  State<LanguageStep1View> createState() => _LanguageStep1ViewState();
}

class _LanguageStep1ViewState extends State<LanguageStep1View> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          CustomCheckBoxButtons(
            hintMessage: AppLocalizations.of(context)!.usedlanguagewiththeclientathome,
            options: [
              AppLocalizations.of(context)!.arabic,
              AppLocalizations.of(context)!.english,
              AppLocalizations.of(context)!.other,
            ],
            selectedOptions: (p0) {
              for (var x in p0) {
                widget.bloc.usedLanguageWithTheClientAtHome = "${widget.bloc.usedLanguageWithTheClientAtHome}, $x";
              }
              widget.bloc.validateFieldsLang1();
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: widget.bloc.parentsOccupationController,
            hintText: AppLocalizations.of(context)!.parentsoccupation,
            keyboardType: TextInputType.name,
            onChange: (value) => widget.bloc.validateFieldsLang1(),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: widget.bloc.clientsSiblingsAndHisRanknController,
            hintText: AppLocalizations.of(context)!.siblingsandhisrank,
            exampleText: AppLocalizations.of(context)!.siblingsandhisrankexample,
            keyboardType: TextInputType.name,
            onChange: (value) => widget.bloc.validateFieldsLang1(),
          ),
          const SizedBox(height: 16),
          CustomRadioButtons(
            hintMessage: AppLocalizations.of(context)!.isthereanykinshipbetweenparents,
            option1: AppLocalizations.of(context)!.yes,
            option2: AppLocalizations.of(context)!.no,
            selectedOption: (p0) {
              widget.bloc.isThereAnyKinshipBetweenParents = p0;
              widget.bloc.validateFieldsLang1();
            },
          ),
          const SizedBox(height: 16),
          CustomRadioButtons(
            hintMessage: AppLocalizations.of(context)!.youfoundcontactusvia,
            option1: AppLocalizations.of(context)!.previousexperience,
            option2: AppLocalizations.of(context)!.friend,
            option3: AppLocalizations.of(context)!.internetsearch,
            option4: AppLocalizations.of(context)!.advertisements,
            option5: AppLocalizations.of(context)!.other,
            selectedOption: (p0) {
              widget.bloc.youFoundCcontactUsVia = p0;
              widget.bloc.validateFieldsLang1();
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
