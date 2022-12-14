import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rewards_app/app.dart';
import 'package:rewards_app/screens/login/login_screen.dart';
import 'package:rewards_app/screens/mainContainer/edit_profile/edit_profile_screen.dart';
import 'package:rewards_app/screens/mainContainer/profile/profile_bloc.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/utils/global_value.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  final _bloc = ProfileBloc();

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
                  showAreYouShoreDialog(context, () async {
                    await _bloc.deleteUser();
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (ctx) {
                      return LoginScreen();
                    }), (route) => false);
                  });
                },
                icon: const Icon(
                  Icons.no_accounts,
                  color: Color(0xff444444),
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
        child: ValueListenableBuilder<DeleteLoading>(
            valueListenable: _bloc.deleteAccountStatus,
            builder: (context, snapshot, child) {
              if (snapshot == DeleteLoading.loading) {
                return Container();
              } else {
                return StreamBuilder(
                    stream: _bloc.profile.snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                      if (streamSnapshot.hasData) {
                        final DocumentSnapshot documentSnapshot =
                            streamSnapshot.data!.docs.singleWhere((element) => element.id == userEmail);

                        mobileNumber1 = documentSnapshot["Mobile Number 1"] ?? "";
                        mobileNumber2 = documentSnapshot["Mobile Number 2"] ?? "";
                        fullname = documentSnapshot["full name"] ?? "";
                        gender = documentSnapshot["GenderEn"] ?? "";
                        address = documentSnapshot["Address"] ?? "";
                        nationality = documentSnapshot["NationalityEn"] ?? "";
                        dateOfBirth = documentSnapshot["Date Of Birth"] ?? "";
                        return Column(
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
                                      child: ValueListenableBuilder<PageLoading>(
                                          valueListenable: _bloc.reloadImageView,
                                          builder: (context, snapshotImage, child) {
                                            if (snapshotImage == PageLoading.none) {
                                              return FutureBuilder<String>(
                                                  future: _bloc.getDownloadURL(),
                                                  initialData: "",
                                                  builder: (context, futureSnapShot) {
                                                    return ClipOval(
                                                      child: futureSnapShot.data == ""
                                                          ? Image.asset("assets/images/blank-profile-picture.png",
                                                              fit: BoxFit.fill)
                                                          : FadeInImage(
                                                              fit: BoxFit.fill,
                                                              height: 90,
                                                              image: NetworkImage(futureSnapShot.data!),
                                                              placeholder: const AssetImage(
                                                                "assets/images/blank-profile-picture.png",
                                                              ),
                                                            ),
                                                    );
                                                  });
                                            } else {
                                              return const CircularProgressIndicator();
                                            }
                                          }),
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
                                              onPressed: () async {
                                                await showButtomSheet(context);
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
                                title: documentSnapshot["full name"],
                                style: CustomTextStyle().bold(size: 22, color: const Color(0xff3a4da7)),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Center(
                              child: CustomText(
                                title: documentSnapshot["email"],
                                style: CustomTextStyle().medium(size: 11, color: const Color(0xff707070)),
                              ),
                            ),
                            const SizedBox(height: 30),
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
                                    containtView(
                                        title: AppLocalizations.of(context)!.dateofBirth,
                                        desc: documentSnapshot["Date Of Birth"]),
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Container(height: 1, color: const Color(0xffe8ebef)),
                                    ),
                                    containtView(
                                        title: AppLocalizations.of(context)!.nationality,
                                        desc: languageSelected.value == "en"
                                            ? documentSnapshot["NationalityEn"]
                                            : documentSnapshot["NationalityAr"]),
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Container(height: 1, color: const Color(0xffe8ebef)),
                                    ),
                                    containtView(
                                        title: AppLocalizations.of(context)!.gender,
                                        desc: languageSelected.value == "en"
                                            ? documentSnapshot["GenderEn"]
                                            : documentSnapshot["GenderAr"]),
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Container(height: 1, color: const Color(0xffe8ebef)),
                                    ),
                                    containtView(
                                        title: AppLocalizations.of(context)!.mobileNumberone,
                                        desc: documentSnapshot["Mobile Number 1"]),
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Container(height: 1, color: const Color(0xffe8ebef)),
                                    ),
                                    containtView(
                                        title: AppLocalizations.of(context)!.mobileNumbertwo,
                                        desc: documentSnapshot["Mobile Number 2"]),
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Container(height: 1, color: const Color(0xffe8ebef)),
                                    ),
                                    containtView(
                                        title: AppLocalizations.of(context)!.address,
                                        desc: documentSnapshot["Address"]),
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Container(height: 1, color: const Color(0xffe8ebef)),
                                    ),
                                    containtView(
                                        title: AppLocalizations.of(context)!.firstEvaluationDate,
                                        desc: documentSnapshot["1 st Evaluation Date"]),
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Container(height: 1, color: const Color(0xffe8ebef)),
                                    ),
                                    containtView(
                                        title: AppLocalizations.of(context)!.firstTherapeuticDate,
                                        desc: documentSnapshot["1 st Therapeutic Session Date"]),
                                    Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Container(height: 1, color: const Color(0xffe8ebef)),
                                    ),
                                    containtView(
                                        title: AppLocalizations.of(context)!.therapeuticName,
                                        desc: documentSnapshot["Therapeutic Name"]),
                                    const SizedBox(height: 24),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      } else {
                        return const CircularProgressIndicator();
                      }
                    });
              }
            }),
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
            title: desc == "" ? "Empty" : desc,
            style: CustomTextStyle().medium(size: 14, color: const Color(0xff404040)),
          ),
        ],
      ),
    );
  }

  Future<Widget> showButtomSheet(BuildContext context) async {
    return await showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 0.5,
                  color: Colors.blueGrey,
                ),
              ),
              TextButton(
                onPressed: () async {
                  _bloc.reloadImageView.value = PageLoading.loading;
                  Navigator.of(context).pop();

                  await _bloc.picker.pickImage(source: ImageSource.camera).then((value) async {
                    final file = File(value!.path);
                    await _bloc.uploadFile(file).then((value) {
                      _bloc.reloadImageView.value = PageLoading.none;
                    });
                  });
                },
                child: Center(
                  child: CustomText(
                    title: AppLocalizations.of(context)!.camera,
                    style: CustomTextStyle().medium(size: 16, color: const Color(0xffababab)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 0.5,
                  color: Colors.blueGrey,
                ),
              ),
              TextButton(
                onPressed: () async {
                  _bloc.reloadImageView.value = PageLoading.loading;
                  Navigator.of(context).pop();

                  _bloc.picker.pickImage(source: ImageSource.gallery).then((value) async {
                    final file = File(value!.path);
                    await _bloc.uploadFile(file).then((value) {
                      _bloc.reloadImageView.value = PageLoading.none;
                    });
                  });
                },
                child: Center(
                  child: CustomText(
                    title: AppLocalizations.of(context)!.galary,
                    style: CustomTextStyle().medium(size: 16, color: const Color(0xffababab)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 0.5,
                  color: Colors.blueGrey,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Center(
                  child: CustomText(
                    title: AppLocalizations.of(context)!.cancel,
                    style: CustomTextStyle().medium(size: 16, color: const Color(0xffababab)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 0.5,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        });
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
      content: Row(
        children: [
          CustomText(
            title: AppLocalizations.of(context)!.delete1,
            shouldFit: false,
            style: CustomTextStyle().bold(size: 14, color: const Color(0xff404040)),
          ),
          const SizedBox(width: 2),
          CustomText(
            title: AppLocalizations.of(context)!.delete2,
            shouldFit: false,
            style: CustomTextStyle().bold(size: 14, color: Colors.red),
          ),
          const SizedBox(width: 2),
          CustomText(
            title: AppLocalizations.of(context)!.delete3,
            shouldFit: false,
            style: CustomTextStyle().bold(size: 14, color: const Color(0xff404040)),
          ),
        ],
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
