import 'dart:io' show Platform;

import 'package:purchases_flutter/purchases_flutter.dart';

Future<void> configurePayment() async {
  await Purchases.setDebugLogsEnabled(true);

  late PurchasesConfiguration configuration;
  if (Platform.isAndroid) {
    configuration = PurchasesConfiguration('goog_oPKgxQJPQLNZBOGjojGNHzOIjar');
  } else if (Platform.isIOS) {
    // TODO: ios key
    configuration = PurchasesConfiguration("public_ios_sdk_key");
  }
  await Purchases.configure(
    configuration..appUserID = 'mock_user_id',
  );
}
