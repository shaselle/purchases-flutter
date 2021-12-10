/// Possible IntroEligibility status.
/// Use [checkTrialOrIntroductoryPriceEligibility] to determine the eligibility
enum IntroEligibilityStatus {
  /// RevenueCat doesn't have enough information to determine eligibility.
  introEligibilityStatusUnknown,

  /// The user is not eligible for a free trial or intro pricing for this product.
  introEligibilityStatusIneligible,

  /// The user is eligible for a free trial or intro pricing for this product.
  introEligibilityStatusEligible
}

/// Holds the introductory price status
class IntroEligibility {
  /// The introductory price eligibility status
  IntroEligibilityStatus status;

  /// Description of the status
  String description;

  /// Constructs an Transaction from a JSON object
  IntroEligibility.fromJson(Map<dynamic, dynamic> map)
      : status = IntroEligibilityStatus.values[map["status"]],
        description = map["description"];
}
