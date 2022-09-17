import 'package:flutter/material.dart';
import 'package:rewards_app/screens/signup/signup_bloc.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Step3View extends StatelessWidget {
  final SignUpBloc bloc;

  const Step3View({required this.bloc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
    ]);
  }
}
