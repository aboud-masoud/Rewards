import 'package:flutter/material.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rewards_app/utils/shared_methods.dart';

class AddressView extends StatelessWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () => SharedMethods()
            .openMap(latitude: 25.310699622122698, longitude: 55.37293264232896), //TODO :Test Handle Open Google Map

        child: Row(
          children: [
            Image.asset(
              "assets/images/Location.png",
              width: 18,
            ),
            const SizedBox(width: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width - 150,
              child: CustomText(
                title: AppLocalizations.of(context)!.locationAddress,
                maxLins: 2,
                shouldFit: false,
                style: CustomTextStyle().medium(
                  size: 12,
                  color: const Color(0xff707070),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
