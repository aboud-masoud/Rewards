import 'package:flutter/material.dart';

class SeperatorView extends StatelessWidget {
  const SeperatorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        height: 1,
        color: const Color(0xffe8ebef),
      ),
    );
  }
}
