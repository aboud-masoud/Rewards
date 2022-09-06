import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/main_container_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return ValueListenableBuilder<int>(
        valueListenable: _bloc.currentTabIndexNotifier,
        builder: (context, index, child) {
          return Scaffold(
            backgroundColor: Colors.blue,
            body: SafeArea(
              child: IndexedStack(
                index: index,
                children: _bloc.navTabs,
              ),
            ),
            bottomNavigationBar: ConvexAppBar(
              style: TabStyle.flip,
              controller: _bloc.controller,
              backgroundColor: Colors.red,
              top: -20,
              height: 55,
              items: [
                TabItem(
                  icon: Icons.home,
                  title: AppLocalizations.of(context)!.bottom_tabbar_home,
                ),
                TabItem(
                  icon: Icons.holiday_village_sharp,
                  title: AppLocalizations.of(context)!.bottom_tabbar_rewards,
                ),
                TabItem(
                  icon: Icons.receipt,
                  title: AppLocalizations.of(context)!.bottom_tabbar_score,
                ),
                TabItem(
                  icon: Icons.person,
                  title: AppLocalizations.of(context)!.bottom_tabbar_profile,
                ),
              ],
              initialActiveIndex: 0,
              onTap: (int index) {
                _bloc.currentTabIndexNotifier.value = index;
                // if (index == 1 || index == 2 || index == 3) {
                //   // Get.to(() => const LoginFirstStepScreen())?.then((value) {
                //   //   _bloc.currentTabIndexNotifier.value = 0;
                //   //   controller!.index = 0;
                //   // });
                // }
              },
            ),
          );
        });
  }
}
