import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/appointments/appointments_screen.dart';
import 'package:rewards_app/screens/mainContainer/score/score_bloc.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ScoreScreen extends StatelessWidget {
  ScoreScreen({Key? key}) : super(key: key);

  final _bloc = ScoreBloc();

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
                  title: AppLocalizations.of(context)!.score,
                  style: CustomTextStyle().semibold(size: 16, color: const Color(0xff707070)),
                ),
              ),
              Expanded(child: Container()),
              const SizedBox(width: 50),
            ],
          ),
        ),
      ),
    );
  }
}
