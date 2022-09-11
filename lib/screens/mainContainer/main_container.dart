import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/main_container_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

class MainContainer extends StatefulWidget {
  const MainContainer({Key? key}) : super(key: key);

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  final _bloc = MainContainerBloc();

  void changeActivePage(int index) {
    setState(() {
      _bloc.activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0x00ffffff),
        elevation: 0,
        title: Container(
          color: const Color(0x00ffffff),
          child: Row(
            children: [
              Image.asset(
                "assets/images/logo.png",
                width: 48,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: AppLocalizations.of(context)!.amwajCenter,
                    style: CustomTextStyle().semibold(size: 16, color: const Color(0xff3bbc28)),
                  ),
                  CustomText(
                    title: AppLocalizations.of(context)!.amwajCentersubtitle,
                    style: CustomTextStyle().medium(size: 12, color: const Color(0xff707070)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: StreamBuilder<SelectedTab?>(
          initialData: _bloc.getSelectedTabDependOnIndex(_bloc.currentTabIndex),
          stream: _bloc.currentTabIndexController.stream,
          builder: (context, snapshot) {
            return IndexedStack(
              index: _bloc.getSelectedIndexDependOnTab(snapshot.data),
              children: _bloc.navTabs,
            );
          }),
      bottomNavigationBar: StreamBuilder<SelectedTab?>(
          initialData: _bloc.getSelectedTabDependOnIndex(_bloc.currentTabIndex),
          stream: _bloc.currentTabIndexController.stream,
          builder: (context, snapshot) {
            return BottomNavigationBar(
              iconSize: 15,
              backgroundColor: Colors.white,
              unselectedItemColor: const Color(0xffababab),
              selectedItemColor: const Color(0xff419aff),
              type: BottomNavigationBarType.fixed,
              currentIndex: _bloc.getSelectedIndexDependOnTab(snapshot.data),
              onTap: (int index) async {
                await _bloc.changeTabToIndex(index);
              },
              showSelectedLabels: true,
              items: [
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      const SizedBox(height: 2),
                      _bloc.getSelectedIndexDependOnTab(snapshot.data) == 0
                          ? _bloc.tabs[0].imageSelected!
                          : _bloc.tabs[0].imageNotSelected!,
                    ],
                  ),
                  label: AppLocalizations.of(context)!.home,
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      const SizedBox(height: 2),
                      _bloc.getSelectedIndexDependOnTab(snapshot.data) == 1
                          ? _bloc.tabs[1].imageSelected!
                          : _bloc.tabs[1].imageNotSelected!,
                    ],
                  ),
                  label: AppLocalizations.of(context)!.profile,
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      const SizedBox(height: 2),
                      _bloc.getSelectedIndexDependOnTab(snapshot.data) == 2
                          ? _bloc.tabs[2].imageSelected!
                          : _bloc.tabs[2].imageNotSelected!,
                    ],
                  ),
                  label: AppLocalizations.of(context)!.rewards,
                ),
                BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      const SizedBox(height: 2),
                      _bloc.getSelectedIndexDependOnTab(snapshot.data) == 3
                          ? _bloc.tabs[3].imageSelected!
                          : _bloc.tabs[3].imageNotSelected!,
                    ],
                  ),
                  label: AppLocalizations.of(context)!.score,
                ),
              ],
            );
          }),
    );
  }
}
