import 'package:purchases_flutter_platform_interface/purchases_flutter_model.dart';
import 'package:purchases_flutter_platform_interface/purchases_flutter_platform_interface.dart';

/// Entry point for Purchases.
class Purchases {
  /// Sets up Purchases with your API key and an app user id.
  ///
  /// [apiKey] RevenueCat API Key.
  ///
  /// [appUserID] An optional unique id for identifying the user.
  ///
  /// [observerMode] An optional boolean. Set this to TRUE if you have your own
  /// IAP implementation and want to use only RevenueCat's backend.
  /// Default is FALSE.
  ///
  /// [userDefaultsSuiteName] iOS-only, will be ignored for Android.
  /// Set this if you would like the RevenueCat SDK to store its preferences in a different
  /// NSUserDefaults suite, otherwise it will use standardUserDefaults.
  /// Default is null, which will make the SDK use standardUserDefaults.
  static Future<void> setup(String apiKey, {String? appUserId, bool observerMode = false, String? userDefaultsSuiteName}) async {
    return await PurchasesFlutterPlatform.instance.setup(apiKey, appUserId: appUserId, userDefaultsSuiteName: userDefaultsSuiteName);
  }

  // Default to TRUE, set this to FALSE if you are consuming and acknowledging transactions outside of the Purchases SDK.
  ///
  /// [finishTransactions] The value to be passed to finishTransactions.
  ///
  static Future<void> setFinishTransactions(bool finishTransactions) async {
    await PurchasesFlutterPlatform.instance.setFinishTransactions(finishTransactions);
  }

  /// Sets a function to be called on updated purchaser info.
  ///
  /// The function is called right away with the latest purchaser info as soon
  /// as it's set.
  ///
  /// [purchaserInfoUpdateListener] PurchaserInfo update listener.
  static void addPurchaserInfoUpdateListener(PurchaserInfoUpdateListener purchaserInfoUpdateListener) async {
     PurchasesFlutterPlatform.instance.addPurchaserInfoUpdateListener(purchaserInfoUpdateListener);
  }

  /// Removes a given PurchaserInfoUpdateListener
  ///
  /// [listenerToRemove] PurchaserInfoListener reference of the listener to remove.
  static void removePurchaserInfoUpdateListener(PurchaserInfoUpdateListener listenerToRemove) async {
    PurchasesFlutterPlatform.instance.removePurchaserInfoUpdateListener(listenerToRemove);
  }

  /// Fetch the configured offerings for this users. Offerings allows you to
  /// configure your in-app products via RevenueCat and greatly simplifies
  /// management. See [the guide](https://docs.revenuecat.com/offerings) for
  /// more info.
  ///
  /// Offerings will be fetched and cached on instantiation so that, by the time
  /// they are needed, your prices are loaded for your purchase flow.
  ///
  /// Time is money.
  static Future<Offerings> getOfferings() async {
    return PurchasesFlutterPlatform.instance.getOfferings();
  }

  /// Fetch the product info. Returns a list of products or throws an error if
  /// the products are not properly configured in RevenueCat or if there is
  /// another error while retrieving them.
  ///
  /// [productIdentifiers] Array of product identifiers
  ///
  /// [type] If the products are Android INAPPs, this needs to be
  /// PurchaseType.INAPP otherwise the products won't be found.
  /// PurchaseType.Subs by default. This parameter only has effect in Android.
  static Future<List<Product>> getProducts(List<String> productIdentifiers, {PurchaseType type = PurchaseType.subs}) async {
    return await PurchasesFlutterPlatform.instance.getProducts(productIdentifiers, type: type);
  }

