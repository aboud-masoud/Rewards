import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rewards_app/app.dart';
import 'package:rewards_app/models/points_model.dart';
import 'package:rewards_app/screens/mainContainer/appointments/appointments_screen.dart';
import 'package:rewards_app/screens/mainContainer/point/point_bloc.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

class PointScreen extends StatelessWidget {
  PointScreen({super.key});

  final _bloc = PointBloc();

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
                  style: CustomTextStyle().semibold(size: 16, color: const Color(0xff707070)),
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
                    style: CustomTextStyle().medium(size: 12, color: Colors.white),
                  ),
                  Expanded(child: Container()),
                  CustomText(
                    title: AppLocalizations.of(context)!.tasks,
                    style: CustomTextStyle().medium(size: 12, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          StreamBuilder(
              stream: _bloc.points.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.hasData) {
                  List<QueryDocumentSnapshot<Object?>> documentSnapshot = streamSnapshot.data!.docs;
                  return Expanded(
                    child: ListView.builder(
                        itemCount: documentSnapshot.length,
                        itemBuilder: (ctx, index) {
                          Points item = Points.fromJson(documentSnapshot[index].data() as Map<String, dynamic>);
                          return tile(
                              context: ctx,
                              title: languageSelected.value == "en" ? item.stringEn ?? "" : item.stringAr ?? "",
                              numberOfPoints: item.points ?? "",
                              imageIcon: (item.image != null
                                  ? "assets/iconz/${item.image}.png"
                                  : "assets/iconz/videoIcon.png"),
                              desc: languageSelected.value == "en" ? item.descEn ?? "" : item.descAr ?? "",
                              lessThan70: item.lessThan70 ?? "",
                              between7090: item.between7080 ?? "",
                              moreThan: item.more90 ?? "");
                        }),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ],
      ),
    );
  }

  Widget tile(
      {required BuildContext context,
      required String title,
      required String numberOfPoints,
      required String imageIcon,
      required String desc,
      required String lessThan70,
      required String between7090,
      required String moreThan}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
      child: Container(
        height: desc != "" ? 140 : 50,
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
                child: desc != ""
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: title,
                            maxLins: 2,
                            shouldFit: false,
                            style: CustomTextStyle().medium(size: 12, color: const Color(0xff3a4da7)),
                          ),
                          const SizedBox(height: 5),
                          CustomText(
                            title: desc,
                            maxLins: 2,
                            shouldFit: false,
                            style: CustomTextStyle().regular(size: 10, color: const Color(0xff404040)),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            color: const Color(0xff419aff),
                            width: MediaQuery.of(context).size.width - 100,
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  title: "Less than 70%",
                                  shouldFit: false,
                                  style: CustomTextStyle().regular(size: 10, color: Colors.white),
                                ),
                                CustomText(
                                  title: "70% - 89",
                                  shouldFit: false,
                                  style: CustomTextStyle().regular(size: 10, color: Colors.white),
                                ),
                                CustomText(
                                  title: "90% or more",
                                  shouldFit: false,
                                  style: CustomTextStyle().regular(size: 10, color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          Container(
                            color: const Color(0xf0419aff).withOpacity(0.2),
                            width: MediaQuery.of(context).size.width - 100,
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  title: lessThan70,
                                  shouldFit: false,
                                  style: CustomTextStyle().regular(size: 10, color: const Color(0xff404040)),
                                ),
                                CustomText(
                                  title: between7090,
                                  shouldFit: false,
                                  style: CustomTextStyle().regular(size: 10, color: const Color(0xff404040)),
                                ),
                                CustomText(
                                  title: moreThan,
                                  shouldFit: false,
                                  style: CustomTextStyle().regular(size: 10, color: const Color(0xff404040)),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    : CustomText(
                        title: title,
                        maxLins: 2,
                        shouldFit: false,
                        style: CustomTextStyle().medium(size: 12, color: const Color(0xff3a4da7)),
                      ),
              ),
              Expanded(child: Container()),
              numberOfPoints != ""
                  ? CustomText(
                      title: numberOfPoints,
                      style: CustomTextStyle().medium(size: 12, color: const Color(0xff3a4da7)),
                    )
                  : Container(),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}
