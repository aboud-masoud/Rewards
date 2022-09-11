import 'package:flutter/material.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

class OtherViews extends StatelessWidget {
  final String imagename;
  final String title;
  const OtherViews({required this.title, required this.imagename, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Image.asset(
            imagename,
            width: 18,
          ),
          const SizedBox(width: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width - 150,
            child: CustomText(
              title: title,
              shouldFit: false,
              style: CustomTextStyle().medium(
                size: 12,
                color: const Color(0xff419aff),
              ),
            ),
          )
        ],
      ),
    );
  }
}
