import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/appointments/appointments_bloc.dart';
import 'package:rewards_app/screens/mainContainer/appointments/language_view/widgets/language_step1_view.dart';
import 'package:rewards_app/screens/mainContainer/appointments/language_view/widgets/language_step2_view.dart';
import 'package:rewards_app/screens/mainContainer/appointments/language_view/widgets/language_step3_view.dart';
import 'package:rewards_app/screens/mainContainer/appointments/header_view.dart';
import 'package:rewards_app/screens/mainContainer/appointments/language_view/widgets/language_step4_view.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageScreen extends StatelessWidget {
  LanguageScreen({super.key});

  final _bloc = AppointmentsBloc();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: const Color(0xfff9f9f9),
        appBar: AppBar(
          title: CustomText(
            title: AppLocalizations.of(context)!.languageDelay,
            style: CustomTextStyle().semibold(size: 16, color: const Color(0xff707070)),
          ),
          backgroundColor: const Color(0xfff9f9f9),
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: ValueListenableBuilder<int>(
            valueListenable: _bloc.stepNumberNotifier,
            builder: (context, snapshot, child) {
              return Column(
                children: [
                  SizedBox(height: 68, child: HeaderView(bloc: _bloc, isItLanguage: true)),
                  Expanded(
                    child: returnCorrectStepView(snapshot, _bloc),
                  )
                ],
              );
            }),
      ),
    );
  }

  Widget returnCorrectStepView(int index, AppointmentsBloc bloc) {
    if (index == 1) {
      return LanguageStep1View(bloc: bloc);
    } else if (index == 2) {
      return LanguageStep2View(bloc: bloc);
    } else if (index == 3) {
      return LanguageStep3View(bloc: bloc);
    } else {
      return LanguageStep4View(bloc: bloc);
    }
  }
}
