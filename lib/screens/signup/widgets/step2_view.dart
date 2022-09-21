import 'package:flutter/material.dart';
import 'package:rewards_app/screens/signup/signup_bloc.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:rewards_app/shared_widgets/custom_textEditor_widget.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_dropdown_widget.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:rewards_app/utils/global_value.dart';

class Step2View extends StatelessWidget {
  final SignUpBloc bloc;

  const Step2View({required this.bloc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        CustomTextEditorField(
          controller: bloc.complaintController,
          hintText: AppLocalizations.of(context)!.complaint,
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextEditorField(
          controller: bloc.problemFirstNotedController,
          hintText: AppLocalizations.of(context)!.problemFirstNoted,
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextEditorField(
          controller: bloc.speechassessmentController,
          hintText: AppLocalizations.of(context)!.speechassessment,
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        ValueListenableBuilder(
            valueListenable: bloc.diagnosedValue,
            builder: (context, snapshot, child) {
              return CustomTextFieldWithDropDown(
                prefixIcon: const Icon(Icons.arrow_circle_down_sharp),
                hintMessage: AppLocalizations.of(context)!.diagnosed,
                value: bloc.diagnosedValue.value,
                items: diagnosed,
                onChanged: (value) {
                  bloc.diagnosedValue.value = value!;
                  bloc.validateFields();
                },
              );
            }),
        const SizedBox(height: 16),
        ValueListenableBuilder(
            valueListenable: bloc.disordersfamilyValue,
            builder: (context, snapshot, child) {
              return CustomTextFieldWithDropDown(
                prefixIcon: const Icon(Icons.arrow_circle_down_sharp),
                hintMessage: AppLocalizations.of(context)!.disordersfamily,
                value: bloc.disordersfamilyValue.value,
                items: disordersfamily,
                onChanged: (value) {
                  bloc.disordersfamilyValue.value = value!;
                  bloc.validateFields();
                },
              );
            }),
        const SizedBox(height: 16),
        CustomTextEditorField(
          controller: bloc.enrolledController,
          hintText: AppLocalizations.of(context)!.enrolledpreviously,
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        ValueListenableBuilder<bool>(
            valueListenable: bloc.fieldsValidation,
            builder: (context, snapshot, child) {
              return CustomButtonWidget(
                title: AppLocalizations.of(context)!.next,
                isButtonRounded: true,
                enable: snapshot,
                backgroundColor: const Color(0xff419aff),
                onPress: () {
                  bloc.stepNumberNotifier.value =
                      bloc.stepNumberNotifier.value + 1;
                },
              );
            }),
        const SizedBox(height: 20),
        ValueListenableBuilder<SignUpStatusEnum>(
            valueListenable: bloc.signupStatus,
            builder: (context, snapshot, child) {
              if (snapshot == SignUpStatusEnum.faild) {
                return Text(
                    AppLocalizations.of(context)!.errorInEmailOrPassword,
                    style:
                        CustomTextStyle().regular(color: Colors.red, size: 18));
              } else if (snapshot == SignUpStatusEnum.inProgress) {
                return const CircularProgressIndicator();
              } else {
                return Container();
              }
            }),
        const SizedBox(height: 20),
      ],
    );
  }
}
