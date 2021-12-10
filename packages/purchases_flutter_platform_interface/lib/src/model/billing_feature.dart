/// Billing Feature types
enum BillingFeature {
  /// [https://developer.android.com/reference/com/android/
  /// billingclient/api/BillingClient.FeatureType#SUBSCRIPTIONS]
  subscriptions,

  /// [https://developer.android.com/reference/com/android/
  /// billingclient/api/BillingClient.FeatureType#SUBSCRIPTIONS_UPDATE]
  subscriptionsUpdate,

  /// [https://developer.android.com/reference/com/android/
  /// billingclient/api/BillingClient.FeatureType#IN_APP_ITEMS_ON_VR]
  inAppItemsOnVr,

  /// [https://developer.android.com/reference/com/android/
  /// billingclient/api/BillingClient.FeatureType#SUBSCRIPTIONS_ON_VR]
  subscriptionsOnVr,

  /// [https://developer.android.com/reference/com/android/
  /// billingclient/api/BillingClient.FeatureType#PRICE_CHANGE_CONFIRMATION]
  priceChangeConfirmation
}
