/// Replace SKU's ProrationMode.
enum ProrationMode {
  /// The Upgrade or Downgrade policy is unknown.
  unknownSubscriptionUpgradeDowngradePolicy,

  /// Replacement takes effect immediately, and the remaining time will be
  /// prorated and credited to the user. This is the current default behavior.
  immediateWithTimeProration,

  /// Replacement takes effect immediately, and the billing cycle remains the
  /// same. The price for the remaining period will be charged. This option is
  /// only available for subscription upgrade.
  immediateAndChargeProratedPrice,

  /// Replacement takes effect immediately, and the new price will be charged on
  /// next recurrence time. The billing cycle stays the same.
  immediateWithoutProration,

  /// Replacement takes effect when the old plan expires, and the new price will
  /// be charged at the same time.
  deferred
}
