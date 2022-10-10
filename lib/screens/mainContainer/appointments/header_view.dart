import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/appointments/appointments_bloc.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HeaderView extends StatelessWidget {
  final AppointmentsBloc bloc;
  final bool isItLanguage;
  const HeaderView({required this.bloc, required this.isItLanguage, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Container(
          color: const Color(0xfff9f9f9),
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(color: Color(0xffe8ebef), shape: BoxShape.circle),
                  child: Center(
                    child: Image.asset(
                      "assets/images/" + bloc.returnCorrectStepImage(),
                      width: 16,
                      height: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  color: const Color(0xfff9f9f9),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        title:
                            AppLocalizations.of(context)!.step + " " + bloc.stepNumberNotifier.value.toString() + "/4",
                        style: CustomTextStyle().medium(size: 10, color: const Color(0xffababab)),
                      ),
                      CustomText(
                        title: bloc.returnCorrectStepTitle(context, isItLanguage),
                        style: CustomTextStyle().bold(size: 16, color: const Color(0xff707070)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: bloc.valueOfProgressBar(),
          backgroundColor: const Color(0xfff9f9f9),
          color: const Color(0xff419aff),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
