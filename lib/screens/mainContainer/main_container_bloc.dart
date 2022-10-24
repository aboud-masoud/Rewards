import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rewards_app/models/tabs.dart';
import 'package:rewards_app/screens/mainContainer/appointments/appointments_screen.dart';
import 'package:rewards_app/screens/mainContainer/home/home_screen.dart';
import 'package:rewards_app/screens/mainContainer/profile/profile_screen.dart';
import 'package:rewards_app/screens/mainContainer/score/score_screen.dart';

enum SelectedTab { home, profile, rewards, score, none }

class MainContainerBloc {
  int activeIndex = 0;
  TabController? controller;

  int currentTabIndex = 0;
  int previousTabIndex = 0;
  StreamController<SelectedTab?> currentTabIndexController = StreamController<SelectedTab?>.broadcast();

  List<Widget> navTabs = [
    HomeScreen(),
    ProfileScreen(),
    ApotmentsScreen(),
    ScoreScreen(),
  ];

  final tabs = [
    MyTab(
      imageNotSelected: Image.asset(
        'assets/images/Home_icon.png',
        scale: 4,
      ),
      imageSelected: Image.asset(
        'assets/images/Home_icon_selected.png',
        scale: 3,
      ),
    ),
    MyTab(
      imageNotSelected: Image.asset(
        'assets/images/Profile_icon.png',
        scale: 4,
      ),
      imageSelected: Image.asset(
        'assets/images/Profile_icon_selected.png',
        scale: 3,
      ),
    ),
    MyTab(
      imageNotSelected: Image.asset(
        'assets/images/Rewards_icon.png',
        scale: 4,
      ),
      imageSelected: Image.asset(
        'assets/images/Rewards_icon_selected.png',
        scale: 3,
      ),
    ),
    MyTab(
      imageNotSelected: Image.asset(
        'assets/images/score_icon.png',
        scale: 4,
      ),
      imageSelected: Image.asset(
        'assets/images/score_icon_selected.png',
        scale: 3,
      ),
    ),
  ];

  int getSelectedIndexDependOnTab(SelectedTab? tab) {
    switch (tab) {
      case SelectedTab.home:
        return 0;
      case SelectedTab.profile:
        return 1;
      case SelectedTab.rewards:
        return 2;
      case SelectedTab.score:
        return 3;
      default:
        return currentTabIndex;
    }
  }

  SelectedTab getSelectedTabDependOnIndex(int index) {
    switch (index) {
      case 0:
        return SelectedTab.home;
      case 1:
        return SelectedTab.profile;
      case 2:
        return SelectedTab.rewards;
      case 3:
        return SelectedTab.score;
      default:
        return SelectedTab.none;
    }
  }

  Future changeTabToIndex(int index) {
    if (currentTabIndex != index) {
      previousTabIndex = currentTabIndex;
      currentTabIndex = index;
      currentTabIndexController.sink.add(getSelectedTabDependOnIndex(currentTabIndex));
    }
    return Future.value(true);
  }
}
