import 'package:flutter/material.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

class CustomTextFieldWithDropDown extends StatelessWidget {
  final String hintMessage;
  final String value;
  final Function(String?)? onChanged;
  final List<String> items;
  final Widget prefixIcon;

  const CustomTextFieldWithDropDown({
    required this.hintMessage,
    required this.value,
    required this.onChanged,
    required this.items,
    required this.prefixIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          value != ''
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: CustomText(
                    title: hintMessage,
                    style: CustomTextStyle().regular(size: 12, color: const Color(0xff707070)),
                  ),
                )
              : Container(),
          FormField(builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(),
                ),
                prefixIcon: prefixIcon,
                labelStyle: CustomTextStyle().regular(size: 12),
                errorStyle: CustomTextStyle().regular(color: Colors.redAccent, size: 12),
                hintText: hintMessage,
                hintStyle: CustomTextStyle().regular(size: 12),
              ),
              isEmpty: value == '',
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: value == "" ? null : value,
                  isDense: true,
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      // value = newValue;
                      onChanged!(newValue);
                      state.didChange(newValue);
                    }
                  },
                  items: items.map((String item) => DropdownMenuItem<String>(child: Text(item), value: item)).toList(),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> itemsList(List<String> items) {
    List<DropdownMenuItem<String>> list = [];

    for (var x in items) {
      list.add(DropdownMenuItem<String>(
        value: x,
        child: Text(x),
      ));
    }

    return list;
  }
}
