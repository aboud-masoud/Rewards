import 'package:flutter/material.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';

class CustomCheckBoxButtons extends StatefulWidget {
  final String hintMessage;
  final String? example;
  final List<String> options;
  final Function(List<String>) selectedOptions;

  const CustomCheckBoxButtons(
      {required this.hintMessage, required this.options, required this.selectedOptions, this.example, super.key});

  @override
  State<CustomCheckBoxButtons> createState() => _CustomCheckBoxButtonsState();
}
//TODO : Other Should show textField

class _CustomCheckBoxButtonsState extends State<CustomCheckBoxButtons> {
  List<bool> selectedBoxs = [];

  @override
  void initState() {
    selectedBoxs = List<bool>.filled(widget.options.length, false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: SizedBox(
        height: 63.0 * widget.options.length,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    title: widget.hintMessage,
                    style: CustomTextStyle().medium(size: 14, color: const Color(0xff707070)),
                  ),
                  widget.example != null
                      ? CustomText(
                          title: widget.example,
                          style: CustomTextStyle().medium(size: 10, color: const Color(0xff707070)),
                        )
                      : Container(),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.options.length,
                  itemBuilder: (ctx, index) {
                    return CheckboxListTile(
                      title: CustomText(
                        title: widget.options[index],
                        maxLins: 2,
                        style: CustomTextStyle().regular(
                          size: 11,
                          color: const Color(0xff707070),
                        ),
                        shouldFit: false,
                      ),
                      value: selectedBoxs[index],
                      onChanged: (val) {
                        print(val);
                        List<String> list = [];
                        setState(() {
                          selectedBoxs[index] = val!;

                          if (val) {
                            for (int i = 0; i <= selectedBoxs.length - 1; i++) {
                              if (selectedBoxs[i]) {
                                list.add(widget.options[i]);
                              }
                            }
                          }
                        });
                        widget.selectedOptions(list);
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