  /// Makes a purchase. Returns a [PurchaserInfo] object. Throws a
  /// [PlatformException] if the purchase is unsuccessful.
  /// Check if `PurchasesErrorHelper.getErrorCode(e)` is
  /// `PurchasesErrorCode.purchaseCancelledError` to check if the user cancelled
  /// the purchase.
  ///
  /// [productIdentifier] The product identifier of the product you want to
  /// purchase.
  ///
  /// [upgradeInfo] Android only. Optional UpgradeInfo you wish to upgrade from
  /// containing the oldSKU and the optional prorationMode.
  ///
  /// [type] If the product is an Android INAPP, this needs to be
  /// PurchaseType.INAPP otherwise the product won't be found.
  /// PurchaseType.Subs by default. This parameter only has effect in Android.
  static Future<PurchaserInfo> purchaseProduct(String productIdentifier, {UpgradeInfo? upgradeInfo, PurchaseType type = PurchaseType.subs}) async {
    return await PurchasesFlutterPlatform.instance.purchaseProduct(productIdentifier,type: type);
  }

  /// Makes a purchase. Returns a [PurchaserInfo] object. Throws a
  /// [PlatformException] if the purchase is unsuccessful.
  /// Check if `PurchasesErrorHelper.getErrorCode(e)` is
  /// `PurchasesErrorCode.purchaseCancelledError` to check if the user cancelled
  /// the purchase.
  ///
  /// [packageToPurchase] The Package you wish to purchase
  ///
  /// [upgradeInfo] Android only. Optional UpgradeInfo you wish to upgrade from
  /// containing the oldSKU and the optional prorationMode.
  static Future<PurchaserInfo> purchasePackage(Package packageToPurchase, {UpgradeInfo? upgradeInfo}) async {
    return await PurchasesFlutterPlatform.instance.purchasePackage(packageToPurchase, upgradeInfo: upgradeInfo);
  }

  /// iOS only. Purchase a product applying a given discount.
  ///
  /// Returns a [PurchaserInfo] object. Throws a
  /// [PlatformException] if the purchase is unsuccessful.
  /// Check if `PurchasesErrorHelper.getErrorCode(e)` is
  /// `PurchasesErrorCode.purchaseCancelledError` to check if the user cancelled
  /// the purchase.
  ///
  /// [product] The product to purchase.
  ///
  /// [paymentDiscount] Discount to apply to the product. Retrieve this discount
  /// using [getPaymentDiscount].
  static Future<PurchaserInfo> purchaseDiscountedProduct(Product product, PaymentDiscount discount) async {
    return await PurchasesFlutterPlatform.instance.purchaseDiscountedProduct(product, discount);
  }

  /// iOS only. Purchase a package applying a given discount.
  ///
  /// Returns a [PurchaserInfo] object. Throws a
  /// [PlatformException] if the purchase is unsuccessful.
  /// Check if `PurchasesErrorHelper.getErrorCode(e)` is
  /// `PurchasesErrorCode.purchaseCancelledError` to check if the user cancelled
  /// the purchase.
  ///
  /// [packageToPurchase] The Package you wish to purchase
  ///
  /// [paymentDiscount] Discount to apply to the product. Retrieve this discount
  /// using [getPaymentDiscount].
  static Future<PurchaserInfo> purchaseDiscountedPackage(Package packageToPurchase, PaymentDiscount discount) async {
    return await PurchasesFlutterPlatform.instance.purchaseDiscountedPackage(packageToPurchase, discount);
  }

  /// Restores a user's previous purchases and links their appUserIDs to any
  /// user's also using those purchases.
  ///
  /// Returns a [PurchaserInfo] object, or throws a [PlatformException] if there
  /// was a problem restoring transactions.
  static Future<PurchaserInfo> restoreTransactions() async {
    return await PurchasesFlutterPlatform.instance.restoreTransactions();
  }

  /// Gets the current appUserID.
  static Future<String> get appUserID async {
    return await PurchasesFlutterPlatform.instance.appUserID;
  }


  /// This function will logIn the current user with an appUserID.
  /// Typically this would be used after logging in a user to identify them without
  /// calling configure
  ///
  /// Returns a [LogInResult] object, or throws a [PlatformException] if there
  /// was a problem restoring transactions. LogInResult holds a PurchaserInfo object
  /// and a bool that can be used to know if a user has just been created for the first time.
  ///
  /// [newAppUserID] The appUserID that should be linked to the currently user
  static Future<LogInResult> logIn(String appUserID) async {
    return await PurchasesFlutterPlatform.instance.logIn(appUserID);
  }


