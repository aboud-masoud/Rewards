import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/appointments/appointments_screen.dart';
import 'package:rewards_app/screens/mainContainer/edit_profile/edit_profile_screen.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        backgroundColor: const Color(0x00ffffff),
        elevation: 0,
        title: Container(
          color: const Color(0x00ffffff),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return ApotmentsScreen();
                  }));
                },
                icon: Image.asset(
                  "assets/images/calendar_profile_icon.png",
                  width: 18,
                ),
              ),
              CustomText(
                title: AppLocalizations.of(context)!.profile,
                style: CustomTextStyle().semibold(size: 16, color: const Color(0xff707070)),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return EditProfileScreen();
                  }));
                },
                icon: Image.asset(
                  "assets/images/edit_profile_icon.png",
                  width: 18,
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xffe8ebef)),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(4), // Border radius
                      child: ClipOval(child: Image.asset("assets/images/blank-profile-picture.png")),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: const Color(0xffe8ebef)),
                        borderRadius: const BorderRadius.all(Radius.circular(20)),
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(4), // Border radius
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff419aff),
                              border: Border.all(color: const Color(0xff419aff)),
                              borderRadius: const BorderRadius.all(Radius.circular(20)),
                            ),
                            child: IconButton(
                              onPressed: () {
                                //TODO
                              },
                              icon: Image.asset(
                                "assets/images/edit_img_icon.png",
                                // width: 9,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 26),
            Center(
              child: CustomText(
                title: "Ronnie Hudson",
                style: CustomTextStyle().bold(size: 22, color: const Color(0xff3a4da7)),
              ),
            ),
            const SizedBox(height: 4),
            Center(
              child: CustomText(
                title: "tyler.roberts@mail.com",
                style: CustomTextStyle().medium(size: 11, color: const Color(0xff707070)),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xffe8ebef)),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    containtView(title: AppLocalizations.of(context)!.clientFullName, desc: "Ronnie Hudson Jeremy Wade"),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(height: 1, color: const Color(0xffe8ebef)),
                    ),
                    containtView(title: AppLocalizations.of(context)!.dateofBirth, desc: "12 SEP 1991"),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(height: 1, color: const Color(0xffe8ebef)),
                    ),
                    containtView(title: AppLocalizations.of(context)!.nationality, desc: "Jordanian"),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(height: 1, color: const Color(0xffe8ebef)),
                    ),
                    containtView(title: AppLocalizations.of(context)!.gender, desc: "Male"),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(height: 1, color: const Color(0xffe8ebef)),
                    ),
                    containtView(title: AppLocalizations.of(context)!.firstEvaluationDate, desc: "12 SEP 1991"),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(height: 1, color: const Color(0xffe8ebef)),
                    ),
                    containtView(title: AppLocalizations.of(context)!.firstTherapeuticDate, desc: "12 SEP 1991"),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(height: 1, color: const Color(0xffe8ebef)),
                    ),
                    containtView(title: AppLocalizations.of(context)!.therapeuticName, desc: "Mr. Baraa Alshab"),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget containtView({required String title, required String desc}) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title: title,
            style: CustomTextStyle().medium(size: 11, color: const Color(0xffababab)),
          ),
          const SizedBox(height: 6),
          CustomText(
            title: desc,
            style: CustomTextStyle().medium(size: 14, color: const Color(0xff404040)),
          ),
        ],
      ),
    );
  }
}
