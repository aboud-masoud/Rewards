import 'package:flutter/material.dart';
import 'package:rewards_app/screens/signup/signup_bloc.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Step2View extends StatelessWidget {
  final SignUpBloc bloc;

  const Step2View({required this.bloc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: bloc.complaintController,
          hintText: AppLocalizations.of(context)!.complaint,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.info),
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: bloc.problemFirstNotedController,
          hintText: AppLocalizations.of(context)!.problemFirstNoted,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.info),
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: bloc.speechassessmentController,
          hintText: AppLocalizations.of(context)!.speechassessment,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.info),
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: bloc.diagnosedController,
          hintText: AppLocalizations.of(context)!.diagnosed,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.info),
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: bloc.disordersfamilyController,
          hintText: AppLocalizations.of(context)!.disordersfamily,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.info),
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: bloc.enrolledController,
          hintText: AppLocalizations.of(context)!.enrolledpreviously,
          keyboardType: TextInputType.name,
          prefixIcon: const Icon(Icons.info),
          onChange: (value) => bloc.validateFields(),
        ),
        const SizedBox(height: 16),
        CustomButtonWidget(
          title: AppLocalizations.of(context)!.next,
          isButtonRounded: true,
          backgroundColor: const Color(0xff419aff),
          onPress: () {
            bloc.stepNumberNotifier.value = bloc.stepNumberNotifier.value + 1;
          },
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