  /// Logs out the  Purchases client, clearing the saved appUserID. This will
  /// generate a random user id and save it in the cache.
  ///
  /// Returns a [PurchaserInfo] object, or throws a [PlatformException] if there
  /// was a problem restoring transactions or if the method is called while the
  /// current user is anonymous.
  static Future<PurchaserInfo> logOut() async {
    return await PurchasesFlutterPlatform.instance.logOut();
  }

  /// Enables/Disables debugs logs
  static Future<void> setDebugLogsEnabled(bool enabled) async {
    return await PurchasesFlutterPlatform.instance.setDebugLogsEnabled(enabled);
  }

  ///
  /// iOS only. Set this property to true *only* when testing the ask-to-buy / SCA purchases flow.
  /// More information: http://errors.rev.cat/ask-to-buy
  ///
  static Future<void> setSimulatesAskToBuyInSandbox(bool enabled) async {
    return await PurchasesFlutterPlatform.instance.setSimulatesAskToBuyInSandbox(enabled);
  }

  ///
  /// Set this property to your proxy URL before configuring Purchases *only* if you've received a proxy key value from your RevenueCat contact.
  ///
  static Future<void> setProxyURL(String url) async {
    return await PurchasesFlutterPlatform.instance.setProxyURL(url);
  }

  /// Gets current purchaser info, which will normally be cached.
  static Future<PurchaserInfo> getPurchaserInfo() async {
    return await PurchasesFlutterPlatform.instance.getPurchaserInfo();
  }

  ///  This method will send all the purchases to the RevenueCat backend.
  ///
  ///  **WARNING**: Call this when using your own implementation of in-app
  ///  purchases.
  ///
  ///  This method should be called anytime a sync is needed, like after a
  ///  successful purchase.
  static Future<void> syncPurchases() async {
    return await PurchasesFlutterPlatform.instance.syncPurchases();
  }

  /// iOS only. Enable automatic collection of Apple Search Ad attribution. Disabled by
  /// default
  static Future<void> setAutomaticAppleSearchAdsAttributionCollection(bool enabled) async {
    return await PurchasesFlutterPlatform.instance.setAutomaticAppleSearchAdsAttributionCollection(enabled);
  }

  /// If the `appUserID` has been generated by RevenueCat
  static Future<bool> get isAnonymous async {
    return await PurchasesFlutterPlatform.instance.isAnonymous;
  }

  /// Returns `true` if RevenueCat has already been intialized through `setup()`.
  static Future<bool> get isConfigured async {
    return await PurchasesFlutterPlatform.instance.isConfigured;
  }

  /// iOS only. Computes whether or not a user is eligible for the introductory
  /// pricing period of a given product. You should use this method to determine
  /// whether or not you show the user the normal product price or the
  /// introductory price. This also applies to trials (trials are considered a
  /// type of introductory pricing).
  ///
  /// @note Subscription groups are automatically collected for determining
  /// eligibility. If RevenueCat can't definitively compute the eligibility,
  /// most likely because of missing group information, it will return
  /// `introEligibilityStatusUnknown`. The best course of action on unknown
  /// status is to display the non-intro pricing, to not create a misleading
  /// situation. To avoid this, make sure you are testing with the latest
  /// version of iOS so that the subscription group can be collected by the SDK.
  /// Android always returns introEligibilityStatusUnknown.
  ///
  /// [productIdentifiers] Array of product identifiers
  static Future<Map<String, IntroEligibility>> checkTrialOrIntroductoryPriceEligibility(List<String> productIdentifiers) async {
    return await PurchasesFlutterPlatform.instance.checkTrialOrIntroductoryPriceEligibility(productIdentifiers);
  }

  /// Invalidates the cache for purchaser information.
  ///
  /// Most apps will not need to use this method; invalidating the cache can leave your app in an invalid state.
  /// Refer to https://docs.revenuecat.com/docs/purchaserinfo#section-get-user-information for more information on
  /// using the cache properly.
  ///
  /// This is useful for cases where purchaser information might have been updated outside of the app, like if a
  /// promotional subscription is granted through the RevenueCat dashboard.
  static Future<void> invalidatePurchaserInfoCache() async {
    return await PurchasesFlutterPlatform.instance.invalidatePurchaserInfoCache();
  }

