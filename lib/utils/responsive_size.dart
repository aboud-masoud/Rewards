import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

enum SelectedDevice { PHONE, TABLET, BROWSER }

class ResponsiveTextSize {
  double textSize(double? size) {
    if (size == null) {
      size = 14;
    }
    if (Responsive.selectedDevice() == SelectedDevice.TABLET) {
      return size + 5;
    }

    if (Responsive.isSmall()) {
      return size - 3;
    } else {
      return size;
    }
  }
}

class Responsive extends StatelessWidget {
  final Widget? small;
  final Widget? large;
  static double devicePixelRatio = ui.window.devicePixelRatio;
  static final ui.Size size = ui.window.physicalSize;
  static double get width => size.width;
  static double get height => size.height;

  Responsive({
    Key? key,
    this.small,
    this.large,
  }) : super(key: key);

  // static bool isSmall(BuildContext context) => MediaQuery.of(context).size.height <= 600;
  static bool isSmall() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window).size.height <= 700;
  }

  static SelectedDevice selectedDevice() {
    if (kIsWeb) {
      return SelectedDevice.BROWSER;
    }
    if (devicePixelRatio < 2 && (width >= 1000 || height >= 1000)) {
      return SelectedDevice.TABLET;
    } else if (devicePixelRatio == 2 && (width >= 1920 || height >= 1920)) {
      return SelectedDevice.TABLET;
    } else {
      return SelectedDevice.PHONE;
    }
  }

  @override
  Widget build(BuildContext context) {
    //final Size _size = MediaQuery.of(context).size;
    if (selectedDevice() == SelectedDevice.PHONE) {
      return small!;
    } else {
      return large!;
    }
  }
}
