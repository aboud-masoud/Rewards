import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/appointments/appointments_bloc.dart';
import 'package:rewards_app/screens/mainContainer/main_container.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:rewards_app/shared_widgets/custom_checkbox_buttons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/shared_widgets/custom_radio_buttons.dart';
import 'package:rewards_app/shared_widgets/custom_textEditor_widget.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

class StutteringStep4View extends StatefulWidget {
  final AppointmentsBloc bloc;
  const StutteringStep4View({super.key, required this.bloc});

  @override
  State<StutteringStep4View> createState() => _StutteringStep4ViewState();
}

class _StutteringStep4ViewState extends State<StutteringStep4View> {
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
            hintMessage: AppLocalizations.of(context)!.howdoestheclientcommunicatemostofthetime,
            example: AppLocalizations.of(context)!.checkall,
            options: [
              AppLocalizations.of(context)!.howdoestheclientcommunicatemostofthetime1,
              AppLocalizations.of(context)!.howdoestheclientcommunicatemostofthetime2,
              AppLocalizations.of(context)!.howdoestheclientcommunicatemostofthetime3,
            ],
            selectedOptions: (p0) {
              for (var x in p0) {
                widget.bloc.howDoesTheClientCommunicateTime = "${widget.bloc.howDoesTheClientCommunicateTime}, $x";
              }
              widget.bloc.validateFieldsStuttering4();
            },
          ),
          const SizedBox(height: 16),
          CustomTextEditorField(
            controller: widget.bloc.describeClientsBehaviorController,
            hintText: AppLocalizations.of(context)!.describeingeneralclientsbehavior,
            onChange: (value) => widget.bloc.validateFieldsStuttering4(),
          ),
          const SizedBox(height: 16),
          CustomTextEditorField(
            controller: widget.bloc.describeClientsfocusController,
            hintText: AppLocalizations.of(context)!.describeclientsfocusandattention,
            onChange: (value) => widget.bloc.validateFieldsStuttering4(),
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
            onChange: (value) => widget.bloc.validateFieldsStuttering4(),
          ),
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
                    await widget.bloc.bookStuttering().then((value) {
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
