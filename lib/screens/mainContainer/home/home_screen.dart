import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/home/home_bloc.dart';
import 'package:rewards_app/screens/mainContainer/home/widgets/address_view.dart';
import 'package:rewards_app/screens/mainContainer/home/widgets/banner_view.dart';
import 'package:rewards_app/screens/mainContainer/home/widgets/follow_view.dart';
import 'package:rewards_app/screens/mainContainer/home/widgets/other_view.dart';
import 'package:rewards_app/screens/mainContainer/home/widgets/seperator.dart';
import 'package:rewards_app/screens/mainContainer/home/widgets/working_hours_view.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:rewards_app/utils/shared_methods.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _bloc = HomeBloc();

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
                width: 40,
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
              ),
              Expanded(child: Container())
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeBannerView(),
            const AddressView(),
            const SeperatorView(),
            const WorkingHoursView(),
            const SeperatorView(),
            InkWell(
              child: OtherViews(
                title: AppLocalizations.of(context)!.landline,
                imagename: "assets/images/phone.png",
              ),
              onTap: () => SharedMethods().callNumber("+97165251112"),
            ),
            const SeperatorView(),
            InkWell(
              child: OtherViews(
                title: AppLocalizations.of(context)!.mobilephone,
                imagename: "assets/images/mobile.png",
              ),
              onTap: () => SharedMethods().callNumber("+971561327448"),
            ),
            const SeperatorView(),
            InkWell(
              child: OtherViews(
                title: AppLocalizations.of(context)!.email_hint,
                imagename: "assets/images/email.png",
              ),
              onTap: () => SharedMethods().sendEmail("amwaj.centre@outlook.com"),
            ),
            const SeperatorView(),
            const FollowView(),
          ],
        ),
      ),
    );
  }
}
