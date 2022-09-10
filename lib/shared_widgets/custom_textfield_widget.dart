import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? errorMessage;
  final bool enabled;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final List<TextInputFormatter>? inputFormatters;

  final Function(String text)? onChange;

  const CustomTextField({
    required this.controller,
    required this.hintText,
    this.errorMessage,
    this.enabled = true,
    this.obscureText = false,
    this.keyboardType,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters,
    this.onChange,
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
          errorText: errorMessage,
          labelText: hintText,
          labelStyle: CustomTextStyle().medium(color: const Color(0xff384048), size: 20),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffe8ebef)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffe8ebef)),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffe8ebef)),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: enabled ? const Color(0xffFFFFFF) : const Color(0xffFBFBFB),
        ),
        onChanged: (text) {
          if (onChange != null) {
            onChange!(text);
          }
        },
      ),
    );
  }
}
