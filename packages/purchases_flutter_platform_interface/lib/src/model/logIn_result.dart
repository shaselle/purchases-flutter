

import 'package:purchases_flutter_platform_interface/src/purchaser_info_wrapper.dart';

/// Class used to hold the result of the logIn method
class LogInResult {
  /// true if the logged in user has been created in the
  /// RevenueCat backend for the first time
  final bool created;

  /// the purchaserInfo associated to the logged in user
  final PurchaserInfo purchaserInfo;

  /// Constructs a LogInResult with its properties
  LogInResult({required this.created, required this.purchaserInfo});
}
