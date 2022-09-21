import 'package:flutter/material.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

class CustomTextEditorField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String text)? onChange;
  final Function()? onTap;

  const CustomTextEditorField({
    required this.controller,
    required this.hintText,
    this.onChange,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        enableSuggestions: false,
        keyboardType: TextInputType.multiline,
        minLines: 5,
        maxLines: 5,
        autocorrect: false,
        style: const TextStyle(fontSize: 14, color: Color(0xff191C1F)),
        controller: controller,
        cursorColor: const Color(0xff100C31),
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: CustomTextStyle()
              .medium(color: const Color(0xffababab), size: 16),
          filled: true,
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
    );
  }
}
