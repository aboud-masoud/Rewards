import 'package:flutter/material.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

class CustomButtonWidget extends StatelessWidget {
  final Function() onPress;
  final String title;
  final Color titleColor;
  final Color backgroundColor;
  final double widthSize;
  final bool isButtonRounded;
  final bool enable;
  final Color textColor;
  final double textSize;
  const CustomButtonWidget(
      {required this.title,
      this.titleColor = Colors.white,
      this.backgroundColor = const Color(0xff3bbc28),
      this.enable = true,
      this.widthSize = 175,
      this.isButtonRounded = false,
      required this.onPress,
      this.textColor = const Color(0xffffffff),
      this.textSize = 20,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: enable ? onPress : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          textStyle: CustomTextStyle().medium(size: textSize, color: textColor),
          foregroundColor: textColor,
          shape: isButtonRounded
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                )
              : null,
        ),
        child: SizedBox(
          width: widthSize,
          height: 50,
          child: Center(
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
