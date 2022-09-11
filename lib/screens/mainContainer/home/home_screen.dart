import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/home/home_bloc.dart';
import 'package:rewards_app/screens/mainContainer/home/widgets/address_view.dart';
import 'package:rewards_app/screens/mainContainer/home/widgets/banner_view.dart';
import 'package:rewards_app/screens/mainContainer/home/widgets/follow_view.dart';
import 'package:rewards_app/screens/mainContainer/home/widgets/other_view.dart';
import 'package:rewards_app/screens/mainContainer/home/widgets/seperator.dart';
import 'package:rewards_app/screens/mainContainer/home/widgets/working_hours_view.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _bloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeBannerView(),
            const AddressView(),
            const SeperatorView(),
            const WorkingHoursView(),
            const SeperatorView(),
            const OtherViews(
              title: "+971 6525 1112",
              imagename: "assets/images/phone.png",
            ),
            const SeperatorView(),
            const OtherViews(
              title: "0561327448",
              imagename: "assets/images/mobile.png",
            ),
            const SeperatorView(),
            const OtherViews(
              title: "amwaj.centre@outlook.com",
              imagename: "assets/images/email.png",
            ),
            const SeperatorView(),
            const FollowView(),
          ],
        ),
      ),
    );
  }
}
