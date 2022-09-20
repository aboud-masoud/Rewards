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
                            _bloc.currentUserScore =
                                int.parse(documentSnapshot["points"]);

                            return CustomText(
                              title: _bloc.currentUserScore.toString(),
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
                        final int cardScore =
                            int.parse(documentSnapshot[index]["points"]);
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
                                          onPress: () async {
                                            showAreYouShoreDialog(context,
                                                () async {
                                              if (cardScore <=
                                                  _bloc.currentUserScore) {
                                                _bloc.currentUserScore =
                                                    _bloc.currentUserScore -
                                                        cardScore;

                                                await _bloc.profilesScore
                                                    .doc(userEmail)
                                                    .update({
                                                  "points":
                                                      "${_bloc.currentUserScore}"
                                                });

                                                await _bloc.requestScoreExchange
                                                    .add(
                                                  {
                                                    "email": userEmail,
                                                    "exchange with":
                                                        documentSnapshot[index]
                                                            ["stringEn"],
                                                    "number of point discounted":
                                                        cardScore,
                                                    "number of point the user still have":
                                                        _bloc.currentUserScore,
                                                    "date": DateTime.now(),
                                                  },
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                  content: Text(AppLocalizations
                                                          .of(context)!
                                                      .youdonthaveenighscore),
                                                ));
                                              }
                                            });
                                          }),
                                      CustomText(
                                        title: cardScore.toString(),
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

  showAreYouShoreDialog(BuildContext context, Function okSelected) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text(AppLocalizations.of(context)!.cancel),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text(AppLocalizations.of(context)!.okay),
      onPressed: () {
        Navigator.of(context).pop();
        okSelected();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: CustomText(
        title: AppLocalizations.of(context)!.areyousuretitle,
        shouldFit: false,
        style: CustomTextStyle().bold(size: 22, color: const Color(0xff404040)),
      ),
      content: CustomText(
        title: AppLocalizations.of(context)!.areyousurescoremessage,
        maxLins: 2,
        shouldFit: false,
        style:
            CustomTextStyle().regular(size: 16, color: const Color(0xff404040)),
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
