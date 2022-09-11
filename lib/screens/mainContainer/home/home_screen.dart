import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/home/widgets/banner_view.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00ffffff),
        elevation: 0,
        title: Container(
          color: const Color(0x00ffffff),
          child: Row(
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 48,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: AppLocalizations.of(context)!.amwajCenter,
                    style: CustomTextStyle().semibold(size: 16, color: const Color(0xff3bbc28)),
                  ),
                  CustomText(
                    title: AppLocalizations.of(context)!.amwajCentersubtitle,
                    style: CustomTextStyle().medium(size: 12, color: const Color(0xff707070)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: const [
          HomeBannerView(),
        ],
      ),
    );
  }
}
