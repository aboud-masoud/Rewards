import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/appointments/appointments_bloc.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:rewards_app/shared_widgets/custom_textEditor_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StutteringStep3View extends StatefulWidget {
  final AppointmentsBloc bloc;
  const StutteringStep3View({super.key, required this.bloc});

  @override
  State<StutteringStep3View> createState() => _StutteringStep3ViewState();
}

class _StutteringStep3ViewState extends State<StutteringStep3View> {
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
            controller: widget.bloc.doesYourChildUseAnyMedicationsRegularlyFrequentlyController,
            hintText: AppLocalizations.of(context)!.doesclientmedications,
            onChange: (value) => widget.bloc.validateFieldsStuttering3(),
          ),
          const SizedBox(height: 16),
          CustomTextEditorField(
            controller: widget.bloc.doesTheClientHaveAnyDifficultiesVisionHearingSensation,
            hintText: AppLocalizations.of(context)!.doesclientdifficulties,
            onChange: (value) => widget.bloc.validateFieldsStuttering3(),
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
