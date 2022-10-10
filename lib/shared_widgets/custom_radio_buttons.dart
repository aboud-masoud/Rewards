import 'package:flutter/material.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

class CustomRadioButtons extends StatefulWidget {
  final String hintMessage;
  final String option1;
  final String option2;
  final String? option3;
  final String? option4;
  final String? option5;

  final Function(String) selectedOption;

  const CustomRadioButtons({
    required this.hintMessage,
    required this.option1,
    required this.option2,
    this.option3,
    this.option4,
    this.option5,
    required this.selectedOption,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomRadioButtons> createState() => _CustomRadioButtonsState();
}

class _CustomRadioButtonsState extends State<CustomRadioButtons> {
  int val = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SizedBox(
        height: widget.option5 != null
            ? 270
            : widget.option4 != null
                ? 220
                : widget.option3 != null
                    ? 170
                    : 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: CustomText(
                title: widget.hintMessage,
                style: CustomTextStyle().medium(size: 14, color: const Color(0xff707070)),
              ),
            ),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {
                      val = value as int;
                      widget.selectedOption(widget.option1);
                    });
                  },
                  activeColor: Colors.green,
                ),
                CustomText(
                  title: widget.option1,
                  style: CustomTextStyle().regular(size: 12, color: const Color(0xff707070)),
                )
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: val,
                  onChanged: (value) {
                    setState(() {
                      val = value as int;
                      widget.selectedOption(widget.option2);
                    });
                  },
                  activeColor: Colors.green,
                ),
                CustomText(
                  title: widget.option2,
                  style: CustomTextStyle().regular(size: 12, color: const Color(0xff707070)),
                ),
              ],
            ),
            widget.option3 != null
                ? Row(
                    children: [
                      Radio(
                        value: 3,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = value as int;
                            widget.selectedOption(widget.option3!);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                      CustomText(
                        title: widget.option3,
                        style: CustomTextStyle().regular(size: 12, color: const Color(0xff707070)),
                      ),
                    ],
                  )
                : Container(),
            widget.option4 != null
                ? Row(
                    children: [
                      Radio(
                        value: 4,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = value as int;
                            widget.selectedOption(widget.option4!);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                      CustomText(
                        title: widget.option4,
                        style: CustomTextStyle().regular(size: 12, color: const Color(0xff707070)),
                      ),
                    ],
                  )
                : Container(),
            widget.option5 != null
                ? Row(
                    children: [
                      Radio(
                        value: 3,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = value as int;
                            widget.selectedOption(widget.option5!);
                          });
                        },
                        activeColor: Colors.green,
                      ),
                      CustomText(
                        title: widget.option5,
                        style: CustomTextStyle().regular(size: 12, color: const Color(0xff707070)),
                      ),
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