  /// iOS only. Presents a code redemption sheet, useful for redeeming offer codes
  /// Refer to https://docs.revenuecat.com/docs/ios-subscription-offers#offer-codes for more information on how
  /// to configure and use offer codes
  static Future<void> presentCodeRedemptionSheet() async {
    return await PurchasesFlutterPlatform.instance.presentCodeRedemptionSheet();
  }

  ///================================================================================
  /// Subscriber Attributes
  ///================================================================================

  /// Subscriber attributes are useful for storing additional, structured information on a user.
  /// Since attributes are writable using a public key they should not be used for
  /// managing secure or sensitive information such as subscription status, coins, etc.
  ///
  /// Key names starting with "$" are reserved names used by RevenueCat. For a full list of key
  /// restrictions refer to our guide: https://docs.revenuecat.com/docs/subscriber-attributes
  ///
  /// [attributes] Map of attributes by key. Set the value as an empty string to delete an attribute.
  static Future<void> setAttributes(Map<String, String> attributes) async {
    await PurchasesFlutterPlatform.instance.setAttributes(attributes);
  }

  /// Subscriber attribute associated with the email address for the user
  ///
  /// [email] Empty String or null will delete the subscriber attribute.
  static Future<void> setEmail(String email) async {
    await PurchasesFlutterPlatform.instance.setEmail(email);
  }

  /// Subscriber attribute associated with the phone number for the user
  ///
  /// [phoneNumber] Empty String or null will delete the subscriber attribute.
  static Future<void> setPhoneNumber(String phoneNumber) async {
    await PurchasesFlutterPlatform.instance.setPhoneNumber(phoneNumber);
  }

  /// Subscriber attribute associated with the display name for the user
  ///
  /// [displayName] Empty String or null will delete the subscriber attribute.
  static Future<void> setDisplayName(String displayName) async {
    await PurchasesFlutterPlatform.instance.setDisplayName(displayName);
  }

  /// Subscriber attribute associated with the push token for the user
  ///
  /// [pushToken] Empty String or null will delete the subscriber attribute.
  static Future<void> setPushToken(String pushToken) async {
    await PurchasesFlutterPlatform.instance.setPushToken(pushToken);
  }

  /// Subscriber attribute associated with the Adjust Id for the user
  /// Required for the RevenueCat Adjust integration
  ///
  /// [adjustID] Empty String or null will delete the subscriber attribute.
  static Future<void> setAdjustID(String adjustID) async {
    await PurchasesFlutterPlatform.instance.setAdjustID(adjustID);
  }

  /// Subscriber attribute associated with the Appsflyer Id for the user
  /// Required for the RevenueCat Appsflyer integration
  ///
  /// [appsflyerID] Empty String or null will delete the subscriber attribute.
  static Future<void> setAppsflyerID(String appsflyerID) async {
    await PurchasesFlutterPlatform.instance.setAppsflyerID(appsflyerID);
  }

  /// Subscriber attribute associated with the Facebook SDK Anonymous Id for the user
  /// Recommended for the RevenueCat Facebook integration
  ///
  /// [fbAnonymousID] Empty String or null will delete the subscriber attribute.
  static Future<void> setFBAnonymousID(String fbAnonymousID) async {
    await PurchasesFlutterPlatform.instance.setFBAnonymousID(fbAnonymousID);
  }

  /// Subscriber attribute associated with the mParticle Id for the user
  /// Recommended for the RevenueCat mParticle integration
  ///
  /// [mparticleID] Empty String or null will delete the subscriber attribute.
  static Future<void> setMparticleID(String mparticleID) async {
    await PurchasesFlutterPlatform.instance.setMparticleID(mparticleID);
  }

