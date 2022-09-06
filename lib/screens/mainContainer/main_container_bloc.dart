import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/home/home_screen.dart';
import 'package:rewards_app/screens/mainContainer/profile/profile_screen.dart';
import 'package:rewards_app/screens/mainContainer/rewards/rewards_screen.dart';
import 'package:rewards_app/screens/mainContainer/score/score_screen.dart';

class MainContainerBloc {
  int activeIndex = 0;
  TabController? controller;

  final ValueNotifier<int> currentTabIndexNotifier = ValueNotifier<int>(0);

  List<Widget> navTabs = [HomeScreen(), const RewardsScreen(), const ScoreScreen(), const ProfileScreen()];
}
