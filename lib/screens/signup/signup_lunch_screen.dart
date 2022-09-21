import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/screens/signup/signup_screen.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:rewards_app/utils/network_info_service.dart';

class SignupLunchScreen extends StatelessWidget {
  const SignupLunchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          title: AppLocalizations.of(context)!.signup,
          style: CustomTextStyle()
              .semibold(size: 16, color: const Color(0xff707070)),
        ),
        backgroundColor: const Color(0x00ffffff),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/language_pic.png",
                  width: 150,
                ),
                const SizedBox(height: 8),
                CustomText(
                  title: AppLocalizations.of(context)!.languageDelay,
                  style: CustomTextStyle()
                      .bold(size: 20, color: const Color(0xff419aff)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 32, right: 32, bottom: 16),
                  child: CustomText(
                    title: AppLocalizations.of(context)!.languageDelaydesc,
                    maxLins: 3,
                    textAlign: TextAlign.center,
                    shouldFit: false,
                    style: CustomTextStyle()
                        .medium(size: 13, color: const Color(0xffababab)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) {
                        return SignUpScreen(
                          signupStatus: SignupStatusEnum.language,
                        );
                      }),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xff419aff)),
                  child: CustomText(
                    title: AppLocalizations.of(context)!.getstart,
                    style: CustomTextStyle()
                        .medium(size: 16, color: const Color(0xffffffff)),
                  ),
                )
              ],
            ),
          ),
          Expanded(
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
                  style: CustomTextStyle()
                      .bold(size: 20, color: const Color(0xff419aff)),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 32, right: 32, bottom: 16),
                  child: CustomText(
                    title: AppLocalizations.of(context)!.stammeringdesc,
                    maxLins: 3,
                    textAlign: TextAlign.center,
                    shouldFit: false,
                    style: CustomTextStyle()
                        .medium(size: 13, color: const Color(0xffababab)),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) {
                        return SignUpScreen(
                          signupStatus: SignupStatusEnum.stammering,
                        );
                      }),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xff419aff)),
                  child: CustomText(
                    title: AppLocalizations.of(context)!.getstart,
                    style: CustomTextStyle()
                        .medium(size: 16, color: const Color(0xffffffff)),
                  ),
                )
              ],
            ),
          ),
          TextButton(
            onPressed: () async {
              if (await NetworkInfoService().isConnected()) {
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      AppLocalizations.of(context)!.checkInternetConnection),
                ));
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.alreadyHaveanAccount,
                  style: CustomTextStyle()
                      .semibold(size: 14, color: const Color(0xff404040)),
                ),
                Text(
                  AppLocalizations.of(context)!.loginbutton,
                  style: CustomTextStyle()
                      .semibold(size: 14, color: const Color(0xff3bbc28)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