  /// Subscriber attribute associated with the OneSignal Player Id for the user
  /// Required for the RevenueCat OneSignal integration
  ///
  /// [onesignalID] Empty String or null will delete the subscriber attribute.
  static Future<void> setOnesignalID(String onesignalID) async {
    await PurchasesFlutterPlatform.instance.setOnesignalID(onesignalID);
  }

  /// Subscriber attribute associated with the Airship Channel Id for the user
  /// Required for the RevenueCat Airship integration
  ///
  /// [airshipChannelID] Empty String or null will delete the subscriber attribute.
  static Future<void> setAirshipChannelID(String airshipChannelID) async {
    await PurchasesFlutterPlatform.instance.setAirshipChannelID(airshipChannelID);
  }

  /// Subscriber attribute associated with the install media source for the user
  ///
  /// [mediaSource] Empty String or null will delete the subscriber attribute.
  static Future<void> setMediaSource(String mediaSource) async {
    await PurchasesFlutterPlatform.instance.setMediaSource(mediaSource);
  }

  /// Subscriber attribute associated with the install campaign for the user
  ///
  /// [campaign] Empty String or null will delete the subscriber attribute.
  static Future<void> setCampaign(String campaign) async {
    await PurchasesFlutterPlatform.instance.setCampaign(campaign);
  }

  /// Subscriber attribute associated with the install ad group for the user
  ///
  /// [adGroup] Empty String or null will delete the subscriber attribute.
  static Future<void> setAdGroup(String adGroup) async {
    await PurchasesFlutterPlatform.instance.setAdGroup(adGroup);
  }

  ///
  /// Subscriber attribute associated with the install ad for the user
  ///
  /// [ad] Empty String or null will delete the subscriber attribute.
  static Future<void> setAd(String ad) async {
    await PurchasesFlutterPlatform.instance.setAd(ad);
  }

  /// Subscriber attribute associated with the install keyword for the user
  ///
  /// [keyword] Empty String or null will delete the subscriber attribute.
  static Future<void> setKeyword(String keyword) async {
    await PurchasesFlutterPlatform.instance.setKeyword(keyword);
  }

  /// Subscriber attribute associated with the install ad creative for the user
  ///
  /// [creative] Empty String or null will delete the subscriber attribute.
  static Future<void> setCreative(String creative) async {
    await PurchasesFlutterPlatform.instance.setCreative(creative);
  }

  /// Automatically collect subscriber attributes associated with the device identifiers
  /// $idfa, $idfv, $ip on iOS
  /// $gpsAdId, $androidId, $ip on Android
  static Future<void> collectDeviceIdentifiers() async {
    await PurchasesFlutterPlatform.instance.collectDeviceIdentifiers();
  }

  /// Check if billing is supported for the current user (meaning IN-APP
  /// purchases are supported) and optionally, whether a list of specified
  /// feature types are supported.
  ///
  /// Note: BillingFeatures are only relevant to Google Play users.
  /// For other stores, BillingFeatures won't be checked.
  /// [features] An optional  list of [BillingFeature]s to check for support.
  /// By default, is an empty list and no feature support will be checked.
  static Future<bool> canMakePayments([List<BillingFeature> features = const []]) async {
    return await PurchasesFlutterPlatform.instance.canMakePayments(features);
  }

  /// iOS only. Use this function to retrieve the `PurchasesPaymentDiscount`
  /// for a given `PurchasesPackage`.
  ///
  /// Returns a [PaymentDiscount] object. Pass this object
  /// to [purchaseDiscountedProduct] or [purchaseDiscountedPackage] to complete
  /// the purchase. A null PaymentDiscount means
  ///
  /// [product] The `Product` the user intends to purchase.
  ///
  /// [discount] The `Discount` to apply to the product.
  static Future<PaymentDiscount> getPaymentDiscount(Product product, Discount discount) async {
    return await PurchasesFlutterPlatform.instance.getPaymentDiscount(product, discount);
  }

  /// Android only. Call close when you are done with this instance of Purchases to disconnect
  /// from the billing services and clean up resources
  static Future<void> close() async {
    await PurchasesFlutterPlatform.instance.close();
  }
}
