@JS()
library stripe;

import 'package:js/js.dart';

const String STRIPE_PUBLISHABLE_TEST_API_KEY =
    "pk_test_51Hqh6KLqOYf08FrUN84j9LT8dCAZaBHCZ6ds5iIyrgoCVGJpdwxPHQ40XT7UNXMHRrTQHVgWD8l8EumGpDhhBLgr00nlb7WFAM";
const String STRIPE_PUBLISHABLE_API_KEY =
    "pk_live_51Hqh6KLqOYf08FrU0G4JnZMHP582FQCEYSrox1QvfkzFH3P1B069mXnpahJLTDIVqilpBknA1alxUIIzHHAKHq7F00plQ9UXTB";

@JS()
class Stripe {
  external Stripe(String key);

  external Future<void> redirectToCheckout(CheckoutOptions options);
}

@JS()
@anonymous
class CheckoutOptions {
  external List<LineItem> get lineItems;

  external String get mode;

  external String get successUrl;

  external String get cancelUrl;

  external String get customerEmail;

  external String get sessionId;

  external factory CheckoutOptions({
    String sessionId,
    List<LineItem> lineItems,
    String mode,
    String successUrl,
    String cancelUrl,
    String customerEmail,
  });
}

@JS()
@anonymous
class LineItem {
  external String get price;

  external int get quantity;

  external factory LineItem({String price, int quantity});
}
