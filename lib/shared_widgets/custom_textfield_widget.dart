import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool enabled;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool readOnly;

  final List<TextInputFormatter>? inputFormatters;

  final Function(String text)? onChange;
  final Function()? onTap;

  const CustomTextField({
    required this.controller,
    required this.hintText,
    this.enabled = true,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.onChange,
    this.onTap,
    this.readOnly = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: TextField(
        obscureText: obscureText,
        enabled: enabled,
        enableSuggestions: false,
        autocorrect: false,
        readOnly: readOnly,
        style: enabled
            ? const TextStyle(fontSize: 14, color: Color(0xff191C1F))
            : const TextStyle(
                fontSize: 14,
                color: Color(0xff898989),
              ),
        controller: controller,
        keyboardType: keyboardType,
        cursorColor: const Color(0xff100C31),
        decoration: InputDecoration(
          labelText: hintText,
          labelStyle: CustomTextStyle()
              .medium(color: const Color(0xffababab), size: 16),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
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
