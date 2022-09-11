import 'package:flutter/material.dart';
import 'package:rewards_app/screens/mainContainer/home/widgets/banner_view.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          HomeBannerView(),
        ],
      ),
    );
  }
}
