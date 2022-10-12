import 'package:flutter/material.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomRadioButtons extends StatefulWidget {
  final String hintMessage;
  final String option1;
  final String option2;
  final String? option3;
  final String? option4;
  final String? option5;
  final bool haveOther;

  final Function(String) selectedOption;

  const CustomRadioButtons({
    required this.hintMessage,
    required this.option1,
    required this.option2,
    this.option3,
    this.option4,
    this.option5,
    required this.selectedOption,
    this.haveOther = false,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomRadioButtons> createState() => _CustomRadioButtonsState();
}

class _CustomRadioButtonsState extends State<CustomRadioButtons> {
  int val = -1;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SizedBox(
        height: widget.option5 != null
            ? widget.haveOther && val == 5
                ? 329
                : 285
            : widget.option4 != null
                ? 235
                : widget.option3 != null
                    ? 185
                    : 135,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: CustomText(
                title: widget.hintMessage,
                maxLins: 2,
                shouldFit: false,
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
                ? Column(
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 5,
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
                      ),
                      widget.haveOther && val == 5
                          ? Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                              child: TextField(
                                controller: controller,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: InputDecoration(
                                  labelText: AppLocalizations.of(context)!.otherfield,
                                  labelStyle: CustomTextStyle().medium(color: const Color(0xffababab), size: 12),
                                ),
                                onEditingComplete: () {
                                  widget.selectedOption(controller.text);
                                },
                              ),
                            )
                          : Container()
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
