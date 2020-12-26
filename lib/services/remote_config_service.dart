import 'package:firebase/firebase.dart';

const String SAME_DAY_ORDER = "same_day_order";
const String ACTIVATE_DISH_REVIEWS = "activate_dish_reviews";
const String ACTIVATE_SECURE_PAYMENT_BADGES = "activate_secure_payment_badges";

class RemoteConfigService {
  final RemoteConfig _remoteConfig;
  final defaults = <String, dynamic>{
    SAME_DAY_ORDER: true,
    ACTIVATE_DISH_REVIEWS: true,
    ACTIVATE_SECURE_PAYMENT_BADGES: true,
  };

  static RemoteConfigService _instance;
  static RemoteConfigService get instance {
    if (_instance == null) {
      _instance = RemoteConfigService._(remoteConfig: remoteConfig());
    }

    return _instance;
  }

  bool get canOrderSameDay => _remoteConfig.getBoolean(SAME_DAY_ORDER);
  bool get showReviews => _remoteConfig.getBoolean(ACTIVATE_DISH_REVIEWS);
  bool get showSecurePaymentBadges =>
      _remoteConfig.getBoolean(ACTIVATE_SECURE_PAYMENT_BADGES);

  RemoteConfigService._({RemoteConfig remoteConfig})
      : _remoteConfig = remoteConfig;

  Future initialize({bool debugging = false}) async {
    try {
      _remoteConfig.defaultConfig = defaults;
      _remoteConfig.settings.fetchTimeoutMillis =
          debugging ? Duration(seconds: 5) : Duration(hours: 1);

      await _remoteConfig.fetchAndActivate();
    } catch (e) {
      print(
          'Unable to fetch remote config. Cached or default values will be used');
    }
  }
}
