import 'package:flutter/material.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

class CustomTextEditorField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? exampleText;
  final Function(String text)? onChange;
  final Function()? onTap;

  const CustomTextEditorField({
    required this.controller,
    required this.hintText,
    this.exampleText,
    this.onChange,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            enableSuggestions: false,
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 5,
            autocorrect: false,
            style: const TextStyle(fontSize: 12, color: Color(0xff191C1F)),
            controller: controller,
            cursorColor: const Color(0xff100C31),
            decoration: InputDecoration(
              label: CustomText(
                title: hintText,
                shouldFit: false,
                maxLins: 4,
                style: CustomTextStyle().medium(color: const Color(0xffababab), size: 12),
              ),
              filled: false,
              fillColor: const Color(0x00000000),
              border: const OutlineInputBorder(
                borderSide: BorderSide(),
              ),
            ),
            onChanged: (text) {
              if (onChange != null) {
                onChange!(text);
              }
            },
            onTap: () {
              if (onTap != null) {
                onTap!();
              }
            },
          ),
          exampleText != null
              ? CustomText(
                  title: exampleText,
                  style: CustomTextStyle().regular(size: 10, color: const Color(0xff707070)),
                )
              : Container(),
        ],
      ),
    );
  }
}
