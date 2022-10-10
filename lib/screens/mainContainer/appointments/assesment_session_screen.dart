import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/screens/mainContainer/appointments/language_view/language_screen.dart';
import 'package:rewards_app/screens/mainContainer/appointments/stuttering_view/stuttering_screen.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

class AssesmentSessionScreen extends StatelessWidget {
  const AssesmentSessionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: AppLocalizations.of(context)!.evaluationSession,
          style: CustomTextStyle().semibold(size: 16, color: const Color(0xff707070)),
        ),
        backgroundColor: const Color(0x00ffffff),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 350,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/language_pic.png",
                    width: 150,
                  ),
                  const SizedBox(height: 8),
                  CustomText(
                    title: AppLocalizations.of(context)!.languageDelay,
                    style: CustomTextStyle().bold(size: 20, color: const Color(0xff419aff)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 32, right: 32, bottom: 8),
                    child: CustomText(
                      title: AppLocalizations.of(context)!.languageDelaydesc,
                      maxLins: 3,
                      textAlign: TextAlign.center,
                      shouldFit: false,
                      style: CustomTextStyle().medium(size: 13, color: const Color(0xffababab)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) {
                          return LanguageScreen();
                        }),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: const Color(0xff419aff)),
                    child: CustomText(
                      title: AppLocalizations.of(context)!.getstart,
                      style: CustomTextStyle().medium(size: 16, color: const Color(0xffffffff)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 350,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Image.asset(
                    "assets/images/Stammering_pic.png",
                    width: 150,
                  ),
                  const SizedBox(height: 8),
                  CustomText(
                    title: AppLocalizations.of(context)!.stammering,
                    style: CustomTextStyle().bold(size: 20, color: const Color(0xff419aff)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 32, right: 32, bottom: 8),
                    child: CustomText(
                      title: AppLocalizations.of(context)!.stammeringdesc,
                      maxLins: 3,
                      textAlign: TextAlign.center,
                      shouldFit: false,
                      style: CustomTextStyle().medium(size: 13, color: const Color(0xffababab)),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) {
                          return StutteringScreen();
                        }),
                      );
                    },
                    style: ElevatedButton.styleFrom(primary: const Color(0xff419aff)),
                    child: CustomText(
                      title: AppLocalizations.of(context)!.getstart,
                      style: CustomTextStyle().medium(size: 16, color: const Color(0xffffffff)),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
