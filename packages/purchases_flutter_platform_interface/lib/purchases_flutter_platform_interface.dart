import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:purchases_flutter_platform_interface/src/discount.dart';
import 'package:purchases_flutter_platform_interface/src/method_channel_purchases_flutter.dart';
import 'package:purchases_flutter_platform_interface/src/model/billing_feature.dart';
import 'package:purchases_flutter_platform_interface/src/model/intro_eligibility.dart';
import 'package:purchases_flutter_platform_interface/src/model/logIn_result.dart';
import 'package:purchases_flutter_platform_interface/src/model/purchase_type.dart';
import 'package:purchases_flutter_platform_interface/src/model/upgrade_info.dart';
import 'package:purchases_flutter_platform_interface/src/offerings_wrapper.dart';
import 'package:purchases_flutter_platform_interface/src/package_wrapper.dart';
import 'package:purchases_flutter_platform_interface/src/payment_discount.dart';
import 'package:purchases_flutter_platform_interface/src/product_wrapper.dart';
import 'package:purchases_flutter_platform_interface/src/purchaser_info_wrapper.dart';

/// Used to handle async updates from [Purchases].
/// Should be implemented to receive updates when the [PurchaserInfo] changes.
typedef void PurchaserInfoUpdateListener(PurchaserInfo purchaserInfo);

abstract class PurchasesFlutterPlatform extends PlatformInterface {
  PurchasesFlutterPlatform() : super(token: _token);
  static final Object _token = Object();

  static PurchasesFlutterPlatform _instance = MethodChannelPurchasesFlutter();

