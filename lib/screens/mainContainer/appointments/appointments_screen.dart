import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rewards_app/screens/mainContainer/appointments/appointments_bloc.dart';
import 'package:rewards_app/screens/mainContainer/appointments/assesment_session_screen.dart';
import 'package:rewards_app/shared_widgets/custom_button_widget.dart';
import 'package:rewards_app/utils/app_constants.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/utils/global_value.dart';

class ApotmentsScreen extends StatelessWidget {
  ApotmentsScreen({Key? key}) : super(key: key);

  final _bloc = AppointmentsBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff9f9f9),
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: const Color(0x00ffffff),
        title: CustomText(
          title: AppLocalizations.of(context)!.apotments,
          style: CustomTextStyle().semibold(size: 16, color: const Color(0xff707070)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            box(
                context: context,
                backgroundColor: const Color(0xffc193e9),
                imageName: "assets/images/Counseling.png",
                title: AppLocalizations.of(context)!.familyCounselingSession,
                desc: AppLocalizations.of(context)!.apotmentsTime,
                onTap: () async {
                  showAreYouShoreDialog(context, () async {
                    final email = await const FlutterSecureStorage().read(key: AppConstants.biometricU);
                    await _bloc.appointments.add({
                      "Email": email,
                      "Type": "Counseling",
                      "Date": DateTime.now(),
                      "mobile number 1": mobileNumber1,
                      "mobile number 2": mobileNumber2,
                      "Full name": fullname
                    });
                    showAlertDialog(context);
                  });
                }),
            const SizedBox(height: 20),
            box(
                context: context,
                backgroundColor: const Color(0xffe99393),
                imageName: "assets/images/Evaluation.png",
                title: AppLocalizations.of(context)!.evaluationSession,
                onTap: () async {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return const AssesmentSessionScreen();
                  }));
                }),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget box(
      {required BuildContext context,
      required Color backgroundColor,
      required String imageName,
      required String title,
      String? desc,
      required Function() onTap}) {
    return SizedBox(
        height: 321,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: InkWell(
            onTap: () => onTap(),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: backgroundColor,
                border: Border.all(color: const Color(0xffe8ebef)),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        imageName,
                        width: 275,
                      ),
                    ),
                    Expanded(child: Container()),
                    CustomText(
                      title: AppLocalizations.of(context)!.bookAn,
                      style: CustomTextStyle().regular(size: 16, color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    CustomText(
                      title: title,
                      style: CustomTextStyle().bold(size: 25, color: Colors.white),
                    ),
                    desc != null
                        ? CustomText(
                            title: desc,
                            style: CustomTextStyle().bold(size: 18, color: Colors.white),
                          )
                        : Container(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = CustomButtonWidget(
      title: AppLocalizations.of(context)!.okay,
      backgroundColor: const Color(0xff419aff),
      widthSize: MediaQuery.of(context).size.width,
      onPress: () => Navigator.of(context).pop(),
    );

    AlertDialog alert = AlertDialog(
      title: CustomText(
        title: AppLocalizations.of(context)!.apotmentsTitleDialog,
        maxLins: 2,
        shouldFit: false,
        style: CustomTextStyle().bold(size: 22, color: const Color(0xff404040)),
      ),
      content: CustomText(
        title: AppLocalizations.of(context)!.apotmentsDescDialog,
        maxLins: 2,
        shouldFit: false,
        style: CustomTextStyle().regular(size: 16, color: const Color(0xff404040)),
      ),
      actions: [
        okButton,
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
