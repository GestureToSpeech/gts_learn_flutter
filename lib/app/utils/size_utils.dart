import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

extension DeviceSizeExtensions on BuildContext {
  Future<bool> isTablet() async {
    if (Platform.isIOS) {
      final deviceInfo = DeviceInfoPlugin();
      final iosInfo = await deviceInfo.iosInfo;

      return iosInfo.model?.toLowerCase() == 'ipad';
    } else {
      // The equivalent of the "smallestWidth" qualifier on Android.
      final shortestSide = MediaQuery.of(this).size.shortestSide;

      // Determine if we should use mobile layout or not, 600 here is
      // a common breakpoint for a typical 7-inch tablet.
      return shortestSide > 600;
    }
  }
}
