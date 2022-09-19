import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/appointments/appointments_screen.dart';
import 'package:rewards_app/screens/mainContainer/point/point_bloc.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

class PointScreen extends StatelessWidget {
  PointScreen({super.key});

  final _bloc = PointBloc();
  //TODO : handle this page

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
              Expanded(child: Container()),
              Center(
                child: CustomText(
                  title: AppLocalizations.of(context)!.tasks,
                  style: CustomTextStyle()
                      .semibold(size: 16, color: const Color(0xff707070)),
                ),
              ),
              Expanded(child: Container()),
              const SizedBox(width: 50),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xff3a4da7),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  CustomText(
                    title: AppLocalizations.of(context)!.task,
                    style:
                        CustomTextStyle().medium(size: 12, color: Colors.white),
                  ),
                  Expanded(child: Container()),
                  CustomText(
                    title: AppLocalizations.of(context)!.tasks,
                    style:
                        CustomTextStyle().medium(size: 12, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 255,
            child: ListView.builder(
                itemCount: 50,
                itemBuilder: (ctx, index) {
                  return tile(
                      context: ctx,
                      title:
                          "React to the posts on Amwaj’s public pages on face-book and Instagram.",
                      numberOfPoints: "1",
                      imageIcon: "assets/iconz/videoIcon.png");
                }),
          ),
        ],
      ),
    );
  }

  Widget tile(
      {required BuildContext context,
      required String title,
      required String numberOfPoints,
      required String imageIcon}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        color: const Color(0xfff2f2f2),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            children: [
              Image.asset(
                imageIcon,
                width: 18,
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: MediaQuery.of(context).size.width - 120,
                child: CustomText(
                  title: title,
                  maxLins: 2,
                  shouldFit: false,
                  style: CustomTextStyle()
                      .medium(size: 12, color: const Color(0xff3a4da7)),
                ),
              ),
              Expanded(child: Container()),
              CustomText(
                title: numberOfPoints,
                style: CustomTextStyle()
                    .medium(size: 12, color: const Color(0xff3a4da7)),
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}
