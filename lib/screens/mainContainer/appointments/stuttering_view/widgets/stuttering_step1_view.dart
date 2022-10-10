import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/appointments/appointments_bloc.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:rewards_app/shared_widgets/custom_radio_buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_widget.dart';

class StutteringStep1View extends StatefulWidget {
  final AppointmentsBloc bloc;
  const StutteringStep1View({super.key, required this.bloc});

  @override
  State<StutteringStep1View> createState() => _StutteringStep1ViewState();
}

class _StutteringStep1ViewState extends State<StutteringStep1View> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 16),
          CustomRadioButtons(
            hintMessage: AppLocalizations.of(context)!.usedlanguagewiththeclientathome,
            option1: AppLocalizations.of(context)!.arabic,
            option2: AppLocalizations.of(context)!.english,
            option3: AppLocalizations.of(context)!.other,
            selectedOption: (p0) {
              widget.bloc.usedLanguageWithTheClientAtHome = p0;
              widget.bloc.validateFieldsStuttering1();
            },
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: widget.bloc.parentsOccupationController,
            hintText: AppLocalizations.of(context)!.parentsoccupation,
            keyboardType: TextInputType.name,
            onChange: (value) => widget.bloc.validateFieldsStuttering1(),
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: widget.bloc.clientsSiblingsAndHisRanknController,
            hintText: AppLocalizations.of(context)!.siblingsandhisrank,
            exampleText: AppLocalizations.of(context)!.siblingsandhisrankexample,
            keyboardType: TextInputType.name,
            onChange: (value) => widget.bloc.validateFieldsStuttering1(),
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
