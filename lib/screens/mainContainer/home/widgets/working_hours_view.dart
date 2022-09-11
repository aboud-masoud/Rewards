import 'package:flutter/material.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WorkingHoursView extends StatelessWidget {
  const WorkingHoursView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                "assets/images/Time.png",
                width: 18,
              ),
              const SizedBox(width: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width - 150,
                child: CustomText(
                  title: AppLocalizations.of(context)!.workHours,
                  maxLins: 2,
                  shouldFit: false,
                  style: CustomTextStyle().semibold(
                    size: 12,
                    color: const Color(0xff419aff),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 38),
              Expanded(
                child: CustomText(
                  title: AppLocalizations.of(context)!.friday,
                  shouldFit: false,
                  style: CustomTextStyle().medium(
                    size: 11,
                    color: const Color(0xff707070),
                  ),
                ),
              ),
              Expanded(
                child: CustomText(
                  title: AppLocalizations.of(context)!.closed,
                  shouldFit: false,
                  style: CustomTextStyle().medium(
                    size: 11,
                    color: const Color(0xff707070),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 38),
              Expanded(
                child: CustomText(
                  title: AppLocalizations.of(context)!.saturday,
                  shouldFit: false,
                  style: CustomTextStyle().medium(
                    size: 11,
                    color: const Color(0xff707070),
                  ),
                ),
              ),
              Expanded(
                child: CustomText(
                  title: "10:00 AM - 06:00 PM",
                  shouldFit: false,
                  style: CustomTextStyle().medium(
                    size: 11,
                    color: const Color(0xff707070),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 38),
              Expanded(
                child: CustomText(
                  title: AppLocalizations.of(context)!.sunday,
                  shouldFit: false,
                  style: CustomTextStyle().medium(
                    size: 11,
                    color: const Color(0xff707070),
                  ),
                ),
              ),
              Expanded(
                child: CustomText(
                  title: "10:00 AM - 06:00 PM",
                  shouldFit: false,
                  style: CustomTextStyle().medium(
                    size: 11,
                    color: const Color(0xff707070),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 38),
              Expanded(
                child: CustomText(
                  title: AppLocalizations.of(context)!.monday,
                  shouldFit: false,
                  style: CustomTextStyle().medium(
                    size: 11,
                    color: const Color(0xff707070),
                  ),
                ),
              ),
              Expanded(
                child: CustomText(
                  title: "11:30 AM - 08:30 PM",
                  shouldFit: false,
                  style: CustomTextStyle().medium(
                    size: 11,
                    color: const Color(0xff707070),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 38),
              Expanded(
                child: CustomText(
                  title: AppLocalizations.of(context)!.tuesday,
                  shouldFit: false,
                  style: CustomTextStyle().medium(
                    size: 11,
                    color: const Color(0xff707070),
                  ),
                ),
              ),
              Expanded(
                child: CustomText(
                  title: "11:30 AM - 08:30 PM",
                  shouldFit: false,
                  style: CustomTextStyle().medium(
                    size: 11,
                    color: const Color(0xff707070),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 38),
              Expanded(
                child: CustomText(
                  title: AppLocalizations.of(context)!.wednesday,
                  shouldFit: false,
                  style: CustomTextStyle().medium(
                    size: 11,
                    color: const Color(0xff707070),
                  ),
                ),
              ),
              Expanded(
                child: CustomText(
                  title: "11:30 AM - 08:30 PM",
                  shouldFit: false,
                  style: CustomTextStyle().medium(
                    size: 11,
                    color: const Color(0xff707070),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 38),
              Expanded(
                child: CustomText(
                  title: AppLocalizations.of(context)!.thursday,
                  shouldFit: false,
                  style: CustomTextStyle().medium(
                    size: 11,
                    color: const Color(0xff707070),
                  ),
                ),
              ),
              Expanded(
                child: CustomText(
                  title: "11:30 AM - 08:30 PM",
                  shouldFit: false,
                  style: CustomTextStyle().medium(
                    size: 11,
                    color: const Color(0xff707070),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
