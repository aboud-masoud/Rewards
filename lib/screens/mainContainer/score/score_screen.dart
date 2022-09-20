import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rewards_app/app.dart';
import 'package:rewards_app/screens/mainContainer/appointments/appointments_screen.dart';
import 'package:rewards_app/screens/mainContainer/score/score_bloc.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/utils/global_value.dart';

class ScoreScreen extends StatelessWidget {
  ScoreScreen({Key? key}) : super(key: key);

  final _bloc = ScoreBloc();

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
                  title: AppLocalizations.of(context)!.score,
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
          const SizedBox(height: 40),
          Center(
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    "assets/images/tag.png",
                    width: MediaQuery.of(context).size.width - 100,
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 65),
                      StreamBuilder(
                          stream: _bloc.profilesScore.snapshots(),
                          builder: (context,
                              AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                            final DocumentSnapshot documentSnapshot =
                                streamSnapshot.data!.docs.singleWhere(
                                    (element) => element.id == userEmail);
                            return CustomText(
                              title: documentSnapshot["points"],
                              style: CustomTextStyle()
                                  .bold(size: 70, color: Colors.white),
                            );
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(child: Container()),
          CustomText(
            title: AppLocalizations.of(context)!.replaceyourpointswith,
            style: CustomTextStyle()
                .bold(size: 16, color: const Color(0xff3a4da7)),
          ),
          const SizedBox(height: 20),
          StreamBuilder(
              stream: _bloc.scores.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  final documentSnapshot = streamSnapshot.data!.docs;
                  Color theColor = _bloc.getRandomColor();
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: theColor,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                            ),
                            width: MediaQuery.of(context).size.width - 100,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    title: languageSelected.value == "en"
                                        ? documentSnapshot[index]["stringEn"]
                                        : documentSnapshot[index]["stringAr"],
                                    shouldFit: false,
                                    maxLins: 4,
                                    style: CustomTextStyle()
                                        .medium(size: 16, color: Colors.white),
                                  ),
                                  Expanded(child: Container()),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomButtonWidget(
                                          widthSize: 80,
                                          backgroundColor: Colors.white,
                                          isButtonRounded: true,
                                          title: AppLocalizations.of(context)!
                                              .replacetext,
                                          textColor: theColor,
                                          textSize: 15,
                                          onPress: () {
                                            //TODO : handle press to replace
                                          }),
                                      CustomText(
                                        title: documentSnapshot[index]
                                            ["points"],
                                        style: CustomTextStyle().bold(
                                            size: 35, color: Colors.white),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: documentSnapshot.length,
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              })
        ],
      ),
    );
  }
}
