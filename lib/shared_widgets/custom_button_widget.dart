import 'package:flutter/material.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

class CustomButtonWidget extends StatelessWidget {
  final Function() onPress;
  final String title;
  final Color titleColor;
  final bool enable;
  const CustomButtonWidget({required this.title, this.titleColor = Colors.white, this.enable = true, required this.onPress, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: enable ? onPress : null,
        style: ElevatedButton.styleFrom(primary: const  Color(0xff3bbc28), textStyle: CustomTextStyle().medium(size: 20)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: Center(
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
