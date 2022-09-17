import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/main_container.dart';
import 'package:rewards_app/screens/signup/signup_bloc.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Step4View extends StatelessWidget {
  final SignUpBloc bloc;

  const Step4View({required this.bloc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 16),
      CustomButtonWidget(
        title: AppLocalizations.of(context)!.next,
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
      ),
      const SizedBox(height: 20),
    ]);
  }
}
