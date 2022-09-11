import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

class FollowView extends StatelessWidget {
  const FollowView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        CustomText(
          title: AppLocalizations.of(context)!.followus,
          shouldFit: false,
          style: CustomTextStyle().medium(
            size: 12,
            color: const Color(0xff419aff),
          ),
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              child: Image.asset(
                "assets/images/facebook.png",
                height: 25,
              ),
            ),
            Expanded(
              child: Image.asset(
                "assets/images/instagram.png",
                height: 25,
              ),
            ),
            Expanded(
              child: Image.asset(
                "assets/images/snapchat.png",
                height: 25,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
