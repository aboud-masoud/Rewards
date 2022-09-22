import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/main_container.dart';
import 'package:rewards_app/screens/signup/signup_bloc.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/shared_widgets/custom_textEditor_widget.dart';
import 'package:rewards_app/shared_widgets/custom_textfield_dropdown_widget.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:rewards_app/utils/global_value.dart';

class Step4View extends StatelessWidget {
  final SignUpBloc bloc;

  const Step4View({required this.bloc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 16),
      ValueListenableBuilder(
          valueListenable: bloc.howdoestheclientcommunicatemostofthetimeValue,
          builder: (context, snapshot, child) {
            return CustomTextFieldWithDropDown(
              prefixIcon: const Icon(Icons.note),
              hintMessage: AppLocalizations.of(context)!.howdoestheclientcommunicatemostofthetime,
              value: bloc.howdoestheclientcommunicatemostofthetimeValue.value,
              items: howdoestheclientcommunicatemostofthetime,
              onChanged: (value) {
                bloc.howdoestheclientcommunicatemostofthetimeValue.value = value!;
                bloc.validateFields();
              },
            );
          }),
      const SizedBox(height: 16),
      CustomTextEditorField(
        controller: bloc.describeingeneralclientsbehavior,
        hintText: AppLocalizations.of(context)!.describeingeneralclientsbehavior,
        onChange: (value) => bloc.validateFields(),
      ),
      const SizedBox(height: 16),
      CustomTextEditorField(
        controller: bloc.describeclientsfocusandattention,
        hintText: AppLocalizations.of(context)!.describeclientsfocusandattention,
        onChange: (value) => bloc.validateFields(),
      ),
      const SizedBox(height: 16),
      CustomTextEditorField(
        controller: bloc.wouldyouliketoaddanyadditionalinformation,
        hintText: AppLocalizations.of(context)!.wouldyouliketoaddanyadditionalinformation,
        onChange: (value) => bloc.validateFields(),
      ),
      const SizedBox(height: 16),
      ValueListenableBuilder<bool>(
          valueListenable: bloc.fieldsValidation,
          builder: (context, snapshot, child) {
            return CustomButtonWidget(
              title: AppLocalizations.of(context)!.submit,
              isButtonRounded: true,
              backgroundColor: const Color(0xff419aff),
              onPress: () async {
                await bloc.signUp().then((value) {
                  if (value) {
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) {
                      return const MainContainer();
                    }), (route) => false);
                  }
                });
              },
            );
          }),
      const SizedBox(height: 20),
      ValueListenableBuilder<SignUpStatusEnum>(
          valueListenable: bloc.signupStatus,
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
      const SizedBox(height: 20),
    ]);
  }
}