  static PurchasesFlutterPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [PurchasesFlutterPlatform] when they register themselves.
  static  set instance(PurchasesFlutterPlatform instance){
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

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
  Future<void>  setup(String apiKey, {String? appUserId, bool observerMode = false, String? userDefaultsSuiteName}){
    throw UnimplementedError('setup(String apiKey, {String? appUserId, bool observerMode = false, String? userDefaultsSuiteName}) has not been implemented.');
  }

  // Default to TRUE, set this to FALSE if you are consuming and acknowledging transactions outside of the Purchases SDK.
  ///
  /// [finishTransactions] The value to be passed to finishTransactions.
  ///
  Future<void>  setFinishTransactions(bool finishTransactions){
    throw UnimplementedError('setFinishTransactions(bool finishTransactions) has not been implemented.');
  }

  /// Sets a function to be called on updated purchaser info.
  ///
  /// The function is called right away with the latest purchaser info as soon
  /// as it's set.
  ///
  /// [purchaserInfoUpdateListener] PurchaserInfo update listener.
  void  addPurchaserInfoUpdateListener(PurchaserInfoUpdateListener purchaserInfoUpdateListener){
    throw UnimplementedError('addPurchaserInfoUpdateListener(PurchaserInfoUpdateListener purchaserInfoUpdateListener) has not been implemented.');
  }

  /// Removes a given PurchaserInfoUpdateListener
  ///
  /// [listenerToRemove] PurchaserInfoListener reference of the listener to remove.
  void  removePurchaserInfoUpdateListener(PurchaserInfoUpdateListener listenerToRemove){
    throw UnimplementedError('removePurchaserInfoUpdateListener(PurchaserInfoUpdateListener listenerToRemove) has not been implemented.');
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
  Future<Offerings>  getOfferings(){
    throw UnimplementedError('getOfferings() has not been implemented.');
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
  Future<List<Product>>  getProducts(List<String> productIdentifiers, {PurchaseType type = PurchaseType.subs}){
    throw UnimplementedError('getProducts(List<String> productIdentifiers, {PurchaseType type = PurchaseType.subs}) has not been implemented.');
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
  Future<PurchaserInfo>  purchaseProduct(String productIdentifier, {UpgradeInfo? upgradeInfo, PurchaseType type = PurchaseType.subs}){
    throw UnimplementedError('purchaseProduct(String productIdentifier, {UpgradeInfo? upgradeInfo, PurchaseType type = PurchaseType.subs}) has not been implemented.');
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
  Future<PurchaserInfo>  purchasePackage(Package packageToPurchase, {UpgradeInfo? upgradeInfo}){
    throw UnimplementedError('purchasePackage(Package packageToPurchase, {UpgradeInfo? upgradeInfo}) has not been implemented.');
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
  Future<PurchaserInfo>  purchaseDiscountedProduct(Product product, PaymentDiscount discount){
    throw UnimplementedError('purchaseDiscountedProduct(Product product, PaymentDiscount discount) has not been implemented.');
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
  Future<PurchaserInfo>  purchaseDiscountedPackage(Package packageToPurchase, PaymentDiscount discount){
    throw UnimplementedError('purchaseDiscountedPackage(Package packageToPurchase, PaymentDiscount discount) has not been implemented.');
  }

  /// Restores a user's previous purchases and links their appUserIDs to any
  /// user's also using those purchases.
  ///
  /// Returns a [PurchaserInfo] object, or throws a [PlatformException] if there
  /// was a problem restoring transactions.
  Future<PurchaserInfo>  restoreTransactions(){
    throw UnimplementedError('restoreTransactions() has not been implemented.');
  }

  /// Gets the current appUserID.
  Future<String> get appUserID{
    throw UnimplementedError("appUserID has not been implemented.");
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
  Future<LogInResult>  logIn(String appUserID){
    throw UnimplementedError('logIn(String appUserID) has not been implemented.');
  }

  /// Logs out the  Purchases client, clearing the saved appUserID. This will
  /// generate a random user id and save it in the cache.
  ///
  /// Returns a [PurchaserInfo] object, or throws a [PlatformException] if there
  /// was a problem restoring transactions or if the method is called while the
  /// current user is anonymous.
  Future<PurchaserInfo>  logOut(){
    throw UnimplementedError('logOut() has not been implemented.');
  }

  /// Enables/Disables debugs logs
  Future<void>  setDebugLogsEnabled(bool enabled){
    throw UnimplementedError('setDebugLogsEnabled(bool enabled) has not been implemented.');
  }

  ///
  /// iOS only. Set this property to true *only* when testing the ask-to-buy / SCA purchases flow.
  /// More information: http://errors.rev.cat/ask-to-buy
  ///
  Future<void>  setSimulatesAskToBuyInSandbox(bool enabled){
    throw UnimplementedError('setSimulatesAskToBuyInSandbox(bool enabled) has not been implemented.');
  }

  ///
  /// Set this property to your proxy URL before configuring Purchases *only* if you've received a proxy key value from your RevenueCat contact.
  ///
  Future<void>  setProxyURL(String url){
    throw UnimplementedError('setProxyURL(String url) has not been implemented.');
  }

  /// Gets current purchaser info, which will normally be cached.
  Future<PurchaserInfo>  getPurchaserInfo(){
    throw UnimplementedError('getPurchaserInfo() has not been implemented.');
  }

  ///  This method will send all the purchases to the RevenueCat backend.
  ///
  ///  **WARNING**: Call this when using your own implementation of in-app
  ///  purchases.
  ///
  ///  This method should be called anytime a sync is needed, like after a
  ///  successful purchase.
  Future<void>  syncPurchases(){
    throw UnimplementedError('syncPurchases() has not been implemented.');
  }

  /// iOS only. Enable automatic collection of Apple Search Ad attribution. Disabled by
  /// default
  Future<void>  setAutomaticAppleSearchAdsAttributionCollection(bool enabled){
    throw UnimplementedError('setAutomaticAppleSearchAdsAttributionCollection(bool enabled) has not been implemented.');
  }

  /// If the `appUserID` has been generated by RevenueCat
  Future<bool> get isAnonymous{
    throw UnimplementedError("appUserID has not been implemented.");
  }

  /// Returns `true` if RevenueCat has already been initialized through `setup()`.
  Future<bool> get isConfigured{
    throw UnimplementedError("appUserID has not been implemented.");
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
  Future<Map<String, IntroEligibility>>  checkTrialOrIntroductoryPriceEligibility(List<String> productIdentifiers){
    throw UnimplementedError('checkTrialOrIntroductoryPriceEligibility(List<String> productIdentifiers) has not been implemented.');
  }

  /// Invalidates the cache for purchaser information.
  ///
  /// Most apps will not need to use this method; invalidating the cache can leave your app in an invalid state.
  /// Refer to https://docs.revenuecat.com/docs/purchaserinfo#section-get-user-information for more information on
  /// using the cache properly.
  ///
  /// This is useful for cases where purchaser information might have been updated outside of the app, like if a
  /// promotional subscription is granted through the RevenueCat dashboard.
  Future<void>  invalidatePurchaserInfoCache(){
    throw UnimplementedError('invalidatePurchaserInfoCache() has not been implemented.');
  }

  /// iOS only. Presents a code redemption sheet, useful for redeeming offer codes
  /// Refer to https://docs.revenuecat.com/docs/ios-subscription-offers#offer-codes for more information on how
  /// to configure and use offer codes
  Future<void> presentCodeRedemptionSheet();


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
  Future<void>  setAttributes(Map<String, String> attributes){
    throw UnimplementedError('setAttributes(Map<String, String> attributes) has not been implemented.');
  }

  /// Subscriber attribute associated with the email address for the user
  ///
  /// [email] Empty String or null will delete the subscriber attribute.
  Future<void>  setEmail(String email){
    throw UnimplementedError('setEmail(String email) has not been implemented.');
  }

  /// Subscriber attribute associated with the phone number for the user
  ///
  /// [phoneNumber] Empty String or null will delete the subscriber attribute.
  Future<void>  setPhoneNumber(String phoneNumber){
    throw UnimplementedError('setPhoneNumber(String phoneNumber) has not been implemented.');
  }

  /// Subscriber attribute associated with the display name for the user
  ///
  /// [displayName] Empty String or null will delete the subscriber attribute.
  Future<void>  setDisplayName(String displayName){
    throw UnimplementedError('setDisplayName(String displayName) has not been implemented.');
  }

  /// Subscriber attribute associated with the push token for the user
  ///
  /// [pushToken] Empty String or null will delete the subscriber attribute.
  Future<void>  setPushToken(String pushToken){
    throw UnimplementedError('setPushToken(String pushToken) has not been implemented.');
  }

  /// Subscriber attribute associated with the Adjust Id for the user
  /// Required for the RevenueCat Adjust integration
  ///
  /// [adjustID] Empty String or null will delete the subscriber attribute.
  Future<void>  setAdjustID(String adjustID){
    throw UnimplementedError('setAdjustID(String adjustID) has not been implemented.');
  }

  /// Subscriber attribute associated with the Appsflyer Id for the user
  /// Required for the RevenueCat Appsflyer integration
  ///
  /// [appsflyerID] Empty String or null will delete the subscriber attribute.
  Future<void>  setAppsflyerID(String appsflyerID){
    throw UnimplementedError('setAppsflyerID(String appsflyerID) has not been implemented.');
  }

  /// Subscriber attribute associated with the Facebook SDK Anonymous Id for the user
  /// Recommended for the RevenueCat Facebook integration
  ///
  /// [fbAnonymousID] Empty String or null will delete the subscriber attribute.
  Future<void>  setFBAnonymousID(String fbAnonymousID){
    throw UnimplementedError('setFBAnonymousID(String fbAnonymousID) has not been implemented.');
  }

  /// Subscriber attribute associated with the mParticle Id for the user
  /// Recommended for the RevenueCat mParticle integration
  ///
  /// [mparticleID] Empty String or null will delete the subscriber attribute.
  Future<void>  setMparticleID(String mparticleID){
    throw UnimplementedError('setMparticleID(String mparticleID) has not been implemented.');
  }

  /// Subscriber attribute associated with the OneSignal Player Id for the user
  /// Required for the RevenueCat OneSignal integration
  ///
  /// [onesignalID] Empty String or null will delete the subscriber attribute.
  Future<void>  setOnesignalID(String onesignalID){
    throw UnimplementedError('setOnesignalID(String onesignalID) has not been implemented.');
  }

  /// Subscriber attribute associated with the Airship Channel Id for the user
  /// Required for the RevenueCat Airship integration
  ///
  /// [airshipChannelID] Empty String or null will delete the subscriber attribute.
  Future<void>  setAirshipChannelID(String airshipChannelID){
    throw UnimplementedError('setAirshipChannelID(String airshipChannelID) has not been implemented.');
  }

  /// Subscriber attribute associated with the install media source for the user
  ///
  /// [mediaSource] Empty String or null will delete the subscriber attribute.
  Future<void>  setMediaSource(String mediaSource){
    throw UnimplementedError('setMediaSource(String mediaSource) has not been implemented.');
  }

  /// Subscriber attribute associated with the install campaign for the user
  ///
  /// [campaign] Empty String or null will delete the subscriber attribute.
  Future<void>  setCampaign(String campaign){
    throw UnimplementedError('setCampaign(String campaign) has not been implemented.');
  }

  /// Subscriber attribute associated with the install ad group for the user
  ///
  /// [adGroup] Empty String or null will delete the subscriber attribute.
  Future<void>  setAdGroup(String adGroup){
    throw UnimplementedError('setAdGroup(String adGroup) has not been implemented.');
  }

  ///
  /// Subscriber attribute associated with the install ad for the user
  ///
  /// [ad] Empty String or null will delete the subscriber attribute.
  Future<void>  setAd(String ad){
    throw UnimplementedError('setAd(String ad) has not been implemented.');
  }

  /// Subscriber attribute associated with the install keyword for the user
  ///
  /// [keyword] Empty String or null will delete the subscriber attribute.
  Future<void>  setKeyword(String keyword){
    throw UnimplementedError('setKeyword(String keyword) has not been implemented.');
  }

  /// Subscriber attribute associated with the install ad creative for the user
  ///
  /// [creative] Empty String or null will delete the subscriber attribute.
  Future<void>  setCreative(String creative){
    throw UnimplementedError('setCreative(String creative) has not been implemented.');
  }

  /// Automatically collect subscriber attributes associated with the device identifiers
  /// $idfa, $idfv, $ip on iOS
  /// $gpsAdId, $androidId, $ip on Android
  Future<void>  collectDeviceIdentifiers(){
    throw UnimplementedError('collectDeviceIdentifiers() has not been implemented.');
  }

  /// Check if billing is supported for the current user (meaning IN-APP
  /// purchases are supported) and optionally, whether a list of specified
  /// feature types are supported.
  ///
  /// Note: BillingFeatures are only relevant to Google Play users.
  /// For other stores, BillingFeatures won't be checked.
  /// [features] An optional  list of [BillingFeature]s to check for support.
  /// By default, is an empty list and no feature support will be checked.
  Future<bool>  canMakePayments([List<BillingFeature> features = const []]){
    throw UnimplementedError('canMakePayments([List<BillingFeature> features = const []]) has not been implemented.');
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
  Future<PaymentDiscount>  getPaymentDiscount(Product product, Discount discount){
    throw UnimplementedError('getPaymentDiscount(Product product, Discount discount) has not been implemented.');
  }

  /// Android only. Call close when you are done with this instance of Purchases to disconnect
  /// from the billing services and clean up resources
  Future<void> close(){
    throw UnimplementedError('close() has not been implemented.');
  }

}
