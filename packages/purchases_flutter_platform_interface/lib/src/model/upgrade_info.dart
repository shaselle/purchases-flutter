

import 'package:purchases_flutter_platform_interface/src/model/proration_mode.dart';

/// This class holds the information used when upgrading from another sku.
/// To be used with purchaseProduct and purchasePackage.
class UpgradeInfo {
  /// The oldSKU to upgrade from.
  String oldSKU;

  /// The [ProrationMode] to use when upgrading the given oldSKU.
  ProrationMode? prorationMode;

  /// Constructs an UpgradeInfo
  UpgradeInfo(this.oldSKU, {this.prorationMode});
}
