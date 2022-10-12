import 'package:flutter/material.dart';
import 'package:rewards_app/utils/custom_text.dart';
import 'package:rewards_app/utils/custom_text_style.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomCheckBoxButtons extends StatefulWidget {
  final String hintMessage;
  final String? example;
  final List<String> options;
  final Function(List<String>) selectedOptions;
  final bool haveOther;

  const CustomCheckBoxButtons(
      {required this.hintMessage,
      required this.options,
      required this.selectedOptions,
      this.example,
      this.haveOther = false,
      super.key});

  @override
  State<CustomCheckBoxButtons> createState() => _CustomCheckBoxButtonsState();
}

class _CustomCheckBoxButtonsState extends State<CustomCheckBoxButtons> {
  List<bool> selectedBoxs = [];
  bool otherBoxSelected = false;
  List<String> list = [];

  TextEditingController controller = TextEditingController();
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
        height: (widget.haveOther && otherBoxSelected ? 83.0 : 65.0) * widget.options.length,
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
                  itemCount: widget.haveOther && otherBoxSelected ? widget.options.length + 1 : widget.options.length,
                  itemBuilder: (ctx, index) {
                    if (widget.haveOther && otherBoxSelected && index == widget.options.length) {
                      return Padding(
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
                            list.add(controller.text);
                            widget.selectedOptions(list);
                          },
                        ),
                      );
                    } else {
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
                          list = [];
                          setState(() {
                            selectedBoxs[index] = val!;

                            if (val) {
                              for (int i = 0; i <= selectedBoxs.length - 1; i++) {
                                if (selectedBoxs[i]) {
                                  list.add(widget.options[i]);
                                }
                              }
                            }

                            if (index == selectedBoxs.length - 1) {
                              if (val) {
                                otherBoxSelected = true;
                              } else {
                                otherBoxSelected = false;
                              }
                            }
                          });
                          widget.selectedOptions(list);
                        },
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
